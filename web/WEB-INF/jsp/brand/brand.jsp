<%--
  Created by IntelliJ IDEA.
  User: 최예슬
  Date: 2021-05-12
  Time: 오후 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&family=Oswald:wght@300&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        #first{
            
        }

        #title{
            font-size: 100px;
            font-family: 'Caveat', cursive;
            font-weight: bold;
        }

        #role, #role2{
            font-size: 30px;
        }
    </style>
    <link href="css/heroes.css" rel="stylesheet">
</head>
<body>
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>
<main>
    <h1 class="visually-hidden"></h1>
    <div id="first" class="px-4 py-5 my-5 text-center">
        <h1 id="title" class="display-5 fw-bold">Little4 Restaurant</h1>
        <div class="col-lg-6 mx-auto">
            <p class="lead mb-4" style="font-size: 40px; font-family: 'Amatic SC', cursive;">by Team4</p>
        </div>
        <img src="img/forests.jpg" style="max-width: 100%; height:auto;">
    </div>

    <div class="b-example-divider"></div>

    <div class="px-4 py-5 text-center" >
        <h1 class="mb-5 display-4 fw-bold" style="font-family: 'Noto Serif KR', serif;"> Team Introduction</h1>
        <div>
            <p id="role" class="fw-bold" style="font-family: 'Noto Serif KR', serif;">Back-end</p>
            <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">201912039 김우중</p>
            <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">201713866 송성호</p>
            <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">201713919 윤주현</p>
            <br>
            <p id="role2" class=" fw-bold" style="font-family: 'Noto Serif KR', serif;"> Front-end</p>
            <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">201912149 최예슬</p>
            <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">201912161 허수빈</p>
        </div>
    </div>

    <div class="b-example-divider"></div>

    <div class="px-4 py-5 container">
        <div>
            <div class="pt-4 pb-4">
                <h1 style="font-family: 'Noto Serif KR', serif; float: right" class="pb-3 display-5 fw-bold">Naming Story</h1> <div style="clear:both"></div>
                <p style="font-family: 'Noto Serif KR', serif;" class="fs-4 mb-3" style="float: right">Little4 restaurant, 2018년에 개봉한 동명의 영화 'Little Forest'에서 따온 이름으로 4팀의 의미를 담아 for를 Four, 4로 바꾸고, 뒤에 레스토랑을 붙여 Little4 restaurant이 되었다.</p>
            </div> <div style="clear:both"></div>
        </div>
    </div>

    <div class="b-example-divider"></div>

    <div class="container px-4 py-5">
            <div>
                <h1 style="font-family: 'Noto Serif KR', serif;" class="display-4 fw-bold lh-1 mb-3">Fuction</h1>
                <br>
                <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">기능 개선 목록 </p>
                    <div style="font-family: 'Noto Serif KR', serif; float: left">예약 정보 수정</div>
                    <div style="font-family: 'Noto Serif KR', serif; float: right">
                        <input type="button" value="이동" onclick="location.href='userReservationInfo.do'" class="btn btn-dark">
                    </div> <div style="clear:both"></div>
                <br>
                    <div style="font-family: 'Noto Serif KR', serif; float: left">대기 리스트</div>
                    <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" class="btn btn-dark">
                    </div> <div style="clear:both"></div>
                <br>
                    <div style="font-family: 'Noto Serif KR', serif; float: left">테이블 자동 배정</div>
                    <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" class="btn btn-dark">
                    </div> <div style="clear:both"></div>
                <br>
                    <div style="font-family: 'Noto Serif KR', serif; float: left">한번에 여러 테이블 예약</div>
                    <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" class="btn btn-dark">
                    </div>
                <br>
                <br>
                <br>
                <p style="font-family: 'Noto Serif KR', serif;" class="fs-4">기능 추가 목록 </p>
                <div style="font-family: 'Noto Serif KR', serif; float: left">로그인</div>
                <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" onclick="location.href='loginPage.do'" class="btn btn-dark">
                </div> <div style="clear:both"></div>
                <br>
                <div style="font-family: 'Noto Serif KR', serif; float: left">회원 가입</div>
                <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" onclick="location.href='signupPage.do'" class="btn btn-dark">
                </div> <div style="clear:both"></div>
                <br>
                <div style="font-family: 'Noto Serif KR', serif; float: left">고객 관리(블랙리스트, pw 초기화, 회원 삭제)</div>
                <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" onclick="location.href='userManager.do'" class="btn btn-dark">
                </div> <div style="clear:both"></div>
                <br>
                <div style="font-family: 'Noto Serif KR', serif; float: left">발열 체크</div>
                <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" class="btn btn-dark">
                </div> <div style="clear:both"></div>
                <br>
                <div style="font-family: 'Noto Serif KR', serif; float: left">통계</div>
                <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" class="btn btn-dark">
                </div> <div style="clear:both"></div>
                <br>
                <div style="font-family: 'Noto Serif KR', serif; float: left">테이블 설정</div>
                <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" class="btn btn-dark">
                </div> <div style="clear:both"></div>
                <br>
                <div style="font-family: 'Noto Serif KR', serif; float: left">주문/결제</div>
                <div style="font-family: 'Noto Serif KR', serif; float: right">
                    <input type="button" value="이동" style="float: right" onclick="location.href='packing.do'" class="btn btn-dark">
                </div> <div style="clear:both"></div>
            </div>
    </div>

    <div class="b-example-divider mb-0"></div>

</main>


<script src="js/bootstrap.bundle.min.js"></script>

<%@include file="../common/footer.jsp" %>
</body>
</html>
