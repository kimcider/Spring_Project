<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri = 'http://java.sun.com/jsp/jstl/functions' %>
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
 
.zzim_On {
  display: inline-block;
  outline: 0;
  border: none;
  cursor: pointer;
  padding: 0 24px;
  border-radius: 50px;
  width: 150px;
  height: 35px;
  font-size: 15px;
  background-color: #fd0;
  font-weight: 500;
  color: #222;
  margin-top:5px;
  
 }
 
 .price{
 text-align: center;
 margin_top : 80px;
 margin-left: 40px;
 font-size: 20px;
 }
 
.goods_container {
display : flex;

}

.menu_name {
margin-bottom: 30px;	
}

.goods_image {
width : 100px;
hegiht : 100px;
}

.goods_name {
position:relative;
margin-left : 30px;
margin-top : 20px;
width: 1000px;
height: 100px;
}

.go_more {
width :150px;
height : 100px;
margin-top: 20px;
margin-left: 20px;	
}

.goods_info {
width: 200px;
height : 100px;
}

</style>      

</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header.jsp" %>
        </div>
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_user_info.jsp"%>
            </div>
			<div class="contentsright">
			
			<input type ="hidden"  value = "${userLoginInfo.no }">
				
				<h1 class= "menu_name">찜 박스</h1>
				<c:forEach items="${save_list2}" varStatus = "zzim_quant" >
					<div class="goods_container">
						<div class="goods_image">	
							<c:if test="${empty save_list2[zzim_quant.index][0] }">
								<img src="/resources/img/product/no_image.jpg" width="100" height="100">
							</c:if>
							
							<c:if test="${!empty save_list2[zzim_quant.index][0] && fn:substring(save_list2[zzim_quant.index][0], 0, 1) == 'h' }">
								<img src="${save_list2[zzim_quant.index][0] }" width="100" height="100">
							</c:if>
							
							<c:if test="${!empty save_list2[zzim_quant.index][0] && !(fn:substring(save_list2[zzim_quant.index][0], 0, 1) == 'h') }">
								<img src="/resources/img/product/registed_img/${save_list2[zzim_quant.index][0]}" width="100" height="100">
							</c:if>
						</div>	
						
						<div class="goods_name">
							<c:if test = "${not empty save_list2[zzim_quant.index][1]}">
						   	<h4> <a href="/user/product/goods.do?no=${save_list2[zzim_quant.index][4]}">${save_list2[zzim_quant.index][1]}</a></h4>
						   	</c:if>
						</div>

						<div class="goods_info">	
							<c:if test = "${not empty save_list2[zzim_quant.index][2]}">
							${save_list2[zzim_quant.index][2]} <br>
							</c:if>
						</div>
							
							<c:if test = "${not empty save_list2[zzim_quant.index][4]}">
							<input type = "hidden" value ="${save_list2[zzim_quant.index][4]}"> <br>
							</c:if>
							<c:if test = "${not empty save_list2[zzim_quant.index][5]}">
							<input type="hidden" value="${save_list2[zzim_quant.index][5]}">	
							</c:if>
						
						<div class = "button">
							<c:if test = "${not empty save_list2[zzim_quant.index][3]}">
							<a class = "price">${save_list2[zzim_quant.index][3]}원 </a><br>
							</c:if>
						
							<c:if test = "${not empty save_list2[zzim_quant.index][4]}">
							<button class="zzim_On" data-no="${save_list2[zzim_quant.index][4]}"> 찜 목록 해제 </button> <br>
							</c:if>
						</div>
							
					 </div>  
				   </c:forEach>			
				<c:if test="${empty save_list2[zzim_quant.index] }"><br><h2>찜 박스에 상품이 존재하지 않습니다.</h2></c:if>
				<h1> 병천이 부탁 " 페이징 처리 5개씩 요청 "</h1>
			</div>
        </div>
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>    
<script>

$(".zzim_On").on('click', zzim);

function zzim(){
	console.log($(this).data('no'));
	
	var user_no = ${userLoginInfo.no };
	var product_no = $(this).data('no');
	
	var result = confirm("찜 목록에서 삭제 하시겠습니까?");
	 if(result){
			$.ajax({
				method: "POST",
				url:'/user/product/zzimcancel.do',
				async: true,
				type:'HTML',
				data: {
					product_no : product_no,
					   user_no : user_no
				},
				success : function(response){
					alert("찜 등록이 삭제 되었습니다.");
					history.go(0);
				},
				error: function (error) {
					alert("오류가 발생했습니다. 잠시 후 다시 이용해주세요");
		        }
			});
		}else{
			return;
		}
	
}

</script>
</body>
</html>