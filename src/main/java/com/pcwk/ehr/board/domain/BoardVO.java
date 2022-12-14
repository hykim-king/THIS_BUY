package com.pcwk.ehr.board.domain;

import com.pcwk.ehr.cmn.DTO;

public class BoardVO extends DTO {

	private int seq;		// 게시글 번호
	private int gubun;		// 게시판 구분 10_공지사항 20_1:1문의
	private int gubunQuestion;		// 게시판 구분 10_공지사항 20_1:1문의
	private String title;		// 제목
	private String contents;	// 내용
	private String regDt;		// 등록일
	private String regId;		// 등록자
	private int answerCheck;	// 답변 체크
	private int imageNo; //이미지 번호 
	private  String		saveName;     //저장파일명
	private  String		viewPath;     //이미지태그경로
	
	public BoardVO() {}

	public BoardVO(int seq, int gubun, int gubunQuestion, String title, String contents, String regDt, String regId,
			int answerCheck, int imageNo, String saveName, String viewPath) {
		super();
		this.seq = seq;
		this.gubun = gubun;
		this.gubunQuestion = gubunQuestion;
		this.title = title;
		this.contents = contents;
		this.regDt = regDt;
		this.regId = regId;
		this.answerCheck = answerCheck;
		this.imageNo = imageNo;
		this.saveName = saveName;
		this.viewPath = viewPath;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getGubun() {
		return gubun;
	}

	public void setGubun(int gubun) {
		this.gubun = gubun;
	}

	public int getGubunQuestion() {
		return gubunQuestion;
	}

	public void setGubunQuestion(int gubunQuestion) {
		this.gubunQuestion = gubunQuestion;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public int getAnswerCheck() {
		return answerCheck;
	}

	public void setAnswerCheck(int answerCheck) {
		this.answerCheck = answerCheck;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getViewPath() {
		return viewPath;
	}

	public void setViewPath(String viewPath) {
		this.viewPath = viewPath;
	}

	@Override
	public String toString() {
		return "BoardVO [seq=" + seq + ", gubun=" + gubun + ", gubunQuestion=" + gubunQuestion + ", title=" + title
				+ ", contents=" + contents + ", regDt=" + regDt + ", regId=" + regId + ", answerCheck=" + answerCheck
				+ ", imageNo=" + imageNo + ", saveName=" + saveName + ", viewPath=" + viewPath + ", toString()="
				+ super.toString() + "]";
	}


	


	      
	
	
	
	
}
