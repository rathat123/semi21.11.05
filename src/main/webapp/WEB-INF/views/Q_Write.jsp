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
<title>Qna</title>
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


.alert-danger {
    color: #82322f;
    background-color: #f7dddc;
    border-color: #f4cbca;
}

.btn-outline-info {
    color: #287bb5;
    border-color: #287bb5;
    border-top-color: rgb(40, 123, 181);
    border-right-color: rgb(40, 123, 181);
    border-bottom-color: rgb(40, 123, 181);
    border-left-color: rgb(40, 123, 181);
}

.writeForm {
	margin-top: 170px; position : absolute;
	width: 400px;
	height: 500px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	text-align: center;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	
	position: absolute;
}

.writeForm h2 {
	text-align: center;
	margin: 30px;
}

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.id {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.QTitle {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}



body {
	background-image: url(resources/favicon/yellow.jpeg);
	background-size: cover;
}

</style>
</head>
<body>
<c:if test="${sessionScope.loginId==null }">
		<div class="alert alert-dismissible alert-danger" style="width:500px;">
  		<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
 		<a class="alert-link">로그인</a> 후 사용해주세요.
		</div>
</c:if>
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
			<div class="d-flex justify-content-center">
				<div class="text-center22" style="border-radius: 30px;">
					<form action="Q_write" method="POST" name="writeForm" class="writeForm">

						<h3 style="padding-top:24px;">문의사항</h3>
						<div class="textForm">
							<input type="text" name="MId" id="MId" class="id" value="${sessionScope.loginId}"
							 placeholder="${sessionScope.loginId}"> <br />
						</div>

						<div class="textForm">						
							<input type="text" name="QTitle" id="QTitle" class="QTitle"
								placeholder="제목"> <br />
						</div>

						<div class="form-group">
                    <label for="exampleTextarea" class="form-label mt-4">문의 내용</label>
                    <textarea class="form-control" name="QContent" id="exampleTextarea" rows="3"></textarea>
                  </div>
				  <br />
				
					<button type="submit" class="btn btn-primary">등록</button>

					</form>
				</div>
			</div>
		</div>
	</header>
	
</body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"> </script>
