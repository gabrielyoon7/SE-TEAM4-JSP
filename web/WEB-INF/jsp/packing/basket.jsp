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
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.83.1">
    <title>Checkout example · Bootstrap v5.0</title>
    <meta name="theme-color" content="#7952b3">
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
            <h2>주문/결제하기</h2>
        </div>
        <br>

        <div class="row g-5">
            <div class="col-md-5 col-lg-4 order-md-last">
                <h4 class="d-flex justify-content-between align-items-center mb-3">
                    <span class="text-primary">장바구니</span>
                    <span class="badge bg-primary rounded-pill" id="Count"></span>
                </h4>
                <ul class="list-group mb-3">
                    <li id="selectedMenuList"></li>

                    <%--                    <li class="list-group-item d-flex justify-content-between bg-light">--%>
                    <%--                        <div class="text-success">--%>
                    <%--                            <h6 class="my-0">Promo code</h6>--%>
                    <%--                            <small>EXAMPLECODE</small>--%>
                    <%--                        </div>--%>
                    <%--                        <span class="text-success">−$5</span>--%>
                    <%--                    </li>--%>
                    <li class="list-group-item d-flex justify-content-between">
                        <span>합계 (KRW)</span>
                        <strong id="Sum"></strong>
                    </li>
                </ul>

            </div>
            <div class="col-md-7 col-lg-8">
                <form class="needs-validation" novalidate="">

                    <h4 class="mb-3">결제 방식</h4>

                    <div class="my-3">
                        <div class="pay-form">
                            <input id="offlinePayment" name="paymentMethod" type="radio" class="pay-form-input" checked="" required="" value="offlinePayment">
                            <label class="form-check-label" for="offlinePayment">현장 결제</label>
                        </div>
                        <div class="pay-form">
                            <input id="onlinePayment" name="paymentMethod" type="radio" class="pay-form-input" required="" value="onlinePayment">
                            <label class="form-check-label" for="onlinePayment">온라인 결제</label>
                        </div>
                    </div>
                    <br>

                    <div class="row gy-3">
                        <div class="col-md-11">
                            <label for="request" class="form-label">*요청 사항*</label>
                            <input type="text" class="form-control" id="request" value="맵기, 일회용품 여부 등을 입력하세요." placeholder="" required="">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <hr class="my-12">
        <br>
        <div class="pay_button text-center">
            <button class="w-25 btn-primary btn-lg" onclick="orderCheck()" type="submit">결제하기</button>
        </div>
    </main>
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
    function orderCheck(){
        var user = <%=user%> //user는 header에서 정의했으므로 사용 가능.
        var payment=$('input[name=paymentMethod]:checked').val();
        var message=$('#request').val();
        var orderedList="";
        for(var i=0;i<selectedMenuList.length;i++) {
            orderedList+=selectedMenuList[i].name+' / ';
        }
        var data = user.id+"~!~!~"+user.name+"~!~!~"+orderedList+"~!~!~"+payment+"~!~!~"+totalPrice+"~!~!~"+message;
        // alert(data);
        var check = confirm("주문을 하시겠습니까?");
        if(check) {
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "packingOrder",
                    data: data
                },
                success: function (oid) {
                    alert("[주문번호:"+oid+"]의 방문포장 주문이 정상적으로 요청되었습니다.");
                    location.href = 'complete.do?oid='+oid;
                }
            })
        }
    }
</script>
<script src="js/form-validation.js"></script>
</html>
