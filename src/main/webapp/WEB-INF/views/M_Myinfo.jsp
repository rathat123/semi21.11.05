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
	width: 600px;
	height: 750px;
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
	<!-- Navigation--><!-- 상단바 -->
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
			<form action="M_modify" method="POST" id="modifyForm">
		<table>
			<h1 style="color: white;">회원 수정</h1>
			<tr>
				<th>아이디</th>
				<td><input type="hidden" name="MId" id="MId" onkeyup="idOverlap()">
				${sessionScope.loginId}
				</td>
			</tr>
			
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="MPw" id="MPw" onkeyup="pwRegExp()">
				<br/><span id="pwRegExp"></span></td>
			</tr>
			<tr>
				<th>패스워드 확인</th>
				<td><input type="password" id="checkPw" onkeyup="pwOverlap()">
				<br/><span id="confirmPw"></span></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="MName" placeholder="${member.MName}"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="MPhone" placeholder="${member.MPhone}"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="MBirth" placeholder="${member.MBirth}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="MEmail" id="MEmail" placeholder="${member.MEmail}">
				<span id="emailConfirmText">
				<input type="button" value="인증" onclick="confirmEmail()"></span></td>
			</tr>
			<tr>
				<th>기존 주소</th>
				<td>${member.MAddr}</td>
			</tr>
			
			<tr>
				<th>주소</th>
				
				<td>
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="Addr1">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" name="Addr2"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="Addr3">
					
				</td>
			</tr>

			<tr>
				<td colspan="2">
				<input type="button" value="회원수정" onclick="mModify()">
				<input type="button" value="회원삭제" onclick="mDelete()">
				</td>
			</tr>
		</table>
		<div id="emailConfirmText"></div>
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
	<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">

	
	// 비밀번호 정규식
	function pwRegExp(){
		let MPw = document.getElementById("MPw").value;
		let pwRegExp = document.getElementById("pwRegExp");
		
		let pwPass = false;
	
		let num = MPw.search(/[0-9]/g);
		let eng = MPw.search(/[a-z]/ig);
		let spe = MPw.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);
		
		if(MPw.length < 8 || MPw.length > 15){
			pwRegExp.style.color="#ff0000";
			pwRegExp.innerHTML = "8자리 ~ 15자리 이내로 입력해주세요!";
		} else if(MPw.search(/\s/) != -1) {
			pwRegExp.style.color="#ff0000";
			pwRegExp.innerHTML = "비밀번호는 공백 없이 입력해주세요!";
		} else if(num < 0 || eng < 0 || spe < 0){
			pwRegExp.style.color="#ff0000";
			pwRegExp.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요!";
		} else {
			pwRegExp.style.color="#0000ff";
			pwRegExp.innerHTML = "적절한 비밀번호 입니다!";
			pwPass = true;
		}
		return pwPass;
	}
	
	// 비밀번호 일치여부 확인
	function pwOverlap(){
		let MPw = document.getElementById("MPw").value;
		let pwRegExp = document.getElementById("pwRegExp");
		
		let checkPw = document.getElementById("checkPw").value;
		let confirmPw = document.getElementById("confirmPw");
		
		let pwPass = false;
		
		pwRegExp.innerHTML = "";
		
		if(MPw==checkPw){
			confirmPw.style.color = "#0000ff";
			confirmPw.innerHTML = "비밀번호가 일치합니다!";
			pwPass = true;
		} else {
			confirmPw.style.color = "#ff0000";
			confirmPw.innerHTML = "비밀번호를 확인해주세요!";
		}
		return pwPass;
	}
	
	// 이메일 인증
	function confirmEmail(){
		let MEmail = document.getElementById("MEmail").value;
		let emailConfirmText = document.getElementById("emailConfirmText");
		
		$.ajax({
			type : "GET" ,
			url : "A_emailConfirm" , 
			data : {"MEmail" : MEmail} ,
			dataType : "text" ,
			success : function(data){
				alert("입력하신 이메일로 인증번호가 발송됐습니다!");
				emailConfirmText.innerHTML = "<input type='hidden' id='check2' value='" + data + "'>"
											+ "<br/><input type='text' placeholder='인증번호 입력' id='emailKey'>"
											+ " <input type = 'button' value='확인' onclick='keyCheck()'>"
											+ "<br/><span id='check1'></span>";
			} ,
			error : function(){
				alert("인증번호 발송에 실패했습니다!");
			}
		});

	}
	
	// 인증번호 확인
	function keyCheck(){
		let emailKey = document.getElementById("emailKey").value;
		let check2 = document.getElementById("check2").value;
		let check1 = document.getElementById("check1");
		
		
		let emailPass = false;
		
		if(emailKey==check2){
			check1.style.color="#0000ff";
			check1.innerHTML = "인증번호가 일치합니다";
			emailPass = true;
		} else {
			check1.style.color="#ff0000";
			check1.innerHTML = "인증번호가 일치하지 않습니다";
		}
		return emailPass;
	}

	// 회원수정 버튼
	function mModify(){
		console.log("비밀번호 체크1 : " + pwRegExp());
		console.log("비밀번호 체크2 : " + pwOverlap());
		console.log("이메일 체크 : " + keyCheck());
		
		if(!pwRegExp()){
			alert("비밀번호를 규칙에 맞게 입력해주세요.");
		} else if(!pwOverlap()){
			alert("비밀번호가 일치하지 않습니다.");
		} else if(!keyCheck()){
			alert("이메일 인증을 진행해 주세요.");
		} else{
			modifyForm.submit();
		}
	}
	// 회원 아이디 삭제
	function mDelete(){
		if(confirm("회원 아이디를 삭제 하시겠습니까?"))
		 {
		  location.href="M_delete?MId=${sessionScope.loginId}";
		 }
		 else
		 {
		 alert('아니오를 누르셨습니다');
		 }
		}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                   
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>


</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
    
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="M_modify" method="POST" id="modifyForm">
		<table>
			<caption>회원가입</caption>
			<tr>
				<th>아이디</th>
				<td><input type="hidden" name="MId" id="MId" onkeyup="idOverlap()">
				${sessionScope.loginId}
				</td>
			</tr>
			
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="MPw" id="MPw" onkeyup="pwRegExp()">
				<br/><span id="pwRegExp"></span></td>
			</tr>
			<tr>
				<th>패스워드 확인</th>
				<td><input type="password" id="checkPw" onkeyup="pwOverlap()">
				<br/><span id="confirmPw"></span></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="MName" placeholder="${member.MName}"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="MPhone" placeholder="${member.MPhone}"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="MBirth" placeholder="${member.MBirth}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="MEmail" id="MEmail" placeholder="${member.MEmail}">
				<span id="emailConfirmText">
				<input type="button" value="인증" onclick="confirmEmail()"></span></td>
			</tr>
			<tr>
				<th>기존 주소</th>
				<td>${member.MAddr}</td>
			</tr>
			
			<tr>
				<th>주소</th>
				
				<td>
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="Addr1">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소" name="Addr2"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="Addr3">
					
				</td>
			</tr>

			<tr>
				<td colspan="2">
				<input type="button" value="회원수정" onclick="mModify()">
				<input type="button" value="회원삭제" onclick="mDelete()">
				</td>
			</tr>
		</table>
		<div id="emailConfirmText"></div>
	</form>


	</body>

<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">

	
	// 비밀번호 정규식
	function pwRegExp(){
		let MPw = document.getElementById("MPw").value;
		let pwRegExp = document.getElementById("pwRegExp");
		
		let pwPass = false;
	
		let num = MPw.search(/[0-9]/g);
		let eng = MPw.search(/[a-z]/ig);
		let spe = MPw.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);
		
		if(MPw.length < 8 || MPw.length > 15){
			pwRegExp.style.color="#ff0000";
			pwRegExp.innerHTML = "8자리 ~ 15자리 이내로 입력해주세요!";
		} else if(MPw.search(/\s/) != -1) {
			pwRegExp.style.color="#ff0000";
			pwRegExp.innerHTML = "비밀번호는 공백 없이 입력해주세요!";
		} else if(num < 0 || eng < 0 || spe < 0){
			pwRegExp.style.color="#ff0000";
			pwRegExp.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요!";
		} else {
			pwRegExp.style.color="#0000ff";
			pwRegExp.innerHTML = "적절한 비밀번호 입니다!";
			pwPass = true;
		}
		return pwPass;
	}
	
	// 비밀번호 일치여부 확인
	function pwOverlap(){
		let MPw = document.getElementById("MPw").value;
		let pwRegExp = document.getElementById("pwRegExp");
		
		let checkPw = document.getElementById("checkPw").value;
		let confirmPw = document.getElementById("confirmPw");
		
		let pwPass = false;
		
		pwRegExp.innerHTML = "";
		
		if(MPw==checkPw){
			confirmPw.style.color = "#0000ff";
			confirmPw.innerHTML = "비밀번호가 일치합니다!";
			pwPass = true;
		} else {
			confirmPw.style.color = "#ff0000";
			confirmPw.innerHTML = "비밀번호를 확인해주세요!";
		}
		return pwPass;
	}
	
	// 이메일 인증
	function confirmEmail(){
		let MEmail = document.getElementById("MEmail").value;
		let emailConfirmText = document.getElementById("emailConfirmText");
		
		$.ajax({
			type : "GET" ,
			url : "A_emailConfirm" , 
			data : {"MEmail" : MEmail} ,
			dataType : "text" ,
			success : function(data){
				alert("입력하신 이메일로 인증번호가 발송됐습니다!");
				emailConfirmText.innerHTML = "<input type='hidden' id='check2' value='" + data + "'>"
											+ "<br/><input type='text' placeholder='인증번호 입력' id='emailKey'>"
											+ " <input type = 'button' value='확인' onclick='keyCheck()'>"
											+ "<br/><span id='check1'></span>";
			} ,
			error : function(){
				alert("인증번호 발송에 실패했습니다!");
			}
		});

	}
	
	// 인증번호 확인
	function keyCheck(){
		let emailKey = document.getElementById("emailKey").value;
		let check2 = document.getElementById("check2").value;
		let check1 = document.getElementById("check1");
		
		
		let emailPass = false;
		
		if(emailKey==check2){
			check1.style.color="#0000ff";
			check1.innerHTML = "인증번호가 일치합니다";
			emailPass = true;
		} else {
			check1.style.color="#ff0000";
			check1.innerHTML = "인증번호가 일치하지 않습니다";
		}
		return emailPass;
	}

	// 회원수정 버튼
	function mModify(){
		console.log("비밀번호 체크1 : " + pwRegExp());
		console.log("비밀번호 체크2 : " + pwOverlap());
		console.log("이메일 체크 : " + keyCheck());
		
		if(!pwRegExp()){
			alert("비밀번호를 규칙에 맞게 입력해주세요.");
		} else if(!pwOverlap()){
			alert("비밀번호가 일치하지 않습니다.");
		} else if(!keyCheck()){
			alert("이메일 인증을 진행해 주세요.");
		} else{
			modifyForm.submit();
		}
	}
	// 회원 아이디 삭제
	function mDelete(){
		if(confirm("회원 아이디를 삭제 하시겠습니까?"))
		 {
		  location.href="M_delete?MId=${sessionScope.loginId}";
		 }
		 else
		 {
		 alert('아니오를 누르셨습니다');
		 }
		}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                   
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>

 --%>