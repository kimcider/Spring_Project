<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/css/common/template.css">
    
    <style>
    	.product_preview{
    		float : left;
    		margin-right : 40px;
    	}
	    .product_preview_name{
			width        : 170px;
			text-overflow: ellipsis;
			white-space  : nowrap;
			overflow     : hidden;
			display      : block;
		}
		.product_preview_info{
			width : 170px;
			height : 28px;
		}
		.product_preview_info > div{
			width : 50%;
			height : 100%;
		}
		.product_preview_price{
			float : left;
			font-size : 120%
		}
		.product_preview_rating{
			float: right;
			text-align: right;
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
                <%@ include file="/WEB-INF/views/common/quickmenu_product_category.jsp"%>
            </div>
			<div class="contentsright">
				<div>
					<c:forEach var="product" items="${list}" varStatus="status">
						<div class="product_preview">
							<div><img src="${product.image_url }" width="170px" height="200px"></div>
							<div class="product_preview_name">${product.name}</div>
							<div class="product_preview_info">
								<div class="product_preview_price"><strong>${product.price}</strong>원</div>
								<div class="product_preview_rating">${product.rating}</div>
							</div>
							<p style=clear:both;></p>
						</div>
						
						<c:if test="${status.index%4 == 3}"><p style=clear:both;></p><br></c:if> 
					</c:forEach>
				</div>
			</div>
        </div>
        
        
        <div class="footer">
			<div class="footer-color"></div>
        </div>
    </div>
</body>
</html>