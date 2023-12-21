<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/css/common/template.css">

<style>

.menu_name {
margin-bottom: 10px;	
}
 
.table {
width : 800px;
display : flex;
}

.space { 
width : 30px;
}

.td_container{
width : 610px;
height : 90px;

}

.button_container {
width: 264px;
height : 90px;
display : flex;

}

 
 .selected_tab_button {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 7px;
 background: #FFDE30;
 border:none;
 font-size: 18px;
 height: 40px;
 padding: 0 11px;
 text-align: center;
 width: 20%;
 min-width: 200px;
 font-weight: 500;
 color: #0F1111;
 margin-right: -4px;
 border-bottom-left-radius: 0%;
 border-bottom-right-radius: 0%;
 :hover{
     background: #F7CA00;
     border-color: #F2C200;
     box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
 	}
 }

 .tab_button {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 7px;
 background: #F9FAFB;
 border:1px solid #FFDE30;
 font-size: 18px;
 height: 40px;
 padding: 0 11px;
 text-align: center;
 width: 20%;
 min-width: 200px;
 font-weight: 500;
 color: #0F1111;
 margin-right: -4px;
 border-bottom-left-radius: 0%;
 border-bottom-right-radius: 0%;
 :hover{
     background: #F7CA00;
     border-color: #F2C200;
     box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
 	}
 }


  .confirm_recreate {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 6px;
 border: 2px solid #FFDE30;
 color: #0F1111;
 background-color: #FFDE30;
 padding: 8px;
 box-shadow: rgba(0, 0, 0, 0.07) 0px 2px 4px 0px, rgba(0, 0, 0, 0.05) 0px 1px 1.5px 0px;
 font-weight: 800;
 font-size: 16px;
 height: 40px;
 width : 80px;
 margin-left : 10px;
 margin-top : 25px;
 :hover{
     background: 0 0;
     color: #ff4742;
 	}
 
}
 
  .confirm_delete {
 display: inline-block;
 outline: 0;
 cursor: pointer;
 border-radius: 6px;
 border: 2px solid #ff4742;
 color: #fff;
 background-color: #ff4742;
 padding: 8px;
 box-shadow: rgba(0, 0, 0, 0.07) 0px 2px 4px 0px, rgba(0, 0, 0, 0.05) 0px 1px 1.5px 0px;
 font-weight: 800;
 font-size: 16px;
 height: 40px;
 width: 80px;
 margin-left : 10px;
 margin-top : 25px;
 :hover{
     background: 0 0;
     color: #ff4742;
 	}
 
}

.add_addr {
    display: inline-block;
    outline: 0;
    cursor: pointer;
    border-radius: 8px;
    box-shadow: 0 2px 5px 0 rgb(213 217 217 / 50%);
    background: #FFF;
    border: 4px solid #FFDE30;
    font-size: 20px;
    color: gray;
    width: 750px;
    height: 100px;
    
    margin: 0 0 12.22px 25px;
    text-align: center;
}

.line {
 		margin-bottom : 10px;
 		width : 750px;
 		margin-left: 25px;
        border: 1px solid #ccc;
     }


</style>	
	
</head>
<body>
	<div class="wrap">
        <div class="header">
        	<c:if test="${empty adminLoginInfo}">
	            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        	</c:if>
        	<c:if test="${!empty adminLoginInfo}">
	            <%@ include file="/WEB-INF/views/common/header_admin.jsp" %>
        	</c:if>
        </div>

       	
        
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<h1 class = "menu_name">회원정보</h1>
					    <button class ="tab_button" type="button" onclick="location.href='/user/edit.do'">기본정보 변경</button>
					    <button class ="tab_button" type="button" onclick="location.href='/user/edit_addr.do'">주소 변경</button>
					    <button class ="selected_tab_button" type="button" onclick="location.href='/user/edit_payment.do'">결제 수단</button>
					
					    <table style="border: 1px solid #FFDE30; border-collapse: collapse;" width="800" >
					        
					        <!--결제수단이 존재하는만큼 td를 생성-->
					        <c:if test="${empty paymentvo }">
					        	<tr class="table">
						            <td>
						                <br>
						                <div>아직 등록된 결제 수단(주소)이 없습니다.</div>
						                <div>새 결제 수단(주소)을 추가해주세요.</div>
						                <br>
						            </td>
						        </tr>
						        <tr>
						        	<td colspan="2">
					        		<hr>
						        	</td>
						    	</tr>
					        </c:if>
					        
					        <c:forEach var="vo" items="${paymentvo }">
					        	
					        	<c:if test="${vo.type eq 0 }">
					        	
					        		<tr class="table">
							            <td class = "space"></td>
							    
							            <td class = "td_container">
							                <br>
						                	<div><span>결제 수단 : 카드 (${vo.name })</span><br></div>
						                    <div><span>카드 번호 : ${vo.account }</span><br></div>
						                    <div><span>유효 기간 : ${vo.valid_date}</span></div>
							            </td>
							            <td class = "button_container">
							                <button class = "confirm_recreate" type="button" name="modify" onclick="window.open('/user/modify_payment_form.do?no=${vo.no}&type=${vo.type }&name=${vo.name }&account=${vo.account }&cvc=${vo.cvc }&company=${vo.company }&valid_date=${vo.valid_date }','user_modify_addr_form', 'width=430,height=500,location=no,status=no,scrollbars=yes');">수정</button>&nbsp&nbsp&nbsp&nbsp 
							                <button class = "confirm_delete"  type="button" name="delete" onclick="location.href='/user/delete_payment.do?no=${vo.no}'">삭제</button>
							                <br>
							            </td>
						        	</tr>
					        	</c:if>
					        	<c:if test="${vo.type eq 1 }">
					        		<tr class="table">
							            <td>
							                <br>
							                <div><span>결제 수단 : 계좌 이체</span></div>
							                <div><span>계좌 별명 : ${vo.name }</span></div>
							                <div><span>계좌 번호 : </span></div>
							                <div><span>${vo.account }</span></div>
							            </td>
							            <td>
							            <td class = "button_container">
							                <button class = "confirm_recreate" type="button" name="modify" onclick="window.open('/user/modify_payment_form.do?no=${vo.no}&type=${vo.type }&name=${vo.name }&account=${vo.account }&company=${vo.company }','user_modify_addr_form', 'width=430,height=500,location=no,status=no,scrollbars=yes');">수정</button>&nbsp&nbsp&nbsp&nbsp 
							                <button class = "confirm_delete" type="button" name="delete" onclick="location.href='/user/delete_payment.do?no=${vo.no}'">삭제</button>
							                <br>
							            </td>
						        	</tr>
					        	</c:if>
						        
						        <tr>
						        	<td colspan="2">
						        		<hr class = "line">
						        	</td>
						       	</tr>
						        
						    </c:forEach>
					        <tr class = "table">
					            <td>
									<button class = "add_addr" onclick="window.open('/user/add_payment_form.do','user_add_payment_form', 'width=500,height=700,location=no,status=no,scrollbars=yes');">+ 결제 수단 추가</button>
					            </td>
					        </tr>
					    </table>
     				</div>
			</div>

        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>