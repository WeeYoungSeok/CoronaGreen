<%@page import="com.corona.green.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template</title>
<!-- menubar css -->
<link href="resources/css/header.css" rel="stylesheet" type="text/css" />
<!-- menubar js -->
<script src="resources/js/header.js" defer></script>
<!--google font-->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
<!-- notification -->
 <script type="text/javascript">
// var socket=null;
//   var alarm_boardno= document.getElementById("alarm_boardno").value;
//   var recipient= document.getElementById("recipient").value;
//   var sender= document.getElementById("sender").value;
//   var qna_title= document.getElementById("qna_title").value;
//   // test
//   console.log("alarm_boardno"+alarm_boardno);
//   console.log("recipient"+recipient);
//   console.log("sender"+sender);
//   console.log("qna_title"+qna_title);

//   var alarm_message={
//      	"recipient":recipient,	
//      	"sender":sender,		
//      	"alarm_title":"답글이 작성되었습니다.",
//      	"alarm_content":"작성하신  '"+qna_title+"' 글에 답글이 작성되었습니다.",
//      	"alarm_boardno":alarm_boardno
//   };

$(document).ready(function (){
	 if(WebSocket.readyState!==0){
			console.log("연결된게 없다~");
			 connectWs();
			 }else{
			console.log("연결된게 있다~")
			 }
});

function connectWs(){
 	console.log("sock만들어졌다~")
	 sock = new WebSocket("ws://localhost:8787/green/socket.do");  
	 socket = sock; 
	 


//웹 소켓이 열리면 호출 
	sock.onopen = function() {
       console.log('info: connection opened.');
 };

//서버로부터 메시지를 받았을 때
sock.onmessage = function(evt) {	
 	var data = evt.data;

   	console.log("ReceivMessage : " + data + "\n");
   	notify(data);
   /* 	$.ajax({
		url : '/mentor/member/countAlarm',
		type : 'POST',
		dataType: 'text',
		success : function(data) {
			if(data == '0'){
			}else{
				$('#alarmCountSpan').addClass('bell-badge-danger bell-badge')
				$('#alarmCountSpan').text(data);
			}
		},
		error : function(err){
			alert('err');
		}
   	});
 */
 /* 
   	// 모달 알림
   	var toastTop = app.toast.create({
        text: "알림 : " + data + "\n",
        position: 'top',
        closeButton: true,
      });
      toastTop.open();
	 */
};
//서버와 연결을 끊었을때
sock.onclose = function() {
  	console.log('connect close');
  	/* setTimeout(function(){conntectWs();} , 1000); */
};

sock.onerror = function (err) {console.log('Errors : ' , err);};
}


//메시지 전송
// function sendMessage(){
// 	let today= new Date();
// 	let alarm_date=today.toLocaleString();
// 	alarm_message.alarm_date=alarm_date;	//날짜생성
	
// 	console.log("msg",alarm_message);
	
// 	//스크랩 알림 DB저장
	
// // 		$.ajax({
// // 			type : 'post',
// // 			url : '/mentor/member/saveAlarm',
// // 			data : JSON.stringify(AlarmData),
// // 			contentType: "application/json; charset=utf-8",
// // 			dataType : 'text',
// // 			success : function(data){
// // 				if(socket){
// // 					let socketMsg = "scrap," + memNickname +","+ memberSeq +","+ receiverEmail +","+ essayboard_seq;
// // 					console.log("msgmsg : " + socketMsg);
// // 					socket.send(socketMsg);
// // 				}
	 
// // 			},
// // 			error : function(err){
// // 				console.log(err);
// // 			}
// // 		});
	

// 	if(socket){
// 	console.log("socket존재")
// 	socket.send(JSON.stringify(alarm_message));		//json형태의 String으로 보내줌 
// 	//document.getElementsByClassName("class__qnaReinsert")[0].submit();
// 	}
// 	}
	
//메시지 전송
  function sendMessage(){
  	let today= new Date();
  	let alarm_date=today.toLocaleString();
  	alarm_message.alarm_date=alarm_date;	 //날짜생성
	
  	console.log("msg",alarm_message);
	
  	// 스크랩 알림 DB저장
	
    	/* 	$.ajax({
    			type : 'post',
    			url : '/mentor/member/saveAlarm',
    			data : JSON.stringify(AlarmData),
    			contentType: "application/json; charset=utf-8",
    			dataType : 'text',
    			success : function(data){
    				if(socket){
    					let socketMsg = "scrap," + memNickname +","+ memberSeq +","+ receiverEmail +","+ essayboard_seq;
    					console.log("msgmsg : " + socketMsg);
    					socket.send(socketMsg);
    				}
	 
    			},
    			error : function(err){
    				console.log(err);
    			}
    		}); */
	

  	if(socket){
  	console.log("socket존재")
  	socket.send(JSON.stringify(alarm_message));		 //json형태의 String으로 보내줌 
  	 document.getElementsByClassName("class__qnaReinsert")[0].submit();
  	}
  	}
 
 </script> 
<script src="resources/js/green_notification.js"></script>
</head>
<%
	MemberDto dto = (MemberDto) session.getAttribute("dto");
%>
<body>
	<!--header_1-->
	<nav class="menubar">
		<div class="menubar__menu">
			<div class="menubar__category">
				<a href="main.do">
					<p class="category__name__logo">CORONA GREEN</p>
				</a>
			</div>
			<div class="menubar__category">
				<a href="#"><p class="category__name">ABOUT</p></a> <a
					href="news.do"><p class="category__name">NEWS</p></a> <a
					href="policylist.do"><p class="category__name">POLICY</p></a> <a
					href="qnalist.do"><p class="category__name">QnA</p></a>
			</div>
			<div class="menubar__user__menu">
				<%
					if (dto == null) {
				%>
				<a href="loginform.do"><p class="menubar__sign">SIGN IN</p></a>
			</div>
		</div>
	</nav>
	<div class="background"
		style="background-image: URL(./resources/img/corona-green-logo.png);"></div>
	<%
		} else {
	%>
	<a href="#"><p class="menubar__sign"><%=dto.getId()%></p></a>
	<!--user menu-->
	<!--login:visible-->
	<nav class="menubar__user">
		<div class="user__category">
			<!-- 현모 마이페이지 부분 -->
			<a href="mypage_update.do"><p class="category">MY PAGE</p></a> <a
				href="logout1.do"><p class="category">SIGN OUT</p></a>
		</div>
	</nav>
	</div>
	</div>
	</nav>
	<div class="background"
		style="background-image: URL(./resources/img/corona-green-logo.png);"></div>
	<%
		}
	%>
	<!--chat-->
	<section class="chatbot">
		<div class="chatbot__box">
			<p>🙋‍♀ ASK</p>
		</div>
	</section>
	<!-- donation -->
	<section class="donation">
		<div class="donation__box" onclick="donation();">
			<p>💰 DONATION</p>
		</div>
	</section>
</body>
</html>