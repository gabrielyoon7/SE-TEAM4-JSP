<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-09
  Time: 오전 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<body>
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>
<main>

<%--   이미지 슬라이더 div 시작지점 --%>
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
<%--        여기서 버튼을 다음에 나올 슬라이드 갯수만큼 만들어줘야 오류가 없습니다. --%>
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>
<%--    슬라이드에 등록할 사진과 설명을 정해줍니다.--%>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                <img src="img/img1.jpg">
                <div class="container">
                    <div class="carousel-caption text-start">
                        <h1>WELCOME TO Little4 Restaurant</h1>
                        <p>Little4 Restaurant에 오신 걸 환영합니다.</p>
                        <p><a class="btn btn-lg btn-primary" href="loginPage.do">로그인 하러 가기</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                <img src="img/img2.jpg">
                <div class="container">
                    <div class="carousel-caption">
                        <h1>Various menus</h1>
                        <p>다양한 메뉴를 지금 바로 확인하세요!</p>
                        <p><a class="btn btn-lg btn-primary" href="menu.do">메뉴 보러 가기</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                <img src="img/img3.jpg">
                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1>Online-Order</h1>
                        <p>기다릴 필요 없이 미리 주문하고, 포장해가세요!</p>
                        <p><a class="btn btn-lg btn-primary" href="#">주문 하러 가기</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                <img src="img/img4.jpg">
                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1>Introduction</h1>
                        <p>Little4 Restaurant의 이야기가 궁금하다면?</p>
                        <p><a class="btn btn-lg btn-primary" href="brand.do">보러 가기</a></p>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <%--   이미지 슬라이더 div 종료지점 --%>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->
    <div class="container marketing">
        <!-- Three columns of text below the carousel -->
        <div class="row">
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

                <h2>메뉴보기</h2>
                <p>TEAM4 Restaurnt의 메뉴를 구경하세요!</p>
                <p><a class="btn btn-secondary" href="menu.do">메뉴 보기 &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

                <h2>테이블 예약하기</h2>
                <p>원하는 날짜와 시간에 예약을 하실 수 있습니다.</p>
                <p><a class="btn btn-secondary" href="reservation.do">예약 하기</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

                <h2>온라인 주문하기</h2>
                <p>방문 포장주문을 도와드립니다.</p>
                <p><a class="btn btn-secondary" href="packing.do">온라인 주문하기 &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->
        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">Little4 Restautrant에 오신 것을 <span class="text-muted">환영</span>합니다. </h2>
                <p class="lead">약 40여 가지의 메뉴가 여러분을 기다리고 있습니다.</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading">더 이상 기다리지 <span class="text-muted">마세요!</span></h2>
                <p class="lead">맞춤형 예약 서비스가 여러분을 기다리고 있습니다.</p>
            </div>
            <div class="col-md-5 order-md-1">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

            </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
            <div class="col-md-7">
                <h2 class="featurette-heading">식당에서 식사 하는 것이 <span class="text-muted">불안하시다고요?</span></h2>
                <p class="lead">모든 메뉴의 방문 포장 서비스가 여러분을 기다리고 있습니다.</p>
            </div>
            <div class="col-md-5">
                <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

            </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

    </div><!-- /.container -->



</main>


<script src="js/bootstrap.bundle.min.js"></script>

<%@include file="../common/footer.jsp" %>
</body>
</html>
