<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
    <link rel="stylesheet" href="resources/css/table.css">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/GListstyles.css" rel="stylesheet" />
        
        <style>
      .tit-heading-wrap {
   		position: relative;
    	height: 51px;
    	margin-top: 30px;
    	border-bottom: 3px;
 		solid #241d1e;
		}
		
		header {
		height: 130px;
		background-color: black;
		}
		
		header {
		border: 1px solid #999;
		padding: 10px;
	} 
	
	[class|="sect"][class*="chart"] > ol {
    padding-top: 30
px
;
    margin-left: -64
px
;
    border-bottom: 3
px
 solid #241d1e;
    zoom: 1;
}

.rank {
    background: red;
}



.rank {
    display: block;
    height: 40px;
    margin-bottom: 4px;
    border: 6px solid #000000;
    color: #ffffff;
    font-size: 19px;
    text-align: center;
    line-height: 28px;
}

.thumb-image {
    border: 6px solid #000000;
}

.thumb-image {
    display: block;
    position: relative;
}

 .thumb-image > img {
    height: 260
px
;
}
.box-image img {
    width: 100%;
}
 img {
    vertical-align: middle;
}

[class|="sect"][class*="chart"] .title {
    font-size: 15px;
}

.title {
    display: block;
    color: #333333;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}



element.style {
}
.wrap-movie-chart .box-contents {
    height: 93
px
;
}
.box-contents {
}

. body{
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    word-break: break-all;
}

.div {
    display: block;
}

.li {
    text-align: -webkit-match-parent;
}

.ol {
    list-style-type: decimal;
}

body, input, textarea, select, button, table {
    font-size: 13px;
    line-height: 1.2;
    color: #666;
    font-family: 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif;
    font-weight: 300;
}

[class|="sect"][class*="chart"] .score .percent {
    vertical-align: middle;
}


strong {
    font-weight: 500;
}

 a:link { text-decoration:none; color:black;}

 a:visited { text-decoration:none;color:black;}

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
        <div id="wapper">
        <header>
			<p style="text-align: center; font-size: 50px; margin:13px;
		color: #FFF;">무비차트</p>
		</header>
        </div>
        
        <!-- Section-->
        
        <form action="CCS_search">
	<div style="display: flex;
  	justify-content: left; 
  	margin-top: 30px;
  	margin-left: 20px;">
  	
		<select name="selectVal">
			<option value="CTitle">제목</option>
			<option value="CContent">내용</option>
			<option value="CGenre">장르</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</div>
	</form>
        
        
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                   

                   <!-- 여기부터 -->
                   <c:forEach var="ccsList" items="${ccsList}">
                   <ol style="list-style: none">
            
                <li>
                    <div class="box-image">
                        <strong class="rank">No.${ccsList.CNo}</strong>	
                        <a href="CC_view?cNo=${ccsList.CNo}&page=${paging.page}">
                            <span class="thumb-image">
                               <img src="resources/cinema/${ccsList.CPosterName}" width="200px">
                            </span>
                        </a>
                    </div>
                    
                    
                    <div class="box-contents">
                        
                            <strong class="title" style="font-weight:bold; font-size:15px; margin-top:10px;">
							<a href="CC_view?cNo=${ccsList.CNo}&page=${paging.page}" style="text-decoration-line: none;">${ccsList.CTitle}</a>
							
							</strong>
                      

                        <div class="score" style="margin-top: 15px;">
                            <strong class="percent">조회수&nbsp;&nbsp;<span>${ccsList.CHit}</span></strong>
                        </div>

                        <span class="txt-info">
                            <strong>
                                ${ccsList.CDate}
                                <span>개봉</span>  
                            </strong>
                        </span>
                        
                        <!-- 예매 -->
                         <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center" style="margin-top: 15px;"><a class="btn btn-outline-dark mt-auto" href="T_buyForm?CNo=${ccsList.CNo}">예매</a></div>
                         </div>
                    </div>    
                </li>
            </ol>
     </c:forEach>
                  
     <!-- 여기까지 상품 한개 -->
     
 		</div>
        </div>
            <div style="display: flex; justify-content: center;">
         	<!-- 페이징 처리-->
	<!-- [이전] -->
	<c:if test="${paging.page <= 1}">[이전]</c:if>
	<c:if test="${paging.page > 1}"><a href="CC_list?page=${paging.page-1}">[이전]</a></c:if>
	
	<!-- [숫자] -->
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" step="1" var="i">
		<c:choose>
			<c:when test="${paging.page eq i}">${i}</c:when>
			<c:otherwise><a href="CC_list?page=${i}">${i}</a></c:otherwise>
		</c:choose>
	</c:forEach>
	
	<!-- [다음] -->
	<c:if test="${paging.page >= paging.maxPage}">[다음]</c:if>
	<c:if test="${paging.page < paging.maxPage}"><a href="CC_list?page=${paging.page+1}">[다음]</a></c:if>
	
	</div>
	
        </section>
        
    
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2021</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
    </body>
</html>
