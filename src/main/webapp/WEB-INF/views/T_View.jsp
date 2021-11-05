<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>영화 등록</title>
        <link href="css/cwrite.css" rel="stylesheet" />
        <link href="resources/css/styles.css" rel="stylesheet" />
		<link href="resources/css/bootstrap.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <style>
        body {
		background-image: url(resources/favicon/yellow.jpeg);
		background-size: cover;
		}
        </style>
    </head>

    <body class="bg-primary">
    <!-- nav -->
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
        <!-- end nav -->
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main style="height:500px;">
                    <div class="container">
                        <div class="row justify-content-center" style="padding: 30px;">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">영화 등록</h3></div>
                                    <div class="card-body">
                                     
                                            <div class="row mb-3">
                                               <div class="col-md-6">
                                               <h4>[영화]</h4>
                                              		 <h5>${view.CTitle}</h5>   
                                                    </div>
                                                </div>
                                                <div class="form-floating mb-3">
                                               <h4>[날짜]</h4>
                                               <h5>${view.TDate}</h5>                                                                                   
                                            </div>
                                            
                                             
                 							 <div class="form-floating mb-3">
                 							 <h4>[시간]</h4>
                                                <h5>${view.TTime}</h5>  
                                            </div>    
                                            
                 							 <div class="form-floating mb-3">
                 							  <h4>[인원]</h4>
                                               <h5>${view.TNum}</h5>  
                                            </div> 
                                             
                 							 <div class="form-floating mb-3">
                 							 <h4>[가격]</h4>
                 							 <h5> ${Sum}</h5> 
                                            </div> 
                                            
 
                                            <div class="mt-4 mb-0">
                                               <button  onclick="checkout()" class="btn btn-primary">결제하기</button>
                                            </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
           
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
    <script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">
// 결제
	function checkout(){
		 var input = prompt("카드번호를 입력해주세요","1234-5678-9012-3456");
		if(input == null){
			alert("결제를 취소 하셨습니다.");
		} else {
			alert("결제 완료!");
			location.href="T_checkOut";
		}
	}
</script>

</html>

