<%--
/**
  Class Name:
  Description:
  
  Modification information
  
    수정일     수정자      수정내용
  -----   -----  -------------------------------------------
    2022. 12. 16        최초작성 
    
    author eclass 개발팀 :ITSC
    since 2022.11.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="CP" value="${pageContext.request.contextPath }"></c:set>
<c:set var="RES" value="/resources" ></c:set>
<c:set var="CP_RES" value="${CP}${RES}" ></c:set>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${CP}/favicon.ico">   
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="${CP_RES}/css/bootstrap.min.css">

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
<title>제목</title>
<script >
$(document).ready(function() {
    //console.log("1.document:최초수행!");
    doSelectOnee();
   
    if(member.auth != '1')  { $("#answerForm").empty();}
  
  });
  //수정화면으로 이동
  function doUpdate(answerNo) {
    console.log("doUpdate");
    console.log(answerNo);
    
    if(member.auth != '1')  { alert("관리자만 수정가능합니다."); return; }
    
    //window.location.href = "${hContext}/answer/answer_moview.do?answerNo="+answerNo;
    $("#answerList").empty();
    $("#answerForm").empty();
    
    
    
    $.ajax({
      type: "GET",
      url:"SelectAnswer.do",
      asyn:"true",
      dataType:"html",
      data:{  
        "answer/answerNo": answerNo
      },
      
      success:function(data){//통신 성공
          console.log("success data:"+data);
        var parseData = JSON.parse(data);
  
        var answerNo = parseData.answerNo;
        var questionNo = parseData.questionNo;
        var aUser = parseData.aUser;
        var contents = parseData.contents;
        var regDt = parseData.regDt;
        
        var html = "";
        
        
        
        html+="   <section class='card'>";
            html+="            <div class='card-header'>";
            html+="            </div>";
            html+="            <div class='card-body'>";
            html+="                <div class='tab-content' >";
            html+="                    <div class='tab-pane fade show active'  role='tabpanel' aria-labelledby='posts-tab'>";
            html+="                        <div class='form-group'>";
            html+="                            <textarea class='form-control' id='answer' rows='3'>"+contents+"</textarea>";
            html+="                        </div>";
            html+="                    </div>";
            html+="                </div>";
            html+="                <div class='text-right'>";
            html+="                 <button type='button' class='btn btn-primary' onclick='doUpdateBtn("+answerNo+");'>답변수정</button>";
            html+="                </div>";
            html+="            </div>";
            html+="        </section>";
            
            
            $("#answerList").append(html);
           
      },
        error:function(data){//실패시 처리
          console.log("error:"+data);
        },
        complete:function(data){//성공/실패와 관계없이 수행!
          console.log("complete:"+data);
        }
  
    });
    
  }
  
  //답변 내용 수정하기
  function doUpdateBtn(answerNo){
    console.log("doUpdateBtn");
    console.log("answerNo"+answerNo);
    
/*    if(eUtil.ISEmpty($("#answer").val()) == true){
      alert("내용을 입력하세요");
      $("#answer").focus();
      return;
    } */
    
    console.log($("#answer").val());
    
    if(confirm("수정 하시겠습니까?")==false) return;
    
    let url = "/answer/Update.do";
    let parameters = {
        "answerNo"  : answerNo,
        "contents"  : $("#answer").val()
    };
    
    let method = "GET";
    let async  = true;
    
    
    EClass.callAjax(url, parameters, method, async, function(data){
      console.log("data msgContents:"+data.msgContents);
      
      if("1"==data.msgId) {//등록 성공
        alert(data.msgContents);
      
        var htmL = "";
        
        htmL+="<div class='card-header' >";
        htmL+="</div>";
        htmL+="<div class='card-body'>";
        htmL+=" <div class='tab-content' >";
        htmL+="   <div class='tab-pane fade show active'  role='tabpanel' aria-labelledby='posts-tab'>";
        htmL+="     <div class='form-group'>";
        htmL+="       <textarea class='form-control' id='answer' rows='3' placeholder='문의에 대한 답변을 달아주세요'></textarea>";
        htmL+="     </div>";
        htmL+="   </div>";
        htmL+=" </div>";
        htmL+=" <div class='text-right'>";
        htmL+="   <button type='button' class='btn btn-primary' id='doInsertBtn'>답변등록</button>";
        htmL+=" </div>";
        htmL+="</div>"; 
        
        $("#answerForm").append(htmL);
        doSelectOnee();
      }else{ //등록 실패
        alert(data.msgId+"\n"+data.msgContents);
      }
      
    }); 
   
  };
  //답변 삭제
  function doDelete(answerNo) {
    console.log("doDelete");
    console.log(answerNo);
    
    if(member.auth != '1')  { alert("관리자만 삭제가능합니다."); return; }
    
    let url = "/answer/Delete.do";
    let parameters ={"answerNo":answerNo};
    let method = "POST";
    let async = true;
    
        if(member.memberId == ""){
          alert("관리자 계정이 아니면 이용할 수 없는 페이지 입니다.");
          window.location.href = "${hContext}/member/sign_in_view.do";
        }
  
    if(confirm("삭제 하시겠습니까?")==false) return;
    
    EClass.callAjax(url, parameters, method, async, function(data){
    
      if("1"==data.msgId) {//삭제 성공
        alert(data.msgContents);
        
        doSelectOnee();
      }else{ //삭제 실패
        alert(data.msgId+"\n"+data.msgContents);
      }
    
    }); 
    
  }
  //문의에 대한 답변 데이터 
  function doSelectOnee() {
    $.ajax({
      type: "GET",
      url:"/answer/Selectone.do",
      asyn:"true",
      dataType:"html",
      data:{  
        "seq": $("#seq").val()
      },
      
      success:function(data){//통신 성공
          console.log("success data:"+data);
  
        var parseData = JSON.parse(data);
        
        $("#answerList").empty();
        //$("#answerForm").empty();
        var html = "";
        
        if(parseData.length>0){
          
          $.each(parseData, function(i, value){
            console.log(i+","+value.name);
            
            //---------------------------------------------------------------------------------------------
            html+="   <div class='border p-2'>";
            html+="     <div class='row m-0'>";
            html+="       <div class='flex-grow-1 pl-2'>";
            html+="         <a class='text-decoration-none' href='#' id='aUser'><h5>"+value.aUser+"</h5></a> ";
            html+="         <p class='small text-secondary m-0 mt-1' id='regDt'>"+value.regDt+"</p>";
            html+="       </div>";
            html+="       <div class='dropdown'id='dropdownBtn'  >";
            html+="         <a class='' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>";
            html+="         <i class='fas fa-chevron-down'></i>";
            html+="         </a>";
            html+="       <div class='dropdown-menu'  aria-labelledby='dropdownMenuLink'>";
            html+="         <button class='dropdown-item text-primary' onclick='doUpdate("+value.answerNo+");'>수정</button>";
            html+="         <button class='dropdown-item text-primary' onclick='doDelete("+value.answerNo+");'>삭제</button>";
            html+="       </div>";
            html+="       </div>";
            html+="     </div>";
            html+="   <div class=''>";
            html+="     <p class='my-2' id='contents'>"+value.contents+"</p>";
            html+="   </div>";
            html+="   <hr class='my-1'>";
            html+="   </div>";  
            
          
          });
          
  
        }else {   //data가 없는 경우
          //$("#answerForm").append(htmL);
          html +="<tr>";
          html +="  <td class='text-center' colspan='99' >등록된 답변이 없습니다.</td> ";
          html +="</tr>";
        }
        
        //데이터 추가
        $("#answerList").append(html);
        
        },
        error:function(data){//실패시 처리
          console.log("error:"+data);
        },
        complete:function(data){//성공/실패와 관계없이 수행!
          console.log("complete:"+data);
        }
    });
    
  }
  //답변 등록
  $("#doInsertBtn").on("click",function(e){
    console.log("doInsertBtn");
    e.preventDefault();
    
/*    if(eUtil.ISEmpty($("#answer").val()) == true){
      alert("내용을 입력하세요");
      $("#answer").focus();
      return;
    } */
    
    console.log($("#answer").val());
    
    if(confirm("등록 하시겠습니까?")==false) return;
    
    let url = "${hContext}/answer/do_insert.do";
    let parameters = {
      
        "questionNo" : $("#questionNo").val(),
        "aUser" : $("#regId").val(),
        "contents"  : $("#answer").val()
    };
    
    let method = "GET";
    let async  = true;
    
    
    EClass.callAjax(url, parameters, method, async, function(data){
      console.log("data msgContents:"+data.msgContents);
      
      if("1"==data.msgId) {//등록 성공
        alert(data.msgContents);
        doSelectOnee();
        $("#answer").val('');
      }else{ //등록 실패
        alert(data.msgId+"\n"+data.msgContents);
      }
      
    }); 
  
  });

</script>

</head>
<body>

<body> 
  <!-- hidden -->
  
  <input type="hidden" name="seq" id="seq"  value= "${seq }" />
  
  <div class="container-fluid my-5">
    <div class="row">
      <div class="col-6">
      
        <!--- Form Begins -->
                <section class="card" id="answerForm">
                <div class="card-header" >
        </div>
        <div class="card-body">
          <div class="tab-content" >
            <div class="tab-pane fade show active"  role="tabpanel" aria-labelledby="posts-tab">
              <div class="form-group">
                <textarea class="form-control" id="answer" rows="3" placeholder="문의에 대한 답변을 달아주세요"></textarea>
              </div>
            </div>
        </div>
        <div class="text-right">
          <button type="button" class="btn btn-primary" id="doInsertBtn">답변등록</button>
        </div>
        </div>
                </section>
                <!--- Form Ends -->

        <!--contents begins -->
        <section class="card mt-4">
          <div id="answerList" class="border p-2">
          </div>
        </section>
        <!--contents  end -->
      </div>
    </div>
  </div>
     
</body>
</html>