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
<link href="resources/css/style.css" rel="stylesheet" />
<style>
@charset "UTF-8";

* {
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	font-family: sans-serif;
}


element.style {
}
.faq {
    padding: 60
px
 0;
}
.section-bg {
    background-color: #fef8f5;
}
section {
    padding: 60
px
 0;
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
	font-size: 18px;
	line-height: 1.2;
	color: #666;
	font-family: 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
	font-weight: 300;
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
	padding: 10px 10px;
}


.btn:hover {
	background-position: right;
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
	
	
<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->	
	<section id="faq" class="faq section-bg">
      <div class="container aos-init aos-animate" data-aos="fade-up">

        <div class="section-title">
          <h2>F.A.Q</h2>
          <p>자주찾는 질문</p>
        </div>

        <ul class="faq-list aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">

          <li>
            <div data-bs-toggle="collapse" class="collapsed question" href="#faq1">[영화관이용] 운영시간은 어떻게 되나요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq1" class="collapse" data-bs-parent=".faq-list">
              <p>
                평일/ 주말 오전, 오후로 운영되며
				운영 환경에 따라 운영 시간이 변동될 수 있는 점 참고 부탁드립니다.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq5" class="collapsed question">[영화관이용] 관람 등급에 대해 알고 싶습니다. <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq5" class="collapse" data-bs-parent=".faq-list">
              <p>
               ■ 등급 기준
  				- 전체 관람가 : 모든 연령의 관람객이 관람 할 수 있는 영화 <br/>
  				- 12세 관람가 : 만 12세 미만의 관람객은 관람 할 수 없는 영화 (보호자 동반 시 12세 미만 관람 가능) <br/>
  				- 15세 관람가 : 만 15세 미만의 관람객은 관람 할 수 없는 영화 (보호자 동반 시 15세 미만 관람 가능)	<br/>
  				- 청소년 관람불가 : 만 18세 미만의 관람객은 관람 할 수 없는 영화
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq2" class="collapsed question">[홈페이지] 인터넷 예매 후 현장에서 환불(예매 취소)이 가능한가요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq2" class="collapse" data-bs-parent=".faq-list">
              <p>
                인터넷 예매하신 부분은 상영시간 전까지는 현장에서 환불 가능합니다.
				단, 부분 환불은 되지 않습니다.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq3" class="collapsed question">[멤버쉽/VIP] 회원정보 수정, 회원 탈퇴는 어디에서 가능한가요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq3" class="collapse" data-bs-parent=".faq-list">
              <p>
                홈페이지에 접속하여 내정보에서 회원정보 수정 및 회원탈퇴가 가능합니다.
				직접 변경 및 회원탈퇴가 어려우실 경우 고객센터를 이용해주시기 바랍니다.
              </p>
            </div>
          </li>

          <li>
            <div data-bs-toggle="collapse" href="#faq4" class="collapsed question">[모바일] 인터넷 예매 시 결제수단에는 어떤 것들이 있나요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq4" class="collapse" data-bs-parent=".faq-list">
              <p>
               온라인 예매 시 결제수단은 카드로 결제 하실 수 있습니다.
              </p>
            </div>
          </li>


          <li>
            <div data-bs-toggle="collapse" href="#faq6" class="collapsed question">[예매/관람권] 인터넷 예매 후 예매내용 확인은 어떻게 하나요? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></div>
            <div id="faq6" class="collapse" data-bs-parent=".faq-list">
              <p>
                홈페이지 로그인 후 [나의 예매내역]에서 확인하실 수 있습니다.
              </p>
            </div>
          </li>

        </ul>

      </div>
    </section>
	
	
	<!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  --><!--  -->
	<section id="team" class="team">
      <div class="container">

        <div class="section-title aos-init aos-animate" data-aos="fade-up">
          <p>Q&A목록</p>
        </div>



        <div class="row">
        
			<div class="container">


						<div class="textForm">
							<div class="tbl_area">
								<table cellspacing="0" cellpadding="0" class="tbl_notice_list" style="width: 100%;">
									<caption></caption>
									<colgroup>
										<col style="width: 40px;">
										<col style="width: 120px;">
										<col style="width: 560px;">
										<col style="">
									</colgroup>
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="qnaList" items="${qnaList}">
											<tr>
												<td>${qnaList.QNo}</td>
												<td><a
													href="Q_view?QNo=${qnaList.QNo}&page=${paging.page}">${qnaList.QTitle}</a></td>
												<td>${qnaList.MId}</td>
												<td>${qnaList.QHit}</td>
											</tr>
										</c:forEach>


									</tbody>
								</table>
								
							</div>
							<br />
						</div>
        </div>
        
        <table cellspacing="0" cellpadding="0" class="tbl_notice_list">
        <caption style="text-align: center;">
        <!-- 페이징 처리-->
								<!-- [이전] -->
								<c:if test="${paging.page <= 1}">[이전]</c:if>
								<c:if test="${paging.page > 1}">
									<a href="Q_list?page=${paging.page-1}">[이전]</a>
								</c:if>

								<!-- [숫자] -->
								<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
									step="1" var="i">
									<c:choose>
										<c:when test="${paging.page eq i}">${i}</c:when>
										<c:otherwise>
											<a href="Q_list?page=${i}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<!-- [다음] -->
								<c:if test="${paging.page >= paging.maxPage}">[다음]</c:if>
								<c:if test="${paging.page < paging.maxPage}">
									<a href="Q_list?page=${paging.page+1}">[다음]</a>
								</c:if>
								
								</caption></table>
        	
      </div>
      
      
    </section>
	
				
						

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>

