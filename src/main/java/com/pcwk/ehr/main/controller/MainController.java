 package com.pcwk.ehr.main.controller;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.admin.service.CategoryService;
import com.pcwk.ehr.admin.service.ProductService;
import com.pcwk.ehr.cmn.SearchVO;
import com.pcwk.ehr.cmn.StringUtil;
import com.pcwk.ehr.code.service.CodeService;
import com.pcwk.ehr.image.service.ImageService;
import com.pcwk.ehr.main.domain.ProductImgVO;
import com.pcwk.ehr.main.service.MainService;
 
@Controller("mainController")
@RequestMapping("main")
public class MainController {
	
	final Logger LOG = LogManager.getLogger(getClass());
	
	final String VIEW_NAME = "main/main_page";
	
	@Autowired
	ProductService prodService;
	
	@Autowired
	CategoryService cateService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	ImageService imgService;
	
	@Autowired
	MainService mainService;
	
	public MainController() {}
	
	@RequestMapping(value = "/main_page.do", method = RequestMethod.GET)
	public String singup(Model model) throws SQLException {
		LOG.debug("┌=============================┐");
		LOG.debug("|main_page                    |");
		LOG.debug("└=============================┘");
		
		List<ProductImgVO> list = mainService.getAll();
		
		model.addAttribute("list", list);

		return VIEW_NAME;
	}
	
	// 상품 검색
	@RequestMapping(value = "/doRetrieve.do", method = RequestMethod.GET,
		produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String doRetrieve(SearchVO inVO) throws SQLException {
		String jsonString = "";
		
		//페이지 번호
		if(null !=inVO && inVO.getPageNo()==0) {
			inVO.setPageNo(1);
		}
			
		//페이지사이즈
		if(null !=inVO && inVO.getPageSize()==0) {
		    inVO.setPageSize(10);
		}
			
		//검색구분
		if(null !=inVO && null == inVO.getSearchDiv()) {
			inVO.setSearchDiv(StringUtil.nvl(inVO.getSearchDiv()));
		}
			
		//검색어
		if(null !=inVO && null == inVO.getSearchWord()) {  
			inVO.setSearchWord(StringUtil.nvl(inVO.getSearchWord()));
		}
			
		//카테고리ID
		if(null !=inVO && null == inVO.getCateId()) {  
			inVO.setCateId(StringUtil.nvl(inVO.getCateId()));
		}
			
		//카테고리ID
		if(null !=inVO && null == inVO.getCateClass01()) {  
			inVO.setCateClass01(StringUtil.nvl(inVO.getCateClass01()));
		}
			
		//카테고리ID
		if(null !=inVO && null == inVO.getCateClass02()) {  
			inVO.setCateClass02(StringUtil.nvl(inVO.getCateClass02()));
		}
			
		LOG.debug("┌-------------------------------------┐");
		LOG.debug("|  inVO = " + inVO);
			
		List<ProductVO> list = prodService.doRetrieve(inVO);
			
		jsonString = new Gson().toJson(list);
		LOG.debug("|  jsonString = " + jsonString);
		LOG.debug("└-------------------------------------┘");		
			
		return jsonString;
	}
}