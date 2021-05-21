<%--
  Created by IntelliJ IDEA.
  User: 최예슬
  Date: 2021-05-15
  Time: 오전 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String date = (String) request.getAttribute("date");
    String time = (String) request.getAttribute("time");
%>
<html lang="en"><head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Checkout example · Bootstrap v5.0</title>

<%--    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">--%>



    <!-- Bootstrap core CSS -->
<%--    <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">--%>

    <!-- Favicons -->
<%--    <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">--%>
<%--    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">--%>
<%--    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">--%>
<%--    <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">--%>
<%--    <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">--%>
<%--    <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">--%>
<%--    <meta name="theme-color" content="#7952b3">--%>


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
    </style>


    <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">
</head>
<%@include file="../common/header.jsp" %>
<body class="bg-light">

<div class="container">
    <main>
        <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="icons/bootstrap-fill.svg" alt="" width="72" height="57">
            <h2>Checkout form</h2>
            <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
        </div>


            <div>
                <h4 class="mb-3">예약 정보 입력</h4>
                <form class="needs-validation was-validated" novalidate="">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="firstName" class="form-label">방문 날짜</label>
                            <input type="text" class="form-control" id="firstName" placeholder="" value=<%=date%> required="" readonly>
                            <div class="invalid-feedback">
                                방문하실 날짜를 입력하세요.
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label for="lastName" class="form-label">방문 시간</label>
                            <input type="text" class="form-control" id="lastName" placeholder="" value=<%=time%> required="" readonly>
                            <div class="invalid-feedback">
                                방문하실 시간을 입력하세요.
                            </div>
                        </div>

                        <div class="col-sm-6" id = "userID"></div>
                        <div class="col-sm-6" id="userName"></div>

                        <div class="col-12">
                            <label for="email" class="form-label">인원수</label>
                            <input type="email" class="form-control" id="email" placeholder="인원수를 입력하세요">
                            <div class="invalid-feedback">
                                함께 오시는 인원 수를 입력하세요.
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="address" class="form-label">Message</label>
                            <input type="text" class="form-control" id="address" placeholder="추가 요구사항을 입력하세요" required="">
                            <div class="invalid-feedback">
                                예약 시 추가로 필요한 사항을 입력해주세요.
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="same-address">
                        <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
                    </div>

                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="save-info">
                        <label class="form-check-label" for="save-info">Save this information for next time</label>
                    </div>

                    <hr class="my-4">






                    <hr class="my-4">

                    <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
                </form>
            </div>

    </main>

    <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">© 2017–2021 Company Name</p>
        <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
    </footer>
</div>


<script src="js/bootstrap.bundle.min.js"></script>

<script src="js/form-validation.js"></script>
<script>

    $(document).ready(function(){
        makeID();
        makeName();
    })
    function makeID(){
        var user=<%=user%>;
        var list = $('#userID');
        var text='';
        text += '<label for="userid" class="form-label">고객 아이디</label>'
            +'<div class="input-group has-validation"><span class="input-group-text">@</span>'
            +'<input type="text" class="form-control" id="userid" placeholder="Customer ID" value="'+user.id+'" required="" readonly>'
            +'<div class="invalid-feedback">고객 아이디를 입력하세요</div></div>';
        list.append(text);
    }
    function makeName(){
        var user=<%=user%>;
        var list = $('#userName');
        var text='';
        text+='<label for="username" class="form-label">방문자 성함</label>'
            +'<input type="text" class="form-control" id="username" placeholder="" value="'+user.name+'" required="" readonly>'
            +'<div class="invalid-feedback">방문하실 시간을 입력하세요.</div>';
        list.append(text);
    }
</script>

</body></html>
