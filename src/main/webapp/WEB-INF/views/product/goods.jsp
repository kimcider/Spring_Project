<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <style>

        .board_area {
            max-width: 600px;
            margin: 0 auto;
        }

        .board_title {
            cursor: pointer;
            padding: 10px;
            background-color: #f0f0f0;
            display: inline-block;
            margin-right: 10px;
        }

        .board_title.on {
            background-color: #ddd;
        }

        .board_contents {
            display: none;
        }

        .board_contents.active {
            display: block;
        }



    </style>
</head>
<body>

    <div class="goods-container">

        <div class="goods-photo">
            <img src="https://i.namu.wiki/i/guH7wBKc-HUuTjbCy8jbSkofYyRJCnRA6F-6j4r4uCfC3iuRrYpUJm8AV6vlAoGqMdQloDpUowBmA6oUgz1tnoat7aoPEJHF_2WctibFipJeTUcIKBhcAqDw3gDuPnVQk86aMhunl-g57uBjMYuPMQ.webp" alt="Product Image">
        </div>

        <div class="goods-details">
            <div id="goods_category" style="width: 720px; height: 100px; border: 1px solid black">
                화살표 이미지<br>
                강아지 > 사료
            </div>

            <div id="goods_menu">
                <div class="goods-name" style="width: 720px; height: 100px; border: 1px solid black;">
                    <h1>스테이씨</h1>
                    대충 평점 이미지
                </div>

                <div class="goods-price" style="width: 720px; height: 100px; border: 1px solid black;">
                    <h2>20000 KRW</h2>
                </div>

                <div class="goods-explain" style="width: 720px; height: 100px; border: 1px solid black;">
                    세상에서 가장 이쁜 스테이씨
                </div>

                <div class="goods-option" style="width: 720px; height: 100px; border: 1px solid black;">
                    <form action="다음페이지" method="get" id="select_option">
                        옵션 : <select name="order" form="myForm">
                            <option value="leg">관절영양(+ 0원)</option>
                            <option value="stance">발목(+ 1000원)</option>
                            <option value="head">머리(+ 1000원)</option>
                        </select>
                        "하트" add to WishList
                    </form>

                    수량 조절 이미지
                    <input type="button" style="background-color: grey;" value="장바구니 담기">
                    <input type="button" style="background-color: yellow" value="바로 구매"><br>
                    100,000원 이상 구매시 무료배송 (배송조건 이런거 없나요?)
                </div>
            </div>
        </div>
    </div>

    <div class="goods_review_Q&A">
        <div class="board_area">
            <div class="board_title on" onclick="showBoard('board_notice')" data-board="board_notice">리뷰</div>
            <div class="board_title" onclick="showBoard('board_data')" data-board="board_data">Q&A</div>

            <div class="board_contents active" id="board_notice">
                <ul>
                    <li>리뷰입니다.<span>2023-10-18</span></li>
                </ul>
            </div>

            <div class="board_contents" id="board_data">
                <ul>
                    <li>질문입니다.<span>2023-10-18</span></li>
                </ul>
            </div>
        </div>
    </div>

    <script>
        function showBoard(boardId) {
            const boards = document.querySelectorAll('.board_contents');
            const titles = document.querySelectorAll('.board_title');

            boards.forEach(board => board.classList.remove('active'));
            titles.forEach(title => title.classList.remove('on'));

            const selectedBoard = document.getElementById(boardId);
            const selectedTitle = Array.from(titles).find(title => title.dataset.board === boardId);

            if (selectedBoard && selectedTitle) {
                selectedBoard.classList.add('active');
                selectedTitle.classList.add('on');
            }
        }
    </script>



</body>
</html>