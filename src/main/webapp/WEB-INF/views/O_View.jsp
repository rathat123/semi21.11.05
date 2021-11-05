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
<title>Shop Homepage - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel="stylesheet" href="resources/css/GListstyles.css">


<style>
body {
	background-color: #F0E8C4;
}

.list-table {
	margin-top: 40px;
	position: relative;
	width: 600px;
	background-color: white;

}



.list-table thead th {
	height: 40px;
	border-top: 2px solid #09C;
	border-bottom: 1px solid #CCC;
	font-weight: bold;
	font-size: 17px;
	text-align: center;
}

.list-table tbody td {
	text-align: center;
	padding: 10px 0;
	border-bottom: 1px solid #CCC;
	height: 20px;
	font-size: 14px;
}

.bak_item {
	height: 100px;
	margin-top: 20px;
}

.button1 {
  background-color: black;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 12px;
  font-weight: bold;
}

.button2 {
  background-color: white;
   text-align: center;
  text-decoration: none;
  display: inline-block;
  border-radius: 8px;
  
  
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
	<!-- Header-->
	

	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">장바구니</h1>
			</div>
		</div>
	</header>
	
	<!-- Section-->




	<section class="py-5">
		<div class="container px-4 px-lg-5 mt-5">
			<div
				class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">



				 <table class="list-table">
				      <thead>
				          <tr>
				              <th width="350">상품정보</th>
				              <th width="200">상품금액</th>
				              <th width="200">상품수량</th>
				              <th width="200">삭제</th>
				           </tr>
				        </thead>
				      
				      
				        <tbody>
				        <c:forEach var="order" items="${order}">
				        <tr>
				          <td width="300">
				          	<div class="bak_item">
							<div><img src="resources/gphoto/${order.GPhoto}" width="50px"
								onclick="location.href='G_view?GNo=${order.GNo}'"></div>
							<div>
							${order.OName}<input type="hidden" value="${order.GNo}"
								name="GNo">
							</div>
						</div>
				          </td>
				          <td width="200">${order.OPrice}</td>  
				          <td width="200">${order.ONo}</td>
				          <td width="200">
				       <button class="button1" onclick="location.href='O_delete?GNo=${order.GNo}'">삭제</button>
				       </td>
				        </tr>
				        </c:forEach>
				      </tbody>
				
					<tr>
						<td colspan="5">전체가격 : ${sum} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="button2" onclick="checkout()">결제하기</button>
						</td>
					</tr>
				
				
				    </table>

			</div>
		</div>


	</section>






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


<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">
	// 결제
	function checkout() {
		var input = prompt("카드번호를 입력해주세요", "1234-5678-9012-3456");
		if (input == null) {
			alert("결제를 취소 하셨습니다.");
		} else {
			alert("결제 완료!");
			location.href = "O_checkOut";
		}
	}
</script>
</html>
