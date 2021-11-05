<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Cinema</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="resources/favicon/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="resources/css/table.css">
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/style.css" rel="stylesheet" />
<link href="resources/css/cwrite.css" rel="stylesheet" />
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<style>
@charset "UTF-8";

.card-body {
    flex: 1 1 auto;
    padding: 1rem 1rem;
}

.tit-heading-wrap > h3 {
    display: inline-block;
    position: relative;
    height: inherit;
    margin: 0;
    background-image: none;
    color: #222;
    font-weight: 500;
    font-size: 36px;
    text-align: left;
    vertical-align: middle;
}

* {
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	font-family: sans-serif;
}

element.style {
	
}

.faq {
	padding: 60 px 0;
}

.section-bg {
	background-color: #fef8f5;
}

section {
	padding: 60 px 0;
	overflow: hidden;
}

*, ::after, ::before {
	box-sizing: border-box;
}

user agent stylesheet
section {
	display: block;
}

body {
	font-family: "Open Sans", sans-serif;
	color: #212529;
}

.tbl_notice_list a {
	display: block;
	width: 540 px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

a {
	color: inherit;
	text-decoration: none;
}

html, body, #contaniner, #footer {
	background-color: #fdfcf0;
}

body, input, textarea, select, button, table {
	font-size: 20px;
	left: 40%; line-height : 1.2;
	color: black;
	font-family: 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
	font-weight: 300;
	line-height: 1.2;
	text-align: center;
}

.tbl_notice_list thead th {
	padding: 10 px 0 8 px 0 px;
	border-bottom: solid 1 px #e1dfd5;
	text-align: center;
	background-color: #edebe1;
}

.tbl_notice_list tbody td {
	padding: 15 px 0 px 13 px 0 px;
	border-top: solid 1 px #d6d4ca;
	text-align: center;
}

.tbl_notice_list .tit, .tbl_notice_list .txt {
	text-align: left;
	padding: 10 px 15 px 8 px;
}

.joinForm {
	margin-top: 50px;
	position: absolute;
	width: 900px;
	height: 450px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	text-align: center;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	position: absolute;
}

.joinForm h2 {
	text-align: center;
	margin: 30px;
}

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 0px 0px;
}



.btn:hover {
	background-position: right;
}

body {
	background-image: url(resources/favicon/yellow.jpeg);
	background-size: cover;
}

.tit-heading-wrap {
	position: relative;
	height: 25px;
	margin-top: 30 px;
	border-bottom: 3 px solid #241d1e;
	text-align: center;
}

[class|="sect-base"][class$="movie"] {
	
}

.col-md-6 {
	flex: 0 0 auto;
	width: 48%;
}

.row {
    --bs-gutter-x: 1.5rem;
    --bs-gutter-y: 0;
    display: flex;
    flex-wrap: wrap;
    margin-top: calc(var(--bs-gutter-y) * -1);
    margin-right: calc(var(--bs-gutter-x) * 1);
    margin-left: calc(var(--bs-gutter-x) * -1);
}
  
thead, tbody, tfoot, tr, td, th {
    border-color: inherit;
    border-style: solid;
    border-width: 1;
}

.btn-outline-dark {
    color: #212529;
    border-color: #212529;
}

@media (min-width: 992px)
.navbar-expand-lg .navbar-collapse {
    display: flex !important;
    flex-basis: auto;
}

</style>
</head>
<body>
<!-- 상단바 -->
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="CC_cMainForm">ICIA CINEMA</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                &nbsp;&nbsp;
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    
                        <li class="nav-item"><a class="nav-link" href="CC_list">Ticket</a></li>
                       	<li class="nav-item"><a class="nav-link" href="G_list">Shop</a></li>
                        <li class="nav-item"><a class="nav-link" href="Q_list">QNA</a></li>
                        <c:choose>
                    	<c:when test="${not empty sessionScope.loginId}">
                    	
                        <li class="nav-item dropdown">
                             
						<c:choose>
						
						<c:when test="${sessionScope.loginId eq 'admin'}">
						     <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자</a>
						</c:when>
						
						<c:otherwise>
						 <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">${sessionScope.loginId}님</a>
						</c:otherwise>
						
						</c:choose>

                         
                           
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="M_myinfoForm">내 정보 보기</a></li>
                                <li><a class="dropdown-item" href="O_view">장바구니</a></li>
                                
                                  <c:if test="${sessionScope.loginId eq 'admin'}">
                                <li><a class="dropdown-item" href="G_uploadForm">상품 등록</a></li>
                                <li><a class="dropdown-item" href="CC_writeForm">영화 등록</a></li>
                                </c:if>
                                <li><a class="dropdown-item" href="Q_writeForm">QNA 등록</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="M_logout">로그아웃</a></li>
                            </ul>
                        </li>
                        </c:when>
                        </c:choose>
                    </ul>
                    
                    <c:choose>
                    <c:when test="${empty sessionScope.loginId}">
                    	<button class="btn btn-outline-dark" onclick="location.href='M_loginForm'">
                            로그인
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                        &nbsp;&nbsp;&nbsp;
                        <button class="btn btn-outline-dark" onclick="location.href='M_joinForm'">
                            회원가입
                            <span class="badge bg-dark text-white ms-1 rounded-pill"></span>
                        </button>
                    </c:when>
                    </c:choose>   
                </div>
            </div>
        </nav>
        <!-- 상단바 -->
        
	<div class="tit-heading-wrap">
		<h3 style="margin-top:40px; font-weight: bold;">영화상세</h3>
		<div class="textForm" >
			<br />
		</div>
	</div>
	<section class="py-5" style="padding: 30px;">
		<div class="container px-4 px-lg-5 my-5">
			<div class="row gx-4 gx-lg-5 align-items-center" style="margin-top:30px;">
				<div class="col-md-6">
						<div style="padding-top:20px; font-weight: bold; font-size:25px;">
						${view.CTitle}
						</div>
					<br/>
					<div >
						<img src="resources/cinema/${view.CPosterName}"
								width="350px">
						</div>
				</div>
				<div class="col-md-6" style="padding-left:1px;">
					<div class="small mb-1">

						<div>
						<table border="2" style="width: 100%;">
							<tr>
								<th style="font-size: 20px;">번호</th>
								<td style="font-size: 20px;">${view.CNo}</td>
							</tr>
						
							<tr>
								<th style="font-size: 20px;">조회수</th>
								<td style="font-size: 20px;">${view.CHit}</td>
							</tr>
						
							<tr>
								<th style="font-size: 20px;">개봉일</th>
								<td style="font-size: 20px;">${view.CDate}</td>
							</tr>
							<tr>
								<th style="font-size: 20px;">감독</th>
								<td style="font-size: 20px;">${view.CDirector}</td>
							</tr>
							<tr>
								<th style="font-size: 20px;">배우</th>
								<td style="font-size: 20px;">${view.CActor}</td>
							</tr>
							<tr>
								<th style="font-size: 20px;">장르</th>
								<td style="font-size: 20px;">${view.CGenre}</td>
							</tr>
							<tr>
								<th style="font-size: 20px;">관람나이</th>
								<td style="font-size: 20px;">${view.CAge}</td>
							</tr>
						</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="card mb-4" style="width:800px; margin-left: 430px;">
       <div class="card-body" style="font-size: 15px; text-align:center;" >
               ${view.CContent}
                            </div>
                        </div>
</br>
</body>

<div style="width:800px; margin-left: 430px;" >

<div>
		<textarea class="form-control" id="RContent" rows="3" cols="100" placeholder="작성"></textarea><br/>
			
		<input type="radio" name="star" value="★☆☆☆☆" id="RGrade" >1점
		<input type="radio" name="star" value="★★☆☆☆" id="RGrade">2점
		<input type="radio" name="star" value="★★★☆☆" id="RGrade">3점
		<input type="radio" name="star" value="★★★★☆" id="RGrade">4점
		<input type="radio" name="star" value="★★★★★" id="RGrade">5점
		<br/>
		<div style="margin-top:10px;">
		<button type="button" class="btn btn-primary btn-sm" id="cmtBtn" style="font-size:15px;">리뷰작성</button>
		</div>
		
	</div>
	<div id="reviewArea" style="padding: 10px;"></div>
</body>

<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">

	// M_View.jsp 페이지 로딩시 댓글 목록 조회
	$(document).ready(function(){
		let CCBNo = ${view.CNo};
		let MID = '${sessionScope.loginId}';
		
		$.ajax({
			type : "POST",
			url : "CCR_list",
			data : {"CCBNo" : CCBNo}, // 여기까지 넘긴다.
			dataType : "json",
			success : function(result){
				reviewList(result);
			},
			error : function(){
				alert("댓글 리스트 불러오기 실패!");
			}
		});
		
		// 아이디가 ~~ 인 것을 클릭했을떄
		$("#cmtBtn").click(function(){
			let MId = '${sessionScope.loginId}';
			let CCBNo = ${view.CNo};
			let RContent = $("#RContent").val();
			let RGrade = document.querySelector('input[name="star"]:checked').value; // 체크된 값(checked value)
			let RDate = $("#RDate").val();
			
			$.ajax({
				type : "POST",
				url : "CCR_write",
				data : {
					"MId": MId,
					"CCBNo": CCBNo,
					"RContent": RContent,
					"RGrade": RGrade,
					"RDate": RDate
					},
					
				dataType : "json",
				success : function(result){
					reviewList(result);
					$("#RContent").val("");
				},
				error : function(){
					alert("댓글 입력 실패!");
				}				
			});
		});
	});
	
	function reviewList(result){
		let output = "";
		
		output += "<table class='table table-striped'>";
		output += "<thead>";
		output += "<tr>";
		output += "<th>작성자</th>";
		output += "<th>댓글 내용</th>";
		output += "<th>별점</th>";
		output += "<th>날짜</th>";
		output += "</tr>";
		output += "</thead>";
		output += "<tbody>";
		for(var i in result){
			
			output += "<tr>";
			output += "<td>"+result[i].MId+"</td>";
			output += "<td>"+result[i].RContent+"</td>";
			output += "<td>"+result[i].RGrade+"</td>";
			output += "<td>"+result[i].RDate+"</td>";
			
			output += "</tr>";
		}
		
		output += "<tbody>";
		output += "</table>";
		
		$("#reviewArea").html(output);
	}
	

	
</script>

</html>