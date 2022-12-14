package com.pcwk.ehr.member.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.cmn.MessageVO;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.member.domain.MemberVO;
import com.pcwk.ehr.member.service.MemberService;

@Controller("signupController")
@RequestMapping("signup")
public class SignupController {

	final Logger LOG = LogManager.getLogger(getClass());

	@Autowired
	MemberService memberService;
	
	
	
	final String VIEW_NAME = "member/signup";

	public SignupController() {
	}

	// 화면
	@RequestMapping(value = "/signup.do")
	public String singup() {
		LOG.debug("┌=============================┐");
		LOG.debug("|signup=                      |");
		LOG.debug("└=============================┘");

		return VIEW_NAME;
	}

	
	@RequestMapping(value = "upDeleteAll.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String upDeleteAll(HttpServletRequest req) throws SQLException {
		String jsonString = "";
		String memberidStr = req.getParameter("memberid");
		LOG.debug("┌=============================┐");
		LOG.debug("|memberid=" + memberidStr);
		List<MemberVO> list = new ArrayList<MemberVO>();

		// 다건
		if (memberidStr.indexOf(",") != -1) {
			String[] userArray = memberidStr.split(",");
			for (String memberid : userArray) {
				MemberVO tmpVO = new MemberVO();
				tmpVO.setMemberid(memberid);

				list.add(tmpVO);
			}
			// 한건
		} else {
			MemberVO tmpVO = new MemberVO();
			tmpVO.setMemberid(memberidStr);

			list.add(tmpVO);
		}

		int delCnt = this.memberService.upDeleteAll(list);

		String message = "";
		if (0 == delCnt) {
			message = "삭제 실패!";
		} else {
			message = memberidStr + "가 삭제 되었습니다.";
		}

		jsonString = new Gson().toJson(new MessageVO(String.valueOf(delCnt), message));
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");

		return jsonString;
	}

	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String idCheck(MemberVO inVO) throws SQLException {
		String jsonString = "";

		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		int cnt = memberService.idCheck(inVO);
		LOG.debug("|cnt=" + cnt);

		String message = "";
		if (1 == cnt) {
			message = inVO.getMemberid() + "는 중복되었습니다.";
		} else {
			message = inVO.getMemberid() + "는 사용 가능합니다.";
		}

		jsonString = new Gson().toJson(new MessageVO(String.valueOf(cnt), message));
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");

		return jsonString;
	}
	


	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doRetrieve(SearchVO inVO) throws SQLException {
		String jsonString = "";
		// 페이지 사이즈(default =10)
		if (0 == inVO.getPageSize()) {
			inVO.setPageSize(10);
		}

		// 페이지 번호(default =1)
		if (0 == inVO.getPageNo()) {
			inVO.setPageNo(1);
		}

		// 검색구분(default ="")
		if (null == inVO.getSearchDiv()) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv()));
		}

		// 검색어(default ="")
		if (null == inVO.getSearchWord()) {
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord()));
		}

		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		List<MemberVO> list = memberService.doRetrieve(inVO);

		jsonString = new Gson().toJson(list);
		/*
		 * JSON 값
		 * 
		 * 문자열 (string) { "site":"cafe" } 숫자 (number) { "year":2022} 객체 (object)
		 * {"UserVO":{"msgId":"1","msgContents":"p99_01수정 되었습니다.","totalCnt":0,"num":0}}
		 * 배열 (array) 참거짓 (boolean) { "member":true } 널 (null) { "point":null }
		 */
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");

		return jsonString;
	}

	@RequestMapping(value = "/doUpdate.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doUpdate(MemberVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		int flag = memberService.doUpdate(inVO);

		String message = "";// json으로 전달할 메시지
		if (1 == flag) {
			message = inVO.getMemberid() + "수정 되었습니다.";
		} else {
			message = inVO.getMemberid() + "수정 실패";
		}

		MessageVO messageVO = new MessageVO(String.valueOf(flag), message);

		jsonString = new Gson().toJson(messageVO);

		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}

	@RequestMapping(value = "/doSelectOne.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String doSelectOne(MemberVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);

		MemberVO outVO = memberService.doSelectOne(inVO);

		jsonString = new Gson().toJson(outVO);
		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody // 비동기 처리를 하는 경우, HTTP 요청 부분의 body부분이 그대로 브라우저에 전달된다.
	public String add(MemberVO inVO) throws SQLException {
		String jsonString = "";
		LOG.debug("┌=============================┐");
		LOG.debug("|inVO=" + inVO);
		int flag = memberService.add(inVO);

		String message = "";// json으로 전달할 메시지
		if (1 == flag) {
			message = inVO.getMemberid() + "등록 되었습니다.";
		} else {
			message = inVO.getMemberid() + "등록 실패";
		}

		MessageVO messageVO = new MessageVO(String.valueOf(flag), message);

		jsonString = new Gson().toJson(messageVO);

		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}

	//
	@RequestMapping(value = "/doDelete.do", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doDelete(HttpServletRequest req, MemberVO inVO) throws SQLException {
		String jsonString = "";

		LOG.debug("┌=============================┐");

		String memberid = req.getParameter("memberid");
		LOG.debug("|memberid=" + memberid);

		// Command객체
		//
		LOG.debug("|inVO=" + inVO);
		MemberVO inpuVO = new MemberVO();
		inpuVO.setMemberid(memberid);

		LOG.debug("|inpuVO=" + inpuVO);

		int flag = memberService.doDelete(inpuVO);

		LOG.debug("|flag=" + flag);

		String message = "";
		if (1 == flag) {
			message = inpuVO.getMemberid() + "가 삭제 되었습니다.";
		} else {
			message = inpuVO.getMemberid() + " 삭제 실패!";
		}

		MessageVO messageVO = new MessageVO(String.valueOf(flag), message);

		jsonString = new Gson().toJson(messageVO);

		LOG.debug("|jsonString=" + jsonString);
		LOG.debug("└=============================┘");
		return jsonString;
	}

}