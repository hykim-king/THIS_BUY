package com.pcwk.ehr.answer.service;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.answer.domain.AnswerVO;
import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.DTO;

public interface AnswerService {
	  
	final String DOT       = ".";
	
	/**
	 * 문의 답변 전체 조회
	 * @return
	 * @throws SQLException
	 */
	List<AnswerVO> getAllList()throws SQLException;
	
	/**
	 * 등록
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doInsert(AnswerVO inVO)throws SQLException;
	
	/**
	 * 삭제
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doDelete(AnswerVO inVO)throws SQLException;
	
	/**
	 * 수정
	 * @param t
	 * @return 1(성공)/0(실패)
	 * @throws SQLException
	 */
	int doUpdate(AnswerVO inVO)throws SQLException;
	
	
	/**
	 * 단건조회
	 * @param t
	 * @return T
	 * @throws SQLException
	 */
	List<AnswerVO> doSelectOne(AnswerVO inVO) throws SQLException;
	
	/**
	 * 목록조회
	 * @param t
	 * @return List<DTO>
	 * @throws SQLException
	 */
	List<AnswerVO> doRetrive(DTO inVO)throws SQLException;

	/**
	 * 답변조회
	 * @param inVO
	 * @return
	 * @throws SQLException
	 */
	AnswerVO doSelectAnswer(AnswerVO inVO) throws SQLException; 
	
}
