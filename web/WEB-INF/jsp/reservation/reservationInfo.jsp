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
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Checkout example · Bootstrap v5.0</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">


    <!-- Custom styles for this template -->
    <link href="css/form-validation.css" rel="stylesheet">
</head>
<%@include file="../common/header.jsp" %>
<body class="bg-light">

<div class="container">
    <main>
        <div class="py-5 text-center">
            <h2 style="font-family: 'Noto Serif KR', serif;">예약 정보</h2>
            <p class="lead" style="font-family: 'Noto Serif KR', serif;">예약하실 고객님의 정보를 입력해주세요.</p>
        </div>


            <div>
                <form class="needs-validation was-validated" novalidate="">
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <label for="firstName" class="form-label" style="font-family: 'Noto Serif KR', serif;">방문 날짜</label>
                            <input type="text" class="form-control"style="font-family: 'Noto Serif KR', serif;"  id="firstName" placeholder="" value=<%=date%> required="" readonly>
                            <div class="invalid-feedback">
                                방문하실 날짜를 입력하세요.
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <label for="lastName" class="form-label" style="font-family: 'Noto Serif KR', serif;">방문 시간</label>
                            <input type="text" class="form-control" style="font-family: 'Noto Serif KR', serif;" id="lastName" placeholder="" value=<%=time%> required="" readonly>
                            <div class="invalid-feedback" style="font-family: 'Noto Serif KR', serif;">
                                방문하실 시간을 입력하세요.
                            </div>
                        </div>

                        <div class="col-sm-6" id = "userID"></div>
                        <div class="col-sm-6" id="userName"></div>

                        <div class="col-12">
                            <label for="covers" class="form-label" style="font-family: 'Noto Serif KR', serif;">인원수</label>
                            <input type="text" class="form-control" style="font-family: 'Noto Serif KR', serif;" id="covers" placeholder="인원수를 입력하세요" required="" >
                            <div class="invalid-feedback" style="font-family: 'Noto Serif KR', serif;">
                                함께 오시는 인원 수를 입력하세요.
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="message" class="form-label" style="font-family: 'Noto Serif KR', serif;">Message</label>
                            <input type="text" class="form-control" style="font-family: 'Noto Serif KR', serif;" id="message" placeholder="추가 요구사항을 입력하세요" required="" >
                            <div class="invalid-feedback" style="font-family: 'Noto Serif KR', serif;">
                                예약 시 추가로 필요한 사항을 입력해주세요.
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="save-info">
                        <label class="form-check-label" for="save-info" style="font-family: 'Noto Serif KR', serif;">이 정보를 다음에도 사용하시겠습니까?</label>
                    </div>

                    <hr class="my-4">

                    <button class="w-100 btn btn-dark btn-lg" style="font-family: 'Noto Serif KR', serif;" onclick="completeReservationRequest()">예약하기</button>
                </form>
            </div>

    </main>

</div>
<%@include file="../common/footer.jsp" %>


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
    function completeReservationRequest(){  //예약요청 데이터를 ajax로 전달하는 함수
        var user=<%=user%>;
        var date = <%=date%>
        var time = <%=time%>
        var covers = $('#covers').val();
        var message = $('#message').val();
        var data = covers+"-/-/-"+date+"-/-/-"+time+"-/-/-"+user.name+"-/-/-"+user.id+"-/-/-"+message;

        var check =
            swal({
                title : '예약을 하시겠습니까?',
                icon : 'info',

                buttons : {
                    cancle : {
                        text : '취소',
                        value: false,
                        className : 'btn btn-danger'
                    },
                    confirm: {
                        text: '확인',
                        value: true,
                        className : 'btn btn-primary'
                    },
                }
            }).then((check)  => {
                if(check) {
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "reservationRequest",
                            ata: data
                        },
                        success: function (oid) {
                            swal({
                                title: '예약 성공!',
                                text: "[예약번호:" + oid + "]의 예약 요청이 정상적으로 요청되었습니다.",
                                icon: 'success',
                                button: '확인'
                            }).then(function ()
                            {
                                location.href = 'main.do';
                            });
                        }
                    })
                }

            });
    }
</script>

</body></html>
