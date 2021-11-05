<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>ICIA CINEMA</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/GListstyles.css" rel="stylesheet" />
        <style>
       

     body {
	background-image: url(resources/cinema/main.jpg);
	background-repeat: no-repeat;
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
        <section>
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-6" style="color:white">
                        <h1 class="mt-5" style="font-size:100px">007 노 타임 투 다이</h1>
                        <p style="font-size:50px">가장 강력한 운명의 적과 마주하게된 제임스 본드의 마지막 미션이 시작된다</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Bootstrap core JS-->
       
    </body>
</html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"> </script>

<!-- 원판 -->
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화_index</title>
</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.loginId eq 'admin'}">
			<button onclick="location.href='CC_list'">영화목록</button>
			<button onclick="location.href='Q_list'">QNA목록</button>

			<button onclick="location.href='CC_writeForm'">영화등록</button>

			<button onclick="location.href='M_myinfoForm'">내정보</button>
			<button onclick="location.href='G_uploadForm'">상품등록</button>
	<button onclick="location.href='G_list'">상품목록</button>
			<button onclick="location.href='M_logout'">로그아웃</button>
		</c:when>

		<c:when test="${not empty sessionScope.loginId}">		
			<button onclick="location.href='CC_list'">영화목록</button>
			
			<button onclick="location.href='Q_list'">QNA목록</button>
			<button onclick="location.href='Q_writeForm'">QNA 작성하기</button>
			

			<button onclick="location.href='M_myinfoForm'">내정보</button>
			<button onclick="location.href='M_logout'">로그아웃</button>

		</c:when>

		<c:otherwise>
			<button onclick="location.href='CC_list'">영화목록</button>
			<button onclick="location.href='M_joinForm'">회원가입</button>
			<button onclick="location.href='M_loginForm'">로그인</button>
			<button onclick="location.href='Q_list'">QNA목록</button>			
		</c:otherwise>

	</c:choose>

</body>
</html> --%>