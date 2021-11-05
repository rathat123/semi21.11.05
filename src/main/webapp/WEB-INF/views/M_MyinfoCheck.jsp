<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>ICIA CINEMA</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/GListstyles.css" rel="stylesheet" />

<style>
.text-center23 {
	width: 400px;
	height: 300px;
	text-align: center !important;
	background-color: white;
	background: rgba(0, 0, 0, 0.7);
	margin-right: auto;
	margin-left: auto;
}

table, td, tr {
	border: 1px solid white;
	border-collapse: collapse;
	padding: 15px;
	text-align: center;
	margin-right: auto;
	margin-left: auto;
	color: white;
}

.background {
	position: relative;
	width: 100%;
	height: auto;
	padding: 15rem 0;
	background: linear-gradient(to bottom, rgba(0, 0, 0, 0.3) 0%,
		rgba(0, 0, 0, 0.7) 75%, #000 100%);
	background-color: gray;
	background-position: center;
	background-attachment: scroll;
	background-size: cover;
	background-repeat: no-repeat;
}

.pass{

height: 800px;
margin-right: auto;
	margin-left: auto;
}
</style>

</head>
<body>
	<!-- Navigation-->
	<!-- 상단바 -->
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
	<!-- Section-->


	<section class="background">

	<div class="pass">
	
	
		<div class="text-center23" style="border-radius: 30px;">
			<form action="M_myinfo" method="POST">
<table>
<h1 style="color: white;">비밀번호 확인</h1>
<tr>
	<th>아이디</th>
	<td>
	<input type="hidden" value="${sessionScope.loginId}" name="MId">
	${sessionScope.loginId}
	</td>
</tr>

<tr>
	<th>비밀번호</th>
	<td><input type="password" name="MPw"></td>
</tr>
<tr>
	<td colspan="2">
	<input type="submit" value="확인">
	</td>
</tr>

</table>


</form>
		</div>
	</section>



</div>



	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2021</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
</html>


<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="M_myinfo" method="POST">
<table>
<tr>
	<th>아이디</th>
	<td>
	<input type="hidden" value="${sessionScope.loginId}" name="MId">
	${sessionScope.loginId}
	</td>
</tr>

<tr>
	<th>비밀번호</th>
	<td><input type="password" name="MPw"></td>
</tr>
<tr>
	<td colspan="2">
	<input type="submit" value="확인">
	</td>
</tr>

</table>


</form>


</body>
</html> --%>