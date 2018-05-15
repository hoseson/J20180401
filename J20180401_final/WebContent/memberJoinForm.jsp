<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
h3 {
	text-align: left;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp');
	});
	
	$(document).ready(function(){
	    $('#id').keyup(function(){//키보드 입력시 반응하는 메소드
	        var idReg =  /^[a-z]+[a-z0-9]{4,18}$/g;//표준정규식(아이디는 영문자로 시작하는 5~19자 영문자 또는 숫자
	        var idcheck = document.getElementById("idcheck");	//아이디중복체크용	
	        if ( $('#id').val().length >= 0) {
	            var id = $(this).val();
	            // ajax 실행
	            $.ajax({
	                type : 'POST',
	                url : 'memberConfirmId.do',
	                data:
	                {
	                    id:id
	                },
	                success : function(result) {
	                	if(idReg.test($("input[name=id]").val())){//이름이 id인 input의 값을 표준정규식에 맞는지 확인
	                		if (result==1){
	                			$("#idBlank").html("아이디가 중복되었거나 사용 불가능한 아이디 입니다.");
			                    $("#idBlank").css('color', 'red');
	                			frm.idcheck.value=false;
	                		}
			                if (result==0){
			                    $("#idBlank").html("사용 가능한 아이디 입니다.");
			                    $("#idBlank").css('color', 'green');
			                    frm.idcheck.value=true;
			                }
	                	}else {
		                 		$("#idBlank").html("아이디가 중복되었거나 사용 불가능한 아이디 입니다.");
			                    $("#idBlank").css('color', 'red');
			                    frm.idcheck.value=false
	                    }
	                }
	            }); // end ajax
	        }
	    }); // end keyup
	});
	
	function idPwCheck(){//비밀번호 일치 여부 확인 메소드
		var pw=document.getElementById("pw").value;
		var pw2=document.getElementById("pw2").value;
		var id = document.getElementById("id").value;
		
		if(pw!=pw2){
			document.getElementById("pwBlank").innerHTML = "비밀번호가 일치하지 않습니다.";
			return false;
		 
		}
 		if (id=="") {//아이디 미기입시 안내 ajax
 			document.getElementById("idBlank").innerHTML = "아이디를 입력해주세요.";
			frm.id.focus();
			return false;
		} 
	}

	function Authenticate() {
		//본인인증 시 이메일 전송을 위한 팝업창
		var email = document.getElementById("email");
		if (!frm.email.value) {
			alert("이메일을 입력해주세요");
			frm.email.focus();
			return false;
		}
		window.open("sendMail.do?email=" + frm.email.value + "&authcheck="
				+ frm.authcheck.value, "", "width=400 height=300");
	}
</script>

<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/joinMenu.jpg" />
		</div>
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0 30px 0; background-color: #DCE6F2">
			<!-- 중앙 메뉴 -->
			<!-- 여기에 입력해주세요.  -->
			<form action="memberJoinPro.do" name="frm" onsubmit="return idPwCheck()">
					<input type="hidden" name="idcheck" value="false">
				<table align="center">
					<tr>
						<td><h3>아이디</h3></td>
						<td><input type="text" name="id" id="id" maxlength="19" required placeholder="ID는 영문으로 시작하되 숫자를 넣을수 있습니다. 글자수는 5~19자리." size="55"></td>
					</tr>
					<tr>
						<td></td>
						<td><span id = "idBlank" style="color: red;"></span></td>
					</tr>
					<tr>
						<td><h3>비밀번호 입력</h3></td>
						<td>
						<input type="password" name="pw" id="pw" maxlength="20" required  size="55" placeholder="비밀번호는 최대 20자입니다.">

						</td>
					</tr>
					<tr>
						<td><h3>비밀번호 확인</h3></td>
						<td><input type="password" name="pw2" id="pw2" maxlength="20" required  size="55"></td>
					</tr>
					<tr>
						<td></td>
						<td>
						<span id="pwBlank" style="color: red;"></span>
						</td>						
					</tr>
					<tr>
						<td><h3>이름</h3></td>
						<td><input type="text" name="name" required size="55"></td>
					</tr>
					<tr>
						<td><h3>전화번호</h3></td>
						<td><input type="tel" name="tel" placeholder="예)02-123-1234또는010-1234-1234"
							pattern="\d{2,3}-\d{3,4}-\d{4}"
							title="예)02-123-1234  예)010-1234-1234" required size="55"></td>
					</tr>
					<tr>
						<td><h3>주소</h3></td>
						<td><input type="text" name="addr" required size="55"></td>
					</tr>
					<tr>
						<td><h3>이메일</h3></td>
						<td>
						<input type="email" name="email" id="email" required size="55" placeholder="예)abc@naver.com"></td>
						<input type="hidden" name="email2" id="email2">
					</tr>
					<tr>
						<td><h3>본인인증</h3></td>
						<td><input type="button" id="authentication"
							name="authentication" value="인증하기" onclick="Authenticate()"
							style="width: 130px; height: 40px; background-color: #4f81bc; font-family: '휴먼모음T'; font-size: 20px; color: white;">
							<input type="hidden" name="authcheck" value="false"></td>
					</tr>
					<tr>
						<td><h3>이용약관</h3></td>
						<td colspan="2">
							<div>
								<dl>
									<dt style="text-align: left;"></dt>
									<textarea rows="15" cols="70">
									제1조 본인은 홈페이지 운영 관리 상의 목적으로 개인정보 제공에 동의한다.
									제2조 본인은 홈페이지 운영 및 이용에 부적절한 행위를 했을 경우 해당 계정 삭제에 동의한다.
									제3조 본인은 타인의 저작권 보호와 SNS상의 윤리의식 준수에 동의한다.
									제4조를 삭제한다.
									제5조 회원탈퇴 및 강제 계정삭제 시 회원과 관련된 모든 정보는 일괄 삭제된다.
									제5조 를 다음과 같이 변경한다.
									제5조 회원탈퇴 및 강제 계정삭제 시 회원과 관련된 모든 정보는 일괄 삭제되지만 DB상에는 일정기간 존재한다.
									제40조의3을 다음과 같이 신설한다.
									제40조의3(전략물자등의 경유 또는 환적 허가의 기준) 법 제23조제4항에서 "국제평화, 안전유지 및 국가안보 등 대통령령으로 정하는 기준"이란 다음 각 호의 기준을 말한다.
									  1. 해당 전략물자등이 평화적 목적에 사용될 것.
									  2. 해당 전략물자등의 경유 또는 환적이 국제평화 및 안전유지와 국가안보에 영향을 미치지 아니할 것.
									  3. 해당 전략물자등의 수출자, 수입자, 최종 사용자 등이 거래에 적합한 자격을 가지고 있고 그 전략물자등의 사용 용도를 신뢰할 수 있을 것.
									  4. 그 밖에 제32조 각 호에 따른 국제수출통제체제의 원칙 중 산업통상자원부장관이 정하여 고시하는 사항을 지킬 것.
									제70조를 삭제한다.
								          부칙
									제1조(시행일) 이 영은 2016년 7월 28일부터 시행한다. 다만, 제32조제7호는 무기거래조약이 대한민국에 대하여 효력을 발생하는 날부터 시행한다.
									제2조(기계류의 하자 및 유지 보수를 위한 외화획득용 원료ㆍ기재의 외화획득 이행기간에 관한 적용례) 제27조제1항제4호의 개정규정은 이 영 시행 이후 기계류의 하자 및 유지 보수를 위한 외화획득용 원료ㆍ기재를 수입하는 경우부터 적용한다. 									
									대외무역법 시행령 일부개정령
									
									대외무역법 시행령 일부를 다음과 같이 개정한다.
									</textarea>
									<br>
									<p style="text-align: left;">
										위 약관에 동의하십니까? <input type="checkbox" name="agree" value="y"
											required>
								</dl>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center"><input type="submit"
							value="회원가입"
							style="width: 150px; height: 50px; background-color: #4f81bc; font-family: '휴먼모음T'; font-size: 30px; color: white;">
							<input type="reset" value="초기화"
							style="width: 150px; height: 50px; background-color: #4f81bc; font-family: '휴먼모음T'; font-size: 30px; color: white;">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>

