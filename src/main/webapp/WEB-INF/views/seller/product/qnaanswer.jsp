<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
	<div class="wrap">
        <div class="header">
            <%@ include file="/WEB-INF/views/common/header_seller.jsp" %>
        </div>
        <div class="contents">
        	<div class="quickmenu">
                <%@ include file="/WEB-INF/views/common/quickmenu_seller.jsp"%>
            </div>
			<div class="contentsright">
				<div>	
					판매자 번호 : ${sellerLoginInfo.no }
				
					<c:forEach items="${qna_array }" varStatus ="status_1">	
						<div> 
							<c:forEach items="${qna_array }" varStatus="status_2">
									<c:if test = "${status_2.index == 0}">
									  제품명 : ${qna_array[status_1.index][status_2.index]}
									</c:if>	
									<c:if test = "${status_2.index == 1}">
									  제품 번호 : ${qna_array[status_1.index][status_2.index]} <br>
									</c:if>		
									
									<div >
										<c:if test = "${status_2.index == 2}">
		 									<a class="quest_no" value="${qna_array[status_1.index][status_2.index]}">
		 									질문 번호 :
		 								    <span>${qna_array[status_1.index][status_2.index]}</span> 
		 								    </a> 
										</c:if>		
									</div>	
									
									<c:if test = "${status_2.index == 3}">
									  질문 등록일 : ${qna_array[status_1.index][status_2.index]} <br>
									</c:if>		
									<c:if test = "${status_2.index == 4}">
									  질문 내용 : ${qna_array[status_1.index][status_2.index]} <br>
									</c:if>		
									<c:if test = "${status_2.index == 5}">
									  답변 등록일 : ${qna_array[status_1.index][status_2.index]}
									</c:if>		
									<c:if test = "${status_2.index == 6}">
									 	 답변 내용 : 
									 	 <c:if test="${'null' == qna_array[status_1.index][status_2.index]}">
									 	 	<input type= text id ="answer_content" class="answer_content" style="width:400px; height:50px"> 		  
							  				<input type="button" id="submit" name = "등록" value="등록" class="writeAnswer" ><br><br>	
										 	 <br><br>
									 	 </c:if>
									 	 <c:if test="${'null' != qna_array[status_1.index][status_2.index]}">
									 	 		${qna_array[status_1.index][status_2.index]}
										 	 <br><br>
									 	 </c:if>
									 	 
						  			</c:if>	
										
									<c:if test = "${status_2.index == 7}">
									  상태 : ${qna_array[status_1.index][status_2.index]} <br><br>
									</c:if>
					         </c:forEach>   
					         				
				         </div>
			      	</c:forEach>
				</div>
			</div>
        </div>
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
<script>
	
	$('.writeAnswer').on('click', qnaanswer);
	
	function qnaanswer() {
			
		console.log(   $(this.parentNode).find('.quest_no').find('span').text());

		var answer_content = $(this.parentNode.querySelector("#answer_content")).val();
		var no = $(this.parentNode).find('.quest_no').find('span').text();
		console.log(answer_content);
		console.log(no);
		
		$.ajax({
			method:'GET',
			url:'/seller/product/qnaanswer.do',
			async: true,
			type:'HTML',
			data: {
				answer_content : answer_content,
							no : no
			},
			success : function(response){
				history.go(0);
			},
			error: function (error) {
	        }
		});
	}

</script>
</body>
</html>