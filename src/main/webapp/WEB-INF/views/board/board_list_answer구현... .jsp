<%--
/**
  Class Name: bootList.jsp
  Description: 목록조회
  
  Modification information
  
    수정일     수정자      수정내용
  -----   -----  -------------------------------------------
    2022. 11. 28        최초작성 
    
    author eclass 개발팀 :ITSC
    since 2022.11.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	//공지사항(10)/자유게시판 구분(20)
String divValue = request.getParameter("gubun");
String title = "";
String gubun1 = "";
String gubun2 = "";
if ("20".equals(divValue)) {
	title = "1:1문의";
	gubun1 = "작성일";
	gubun2 = "답변상태";

} else {
	title = "공지사항";
	gubun1 = "작성자";
	gubun2 = "작성일";
}

request.setAttribute("title", title);
request.setAttribute("gubun1", gubun1);
request.setAttribute("gubun2", gubun2);
request.setAttribute("divValue", divValue);
%>
<%

/* 게시물 제목을 클릭했을때 내용을 불러오기위한 게시물번호 입니다. */
String seq = request.getParameter("seq");
int faq_no = (seq == null)? -1 : Integer.parseInt(seq);
%>
<c:set var="CP" value="${pageContext.request.contextPath}" />
<!-- ContextPath -->
<c:set var="RES" value="/resources" />
<c:set var="CP_RES" value="${CP}${RES}" />

<%@ include file="/WEB-INF/views/cmn/cache.jsp"%>
<!DOCTYPE html>
<html>

<style>
*, :after, :before {
	box-sizing: border-box;
	margin: 0;
}

*, :after, :before, legend, td, th {
	padding: 0;
}

div {
	display: block;
}

body, button, input, select, textarea {
	font-size: 14px;
	color: #333;
}

body {
	margin: 0;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #fff;
	-webkit-tap-highlight-color: transparent;
}

:root { -
	-swiper-theme-color: #007aff;
}

html, button, input, select, textarea {
	font-family: "Noto Sans", "malgun gothic", AppleGothic, dotum,
		sans-serif;
}

html {
	touch-action: manipulation;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%;
}

html {
	line-height: 1.15;
	-webkit-tap-highlight-color: transparent;
}

*, :after, :before {
	box-sizing: border-box;
	margin: 0;
}

*, :after, :before, legend, td, th {
	padding: 0;
}

*, :after, :before, legend, td, th {
	padding: 0;
}

.css-1 {
	display: flex;
	width: 1050px;
	padding: 50px 0px 80px;
	margin: 0px auto;
	flex-direction: row;
	-webkit-box-pack: justify;
	justify-content: space-between;
}

.css-2 {
	width: 200px;
}

.css-3 {
	height: 75px;
	padding: 5px 0px 35px 1px;
	font-weight: 500;
	font-size: 28px;
	line-height: 35px;
	color: rgb(51, 51, 51);
	letter-spacing: -1px;
}

.css-4 {
	border: 1px solid rgb(242, 242, 242);
}

ol, ul {
	list-style-type: none;
}

.css-5 {
	width: 820px;
}

.css-6 {
	display: flex;
	flex-direction: row;
	width: 100%;
	padding-bottom: 27px;
	-webkit-box-pack: justify;
	justify-content: space-between;
}

.css-7 {
	display: flex;
	flex-direction: row;
	-webkit-box-align: center;
	align-items: center;
}

.css-8 {
	font-weight: 500;
	font-size: 24px;
	color: rgb(51, 51, 51);
	letter-spacing: -0.5px;
	line-height: 48px;
}

.css-9 {
	padding-left: 11px;
	font-size: 14px;
	letter-spacing: -0.3px;
	color: rgb(153, 153, 153);
	line-height: 20px;
}

.css-10 {
	display: flex;
	width: 100%;
	padding: 20px 0px;
	border-bottom: 1px solid rgb(51, 51, 51);
	border-top: 2px solid rgb(51, 51, 51);
}

.css-11 {
	flex-basis: 50px;
	text-align: center;
	line-height: 20px;
	font-weight: 400;
	color: rgb(51, 51, 51);
}

.css-12 {
	-webkit-box-flex: 1;
	flex-grow: 1;
	text-align: center;
	line-height: 20px;
	font-weight: 400;
	color: rgb(51, 51, 51);
}

.css-13 {
	flex-basis: 100px;
	text-align: center;
	line-height: 20px;
	font-weight: 400;
	color: rgb(51, 51, 51);
}

.css-13 {
	flex-basis: 100px;
	text-align: center;
	line-height: 20px;
	font-weight: 400;
	color: rgb(51, 51, 51);
}

.css-14 {
	display: flex;
	flex-direction: column;
}

.css-15 {
	display: flex;
	flex-direction: row;
	border-bottom: 1px solid rgb(244, 244, 244);
}

.css-16 {
	text-align: center;
	padding: 20px 0px;
	color: rgb(76, 76, 76);
	flex-basis: 50px;
}

.css-17 {
	padding: 20px 0px 20px 20px;
	color: rgb(76, 76, 76);
	flex: 1 1 0%;
	text-align: left;
}

.css-18 {
	text-align: center;
	padding: 20px 0px;
	color: rgb(76, 76, 76);
	flex-basis: 100px;
}

.css-19 {
	text-align: center;
	padding: 20px 0px;
	flex-basis: 100px;
	color: rgb(153, 153, 153);
}

.css-20 {
	cursor: pointer;
	border-bottom: 1px solid #f2f2f2;
	padding: 14px 20px 16px 20px;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	justify-content: space-between;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	line-height: 19px;
	letter-spacing: -.3px;
	font-size: 14px;
	color: #666;
}

.css-20.active, .css-20:hover {
	background-color: #fafafa;
	font-weight: 500;
}

.css-button {
	overflow: hidden;
	position: absolute;
	left: -9999px;
	width: 1px;
	height: 1px;
}

.css-Button {
	display: block;
	padding: 0px 10px;
	text-align: center;
	overflow: hidden;
	width: 120px;
	height: 44px;
	border-radius: 3px;
	color: black;
	background-color: #b8c9df;
	border: 0px none;
}
.css-answer1 {
    /* overflow: hidden; */
    display: none;
}
.css-answer2 {
    padding: 20px 20px 30px;
    background-color: rgb(250, 250, 250);
}                            
             
 .css-answer3 {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    line-height: 20px;
    letter-spacing: -0.075em;
    margin-bottom: 20px;
}       

.css-answer4 {
    font-size: 14px;
    font-family: "Noto Sans", serif;
    color: rgb(153, 153, 153);
} 
.css-answer5 {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
}       
.css-answer6 {
    background-image: url("/WEB-INF/favicon.ico")
     background-position: center center;
    background-repeat: no-repeat;
    background-size: contain;
    width: 24px;
    height: 24px;
}
.css-answer7 {
    width: 744px;
    margin-top: 3px;
    margin-left: 12px;
}

/* 글 내용의 경계선 표시 */
  .content{
    border: 1px dotted #cecece;
  }
  /* 글 내용안에 있는 이미지의 크기 제한 */
  .content img{
    max-width: 100%;
  }
  /* 댓글에 관련된 css */
  .comments ul{
    padding: 0;
    margin: 0;
    list-style-type: none;
  }
  .comments ul li{
    border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
  }
  .comments dt{
    margin-top: 5px;
  }
  .comments dd{
    margin-left: 26px;
  }
  .comments form textarea, .comments form button{
    float: left;
  }
  .comments li{
    clear: left;
  }
  .comments form textarea{
    width: 85%;
    height: 100px;
  }
  .comments form button{
    width: 15%;
    height: 100px;
  }
  /* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
  .comment form{
    display: none;
  }
  .comment{
    position: relative;
  }
  .comment .reply_icon{
    width: 8px;
    height: 8px;
    position: absolute;
    top: 10px;
    left: 30px;
  }
  .comments .user-img{
    width: 20px;
    height: 20px;
    border-radius: 50%;
  }
</style>

<head>
<!-- 뷰포트(반응형 웹)  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="project product list">
<meta name="keywords" content="html5, css3, javascipt6, jQuery">
<!-- favicon -->
<link rel="shortcut icon" type="images/x-icon"
	href="/PC_HTML/favicon.ico">
<!-- jquery ui -->
<link rel="stylesheet" href="${CP_RES}/css/admin_product_mng.css">
<!-- jQuery -->
<script src="${CP_RES}/js/jquery-1.12.4.js"></script>
<!-- callAjax -->
<script src="${CP_RES}/js/callAjax.js"></script>
<!-- String, Number, Date Util -->
<script src="${CP_RES}/js/eUtil.js"></script>
<!-- paging -->
<script src="${CP_RES}/js/jquery.bootpag.js"></script>
<!-- bootstrap js -->
<script src="${CP_RES}/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>목록</title>
<script>
	$(document).ready(function() {
						console.log("document.ready");
						initTableView();
			/* 			answerboard(); */
						
						//=================================================paging
					    renderingPage('${pageTotal}',1)
		


//-------------------------------- 한건조회 (상세조회) 테이블 클릭 
			
	//테이블 클릭
						$("#boardTable>div").on("click","ul",function(e) {
											console.log('boardTable');
											let divArray = $(this).find("li>div");
											let boardSeq = divArray.eq(0).text();

											console.log('boardSeq:' + boardSeq);
											console.log('boardTable');

											 if ("10" == $("#gubun").val()) {
													if (confirm("상세 조회를 하시겠습니까?") == false)
														return;
													//div,seq
													window.location.href = "${CP}/board/doSelectOne.do?gubun=10&seq="
															+ boardSeq;
	
													console.log("boardSeq: "
															+ boardSeq);

											} else if ("20" == $("#gubun").val()) {
												
												//$(this).next("ul.css-14");
												  console.log("999:"+$(this).next("ul.css-14").html());
												  
												  let subMenu = $(this).next("ul.css-14");
											        console.log(subMenu.is(":visible"));
											        if(subMenu.is(":visible")){
											           subMenu.toggle("hide");
											        }else{
											           subMenu.toggle();
											        }
							         }
										});

//-------------------------------- 한건조회 (상세조회) 테이블 클릭  끝

 $("#doInsertButton").on("click",function(){
        console.log("doInsertButton");
        
        
        if(eUtil.ISEmpty($("#title").val()) == true){
          alert("제목을 입력 하세요.");
          $("#title").focus();
          return;
        }
          
        if(eUtil.ISEmpty($("#contents").  val()) == true){
            alert("내용을 입력 하세요.");
            $("#contents").focus();
            return;
        }       
          
        //문의동록 
        let b_method = "GET";
        let b_url    = "/answer/doInsert.do";
        let b_async  = true;
        let b_params = {
            seq :  $("#seq").val(),
            title : $("#title").val(),
            contents : $("#contents").val(),
            regId : "관리자"
        };
        
        PClass.callAjax(b_method,b_url,b_async,b_params,function(b_data){
          console.log(b_data);
        //JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 
        //그 결과에서 JavaScript 값이나 객체를 생성합니다.
          let parsedJson = JSON.parse(data);
        
          if("1" == parsedJson.msgId){
            alert(parsedJson.msgContents);
            moveToList();
          }else{
            alert(parsedJson.msgContents);
          }
        
        });
            
        
      });

						//등록화면으로 이동
						$("#boardReg").on("click", function() {

							console.log('moveTomoveToRegBoardReg');

							window.location.href = "${CP}/board/boardReg.do"

							//moveToReg
						});

						//등록화면으로 이동
						$("#questionReg").on("click", function() {

							console.log('moveToReg');

							window.location.href = "${CP}/board/questionReg.do"

							//moveToReg
						});

						/*    const gubun = $("#gubun").value();
						   if(gubun == 10){
						      $("#questionButtonArea").hide();
						   }else{
						      $("#insertButtonArea").hide();
						   }
						 */

						

					}); //document

	function initTableView() {
		if ("10" == $("#gubun").val()) {
			$("#questionButtonArea").css("display", "none");
			$("#insertButtonArea").css("display", "");
		} else if ("20" == $("#gubun").val()) {
			$("#questionButtonArea").css("display", "");
			$("#insertButtonArea").css("display", "none");
		}
	}

	/* 	function initAnswerView() {
	 if ("1" == $("#answerCheck").val()) {
	 $("#answerTable").css("display", "");
	 } else if ("0" == $("#gubun").val()) {
	 $("#answerTable").css("display", "none");
	 }
	 }  */

	function doRetreive(page) {
		console.log('doRetreive() page:' + page);
		let method = "GET";
		let url = "/board/doRetrieve.do";
		let async = true;

		//전체
		let searchDivValue = $('#searchDiv').val();

		if ('ALL' == searchDivValue) {
			searchDivValue = "";
		}

		let params = {
			gubun : $("#gubun").val(),
			pageSize : $('#pageSize').val(),
			pageNo : page
		};

		PClass.callAjax(
						method,
						url,
						async,
						params,
						function(data) {
							console.log(data);
							let parsedJson = JSON.parse(data);

							let htmlData = "";

							//기존 데이터 삭제
							$("#boardTable").empty();

							let totalCnt = 0;//총글수  
							let pageTotal = 0;//총페이지수

							if (null != parsedJson && parsedJson.length > 0) {

								totalCnt = parsedJson[0].totalCnt;
								pageTotal = Math.ceil(totalCnt
										/ $("#pageSize").val());
								console.log("----------------------------");
								console.log("-totalCnt:" + totalCnt);
								console.log("-pageTotal:" + pageTotal);
								console.log("-page:" + page);
								console.log("----------------------------");

								if ("10" == $("#gubun").val()) {
									$
											.each(
													parsedJson,
													function(index, value) {

														htmlData += "<ul class='css-14'><li><a href='#'> <div class='css-15'>";
														htmlData += "    <div style='display: none;'"+ <c:out value='value.seq'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.num'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.title'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.regId'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.regDt'/>+ "</div>";
														htmlData += "</ul>";
													});

								} else if ("20" == $("#gubun").val()) {
									$
											.each(
													parsedJson,
													function(index, value) {

														htmlData += "<ul class='css-14'><li><a href='#'> <div class='css-15'>";
														htmlData += "    <div style='display: none;'"+ <c:out value='value.seq'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.num'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.title'/>+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.regDt'/>	+ "</div>";
														htmlData += "    <div class='css-15'"+ <c:out value='value.answerCheck'/>+ "</div>";
														htmlData += "</ul>";
													});
								}
							} else {
								htmlData += "<div>";
								htmlData += "   No data found ";
								htmlData += "</div>";
							}

							//데이터 출력
							$("#boardTable").append(htmlData);

							//paging
							$("#page-selection").empty();//페이저 삭제
							renderingPage(pageTotal, page);

							//PClass.callAjax  
						});

	}

/* 	//문의에 대한 답변 데이터 
	const ReplyList = function(answerNo){
		 $.ajax({
		        url : 'answer/selectOne.do',
		        type : 'get',
		        data : {
		        	answerNo : answerNo
		        },
		        
		        success : function(data) {
		        	console.log("댓글 리스트 가져오기 성공");
		 
		  // 댓글 목록을 html로 담기
         let listHtml = "";
         for(const i in data){
             let answerNo = data[i].answerNo;
             let seq = data[i].seq;
             let title = data[i].title;
             let contents = data[i].contents;
             let regDt = data[i].regDt;
             let regId = data[i].regId;
           
             listHtml += "<div class='row answer reply" + no + "'>";

             if(content == ""){    // 삭제된 댓글일때
                 listHtml += " <div>";
                 listHtml += "   (삭제된 댓글입니다)";
                 listHtml += " </div>";
             }else{
            	 listHtml += " <div class='col-1'>"
                     listHtml += " </div>"
                     listHtml += " <div class='col-1'>";
                     listHtml += "   <img class='reply_list_profileImage' src='./upload/profile/"+ profile +"'/>";
                     listHtml += " </div>";
                     listHtml += " <div class='rereply-content"+ answerNo +" col-7'>";
                     listHtml += "   <div>";
                     listHtml += "     <span>";
                     listHtml += "       <b>"+ regId +"</b>";
                     listHtml += "     </span>";
                     listHtml += "     <span>";
                     listHtml +=         content;
                     listHtml += "     </span>";
                     listHtml += "   </div>";

                     listHtml += " </div>";
             }

	} */

	//paging
	function renderingPage(pageTotal, page) {
		console.log("pageTotal:" + pageTotal);
		console.log("page:" + page);

		pageTotal = parseInt(pageTotal);

		//연결된 EventHandler제거
		$('#page-selection').unbind('page');

		$('#page-selection').bootpag({
			total : pageTotal,
			page : page,
			maxVisible : 10,
			leaps : true,
			firstLastUse : true,
			first : '←',
			last : '→',
			wrapClass : 'pagination',
			activeClass : 'active',
			disabledClass : 'disabled',
			nextClass : 'next',
			prevClass : 'prev',
			lastClass : 'last',
			firstClass : 'first'
		}).on("page", function(event, num) {
			console.log("num:" + num);
			doRetrieve(num);
		});
	
	}
</script>

</head>

<body>
	<input type="hidden" id="gubun" value="${divValue}">
	 <input type="text" value="${seq }" id="seq">

	<div id="__next" data-reactroot="">
		<div>
			<div>
				<div>
					<div class="css-1 ">
						<div class="css-2 ">
							<div class="css-3 ">고객센터</div>
							<ul class="css-4 ">
								<li class="css-0 "><a class=" css-20 "
									href="${CP}/board/boardView.do?gubun=10">공지사항</a></li>
								<li class="css-0 "><a class=" css-20 "
									href="${CP}/board/boardView.do?gubun=20">1:1 문의</a></li>
							</ul>
						</div>


						<div class="css-5 ">
							<div class="css-6 ">
								<div class="css-7 ">
									<h2 class="css-8 ">${title}</h2>
								</div>
							</div>
							<div class="css-10">
								<div width="50" class="css-11">번호</div>
								<div class="css-12 ">제목</div>
								<div width="100" class="css-13">${gubun1}</div>
								<div width="100" class="css-13 ">${gubun2}</div>
								<div style="display: none;">SEQ</div>
							</div>

							<div id="boardTable">

							<c:choose>
									<c:when test="${list.size()>0 }">
										<c:forEach var="vo" items="${list }">
											<c:choose>
												<c:when test="${vo.gubun == 10 }">
												 <div>
													<ul class="css-14 ">
														<li class="css-15"><!-- <a href="#"> -->
																	<!-- 공지사항  -->
																	<div style="display: none;"><c:out value="${vo.seq }"></c:out></div>
																	<div class="css-16"><c:out value="${vo.num }"></c:out></div>
																	<div class="css-17 "><c:out value="${vo.title }"></c:out></div>
																	<div class="css-18 "><c:out value="${vo.regId }"></c:out></div>
																	<div class="css-19 "><c:out value="${vo.regDt }"></c:out></div>
														<!-- </a> -->
														</li>
													 </ul>
													</div>
												</c:when>
												<c:otherwise>
												 <div >
												<%-- 	<a  href="#"   value="${vo.seq }"> --%>
														<ul class="css-14 ">
															<li class="css-15">
																		<!-- 1:1문의  -->
																		<div style="display: none;"><c:out value="${vo.seq }"></c:out></div>
																		<div class="css-16 " ><c:out value="${vo.num }"></c:out></div>
																		<div class="css-17 " ><c:out value="${vo.title }"></c:out></div>
																		<div class="css-18 "><c:out value="${vo.regDt }"></c:out></div>
																		<div class="css-19 "><c:out value="${vo.answerCheck }"></c:out></div>
															</li>
													</ul>
										<!-- 		</a> -->
												<ul class="css-14 css-answer1">
													 <li  id="${vo.seq }" value="${vo.seq }" >
													   <div class="css-answer3">[Q&A]</div>
													   <div class="css-answer5"><c:out value="${vo.title }"></c:out>
													   </div>
													   <div class="css-answer7 "><c:out value="${vo.contents }"></c:out></div>
													 </li> 
													 <div class="comments">
												    <!-- 원글에 댓글을 작성할 수 있는 폼 -->
												    <div class="comment_form">
												      <form action="comment_insert.do" method="post"> 
												      <!-- 댓글의 그룹번호는 원글의 글번호가 된다. -->
												        <input type="hidden" name="ref_group" value="${dto.num }"/>
												      <!-- 댓글의 대상자는 원글의 작성자가 된다. -->
												        <input type="hidden" name="target_id" value="${dto.writer }"/>
												        <textarea rows="content"></textarea>
												        <button type="submit">등록</button>
												            </form>
												    </div>
												   </div>
                        </ul> 																		
						</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<div>
											<div>No data found</div>
										</div>
									</c:otherwise>
								</c:choose> 

							</div>



							<div id="insertButtonArea">
								<button class="css-Button" type="button" width="120" height="44"
									radius="3" id="boardReg">등록</button>
							</div>

							<div id="questionButtonArea">
								<button class="css-Button" type="button" width="120" height="44"
									radius="3" id="questionReg">문의하기</button>
							</div>

<div id="answerTable">
 <div></div>
</div>



							<!-- ----------------------------------페이징  -->
							<div class="text-center col-sm-12 col-dm-12 col-lg-12">
								<div id="page-selection" class="text-center page"></div>
							</div>
							<!-- ----------------------------------페이징  끝-->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>