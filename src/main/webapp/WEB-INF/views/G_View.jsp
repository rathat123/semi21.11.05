<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>ICIA CENEMA</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/gviewstyles.css" rel="stylesheet" />
   
   
    <style>
         body{
       background-color: #F0E8C4 ;
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
        <!-- Product section-->
        <form action="O_cart" method="get">
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                    <div class="col-md-6"><img class="card-img-top mb-5 mb-md-0" src="resources/gphoto/${goods.GPhoto}" alt="..." /></div>
                    <div class="col-md-6">
                        <div class="small mb-1">${goods.GNo}
			<input type="hidden" name="GNo" value="${goods.GNo}">
			<input type="hidden" name="OName" value="${goods.GName}">
			<input type="hidden" name="OPrice" value="${goods.GPrice}">
			<input type="hidden" name="GPhoto" value="${goods.GPhoto}"></div>
                        <h1 class="display-5 fw-bolder">${goods.GName}</h1>
                        <div class="fs-5 mb-5">
                            
                            <span>${goods.GPrice}</span>
                        </div>
                        <p class="lead">${goods.GExplain}</p>
                        <div class="d-flex">
                            <input class="form-control text-center me-3" name="ONo" id="inputQuantity" type="num" value="1" style="max-width: 3rem" />
                            <input class="btn btn-outline-dark flex-shrink-0" type="submit" value="Add to cart">
                            &nbsp;&nbsp;&nbsp;
                            
                            <c:if test="${sessionScope.loginId eq 'admin'}">
                            <input class="btn btn-outline-dark flex-shrink-0" type="button" value="삭제" onclick="location.href='G_delete?page=${paging.page}&GNo=${goods.GNo}'">
                            </c:if>
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>

        Footer
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        Bootstrap core JS
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        Core theme JS
        <script src="js/scripts.js"></script>
    </body>
</html>
<%-- 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table, tr, td, th{
	border : 1px solid black;
	border-collapse : collapse;
	padding : 10px;
}
</style>

</head>
<body>


</body>
</html>
 --%>