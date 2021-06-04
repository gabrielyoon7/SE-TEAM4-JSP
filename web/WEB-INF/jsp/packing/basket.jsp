<%--
  Created by IntelliJ IDEA.
  User: dnwnd
  Date: 2021-05-13
  Time: 오후 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String selectedMenuList = (String) request.getAttribute("selectedMenuList");
    String user1 =  (String)session.getAttribute("newUser");
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">

    <title>Little4 Restaurant PACKING</title>
    <meta name="theme-color" content="#7952b3">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
<body class="bg-light vsc-initialized">
<%--header를 이런식으로 include해서 끼워넣습니다. 이 작업은 매 페이지마다 필요해요.--%>
<%@include file="../common/header.jsp" %>


<div class="container">
    <main>
        <div class="py-5 text-center">
            <h2 style="font-family: 'Noto Serif KR', serif;">주문/결제하기</h2>
        </div>
        <br>

        <div class="row g-5">
            <div class="col-md-5 col-lg-4 order-md-last">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-dark border-dark" style="font-family: 'Noto Serif KR', serif;">장바구니</span>
                    <span class="badge bg-dark rounded-pill" id="Count"></span>
                </h4>
                <ul class="list-group mb-3">
                    <li id="selectedMenuList" style="font-family: 'Noto Serif KR', serif;"></li>

                    <%--                    <li class="list-group-item d-flex justify-content-between bg-light">--%>
                    <%--                        <div class="text-success">--%>
                    <%--                            <h6 class="my-0">Promo code</h6>--%>
                    <%--                            <small>EXAMPLECODE</small>--%>
                    <%--                        </div>--%>
                    <%--                        <span class="text-success">−$5</span>--%>
                    <%--                    </li>--%>
                    <li class="list-group-item d-flex justify-content-between">
                        <span style="font-family: 'Noto Serif KR', serif;">합계 (KRW)</span>
                        <strong id="Sum"></strong>
                    </li>
                </ul>

            </div>
            <div class="col-md-7 col-lg-8">
                <form class="needs-validation" novalidate="">

                    <h4 class="mb-3" style="font-family: 'Noto Serif KR', serif;">결제 방식</h4>

                    <div class="my-3" id="payment">
<%--                        <div class="pay-form">--%>
<%--                            <input id="offlinePayment" name="paymentMethod" type="radio" class="pay-form-input" checked="" required="" value="offlinePayment">--%>
<%--                            <label class="form-check-label" style="font-family: 'Noto Serif KR', serif;" for="offlinePayment">현장 결제</label>--%>
<%--                        </div>--%>
<%--                        <div class="pay-form">--%>
<%--                            <input id="onlinePayment" name="paymentMethod" type="radio" class="pay-form-input" required="" value="onlinePayment">--%>
<%--                            <label class="form-check-label" style="font-family: 'Noto Serif KR', serif;" for="onlinePayment">온라인 결제</label>--%>
<%--                        </div>--%>
                    </div>
                    <br>

                    <div class="row gy-3">
                        <div class="col-md-11">
                            <label for="request" class="form-label" style="font-family: 'Noto Serif KR', serif;">*요청 사항*</label>
                            <input type="text" class="form-control" style="font-family: 'Noto Serif KR', serif;" id="request" value="맵기, 일회용품 여부 등을 입력하세요." placeholder="" required="">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <hr class="my-12">
        <br>
        <div class="pay_button text-center">
            <button class="w-25 btn-dark btn-lg" style="font-family: 'Noto Serif KR', serif;" onclick="orderCheck()" type="submit">결제하기</button>
        </div>
    </main>
    <div class="modal fade" id="staticBackdrop5" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel5" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel5">충전하기</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body row" id = "Charge"></div>
                <%--                        <div class="modal-footer">--%>
                <%--                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>--%>
                <%--                            <button type="button" class="btn btn-primary">추가하기</button>--%>
                <%--                        </div>--%>
            </div>
        </div>
    </div>
    <br>
    <%@include file="../common/footer.jsp" %>
</div>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
<script>
    $(document).ready(function(){
        makeCount();
        makeCartInfo();
        makeSum();
        makePayment();
    })

    var selectedMenuList = <%=selectedMenuList%>;
    var totalPrice=0;

    function makeCount() {
        var count = $('#Count');
        var text = selectedMenuList.length;
        count.append(text);
    }
    function makeCartInfo(){
        var list = $('#selectedMenuList');
        var text = '';

        for(var i=0; i<selectedMenuList.length; i++){
            text+= '<li class="list-group-item d-flex justify-content-between lh-sm"><div>'
                +'<h6 class="my-0">'+selectedMenuList[i].name+'</h6>'
                +'<small class="text-muted">Brief description</small></div>'
                +'<span class="text-muted">'+selectedMenuList[i].price+'</span></li>'
        }
        list.append(text);
    }
    function makeSum(){
        var count = $('#Sum');
        var sum=0;
        for(var i=0; i<selectedMenuList.length; i++){
            var price=selectedMenuList[i].price;
            price*=1;
            sum+=price;
        }
        totalPrice=sum;
        count.append(sum);
    }
    function makePayment(){
        var payment=$('#payment');
        var text='';

        text+='<div class="pay-form">'
            +'<input id="offlinePayment" name="paymentMethod" type="radio" class="pay-form-input" checked="" required="" value="offlinePayment">'
            +'<label class="form-check-label" style="font-family: "Noto Serif KR", serif;" for="offlinePayment">현장 결제</label>'
            +'</div><div class="pay-form">'
            +'<input id="onlinePayment" name="paymentMethod" type="radio" class="pay-form-input" required="" value="onlinePayment">'
            +'<label class="form-check-label" style="font-family: "Noto Serif KR", serif;" for="onlinePayment">온라인 결제</label>'
            +'</div>'
        payment.append(text);
    }
    function orderCheck() {
        var user = <%=user1%> //user는 header에서 정의했으므로 사용 가능.
        var payment = $('input[name=paymentMethod]:checked').val();
        var message = $('#request').val();
        var orderedList = "";
        for (var i = 0; i < selectedMenuList.length; i++) {
            orderedList += selectedMenuList[i].name + ' / ';
        }
        if(payment=="offlinePayment")
            var data = user.id + "~!~!~" + user.name + "~!~!~" + orderedList + "~!~!~" + payment + "~!~!~" + totalPrice + "~!~!~" + message+ "~!~!~" +"-1";
        else
            var data = user.id + "~!~!~" + user.name + "~!~!~" + orderedList + "~!~!~" + payment + "~!~!~" + totalPrice + "~!~!~" + message+ "~!~!~" +user.point;
        // alert(data);
        var check =
            swal({
                title: '주문을 하시겠습니까?',
                icon: 'info',

                buttons: {
                    cancel: {
                        text: '취소',
                        value: false,
                        className: 'btn btn-danger'
                    },
                    confirm: {
                        text: '확인',
                        value: true,
                        className: 'btn btn-primary'
                    },
                }
            }).then((check) => {
                if (check) {
                    $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                        url: "ajax.do", //ajax.do(ajaxAction)에 있는
                        type: "post",
                        data: {
                            req: "packingOrder",
                            data: data
                        },
                        success: function (oid) {
                            if(oid=="-1"){
                                swal({
                                    title : "포인트가 부족합니다.",
                                    icon : 'error',
                                    button : '확인'
                                }).then(function (){
                                    var check1=confirm("충전하시겠습니까?");
                                    if(check1){
                                         chargeModal();
                                    }
                                    else
                                        location.href = 'main.do';
                                });
                            }
                            else {
                                swal({
                                    title: '주문 성공!',
                                    text: "[주문번호:" + oid + "]의 방문포장 주문이 정상적으로 요청되었습니다.",
                                        icon: 'success',
                                        button: '확인'
                                }).then(function () {
                                    location.href = 'complete.do?oid=' + oid;
                                });
                            }
                        }
                    })
                }
            });
    }
    function chargeModal(){
        var list = $('#Charge');
        var text='';

        // text+= '<div class="col-12">5,000<button onclick="chargePoint(this.id)" id="5000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">충전하기</button></div><br>';
        // text+= '<div class="col-12">10,000<button onclick="chargePoint(this.id)" id="5000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">충전하기</button></div><br>';
        // text+= '<div class="col-12">20,000<button onclick="chargePoint(this.id)" id="5000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">충전하기</button></div><br>';
        // text+= '<div class="col-12">30,000<button onclick="chargePoint(this.id)" id="5000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">충전하기</button></div><br>';
        // text+= '<div class="col-12">50,000<button onclick="chargePoint(this.id)" id="5000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">충전하기</button></div><br>';
        // text+= '<div class="col-12">100,000<button onclick="chargePoint(this.id)" id="5000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">충전하기</button></div><br>';

        text+= '<button onclick="chargePoint(this.id)" id="5000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">5,000 충전하기</button>';
        text+= '<button onclick="chargePoint(this.id)" id="10000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">10,000 충전하기</button>';
        text+= '<button onclick="chargePoint(this.id)" id="20000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">20,000 충전하기</button>';
        text+= '<button onclick="chargePoint(this.id)" id="30000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">30,000 충전하기</button>';
        text+= '<button onclick="chargePoint(this.id)" id="50000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">50,000 충전하기</button>';
        text+= '<button onclick="chargePoint(this.id)" id="100000" data-bs-dismiss="modal" class="btn btn-dark float-right" type="button">100,000 충전하기</button>';

        list.html(text);//누를때마다 #DataModify의 값을 완전 새로 갈아치움
        $('#staticBackdrop5').modal("show");
    }
    function chargePoint(amount){
        var user=<%=user%>
        var data = user.id + "~!~!~" +user.point+ "~!~!~" + amount;
        var check=confirm("충전하시겠습니까?");
        if(check){
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "chargePoint",
                    data: data
                },
                success: function (oid) {
                    alert("충전이 완료되었습니다.\n충전 후 포인트:"+oid);
                    alert("다시 주문해주세요.");
                    location.href = 'main.do';
                }
            })
        }
    }

</script>
<script src="js/form-validation.js"></script>
</html>
