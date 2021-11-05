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
<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<style>
@charset "UTF-8";

* {
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	font-family: sans-serif;
}


.btn:hover {
	background-position: right;
}

.top_title_faq {
    overflow: hidden;
    padding: 11px;
    border-top: solid 1px #b8b6aa;
    background-color: #edebe1;
}

.view_area {
    padding: 35px 13px;
    border-bottom: solid 1px #b8b6aa;
    line-height: 24px;
}

.customer_top .tit {
    font-size: 20px;
}

.top_title_faq .stit_area .check_tit_area {
    margin-left: 20px;
}

.top_title_faq .stit_area .regist_day {
    margin-left: 9px;
    font-size: 12px;
    font-family: 'Verdana';
    color: #222;
}

.top_title_faq .stit_area .check_num, .top_title_faq .stit_area .regist_day {
    margin-left: 9px;
    font-size: 12px;
    font-family: 'Verdana';
    color: #222;
}

.top_title_faq .title {
    float: left;
    font-size: 17px;
    font-weight: 500;
    display: block;
    overflow: hidden;
    width: 530px;
    white-space: nowrap;
    text-overflow: ellipsis;
}

body {
	background-image: url(resources/favicon/yellow.jpeg);
	background-size: cover;
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
	<!-- Page Content-->
	<header class="masthead">
		<div
			class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
			<div class="d-flex justify-content-center" >
				<div class="text-center22" style="border-radius: 30px;">
						
			<div class="col-detail">
			<div class="customer_top" >
				<h2 class="tit">상세정보</h2>
			</div>
			<div class="board_view_area" style="width:980px;">
				<ul class="top_title_faq" style="width:980px; padding-left: 10px;" >
					<li class="title">제목: ${view.QTitle}</li>
					<li class="stit_area" style="width:900px;">
						<span>작성자: <em class="regist_day">${view.MId}</em></span>
						<span class="check_tit_area">번호: <em class="check_num">${view.QNo}</em></span>
						<span class="check_tit_area">조회수: <em class="check_num">${view.QHit}</em></span>
					</li>
					</ul>
			<div class="view_area" style="height:150px;">
					<p><span style="font-family:맑은 고딕">${view.QContent}</span><br>
				</div>
			</div>
		</div><br/>
				<!-- 관리자만 답변을 할 수 있게 -->
				<c:if test="${sessionScope.loginId eq 'admin' }">
		<div>
				<textarea class="form-control" id="CContent" rows="3" placeholder="작성"></textarea><br/>
				<button type="button" class="btn btn-primary btn-sm" id="cmtBtn">댓글입력</button>
		</div>
		</c:if>
		<div id="commentArea"></div>
				</div>
			</div>
		</div>
	</header>
</body>

<!-- Bootstrap core JS-->
<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">

	// M_View.jsp 페이지 로딩시 댓글 목록 조회
	$(document).ready(function(){
		let CBNo = ${view.QNo};
		let CWriter = '${sessionScope.loginId}';
		
		$.ajax({
			type : "POST",
			url : "C_list",
			data : {"CBNo" : CBNo}, // 여기까지 넘긴다.
			dataType : "json",
			success : function(result){
				commentList(result);
			},
			error : function(){
				alert("댓글 리스트 불러오기 실패!");
			}
		});
		
		// 아이디가 ~~ 인 것을 클릭했을떄
		$("#cmtBtn").click(function(){
			let CWriter = '${sessionScope.loginId}';
			let CContent = $("#CContent").val();
			let CBNo = ${view.QNo};
			
			$.ajax({
				type : "POST",
				url : "C_write",
				data : {
					"CWriter": CWriter,
					"CContent": CContent ,
					"CBNo": CBNo
					},
				dataType : "json",
				success : function(result){
					commentList(result);
					$("#CContent").val("");
				},
				error : function(){
					alert("댓글 입력 실패!");
				}				
			});
		});
		
		
	});
	
	function commentList(result){
		let output = "";
		
		output += "<table class='table table-striped'>";
		output += "<thead>";
		output += "<tr>";
		output += "<th>작성자</th>";
		output += "<th>댓글 내용</th>";
		output += "</tr>";
		output += "</thead>";
		output += "<tbody>";
		for(var i in result){
			
			output += "<tr>";
			output += "<td>"+result[i].CWriter+"</td>";
			output += "<td>"+result[i].CContent+"</td>";
			output += "</tr>";
			
		}
		
		output += "<tbody>";
		output += "</table>";
		
		$("#commentArea").html(output);
	}
</script>
</html>

