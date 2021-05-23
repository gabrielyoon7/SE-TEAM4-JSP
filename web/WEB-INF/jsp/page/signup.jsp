<%--
  Created by IntelliJ IDEA.
  User: Gabriel Yoon
  Date: 2021-05-10
  Time: 오후 5:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">
    <!-- Bootstrap core CSS -->
<%--    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">--%>

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
<body class="bg-light">
<%@include file="../common/header.jsp" %>
<div class="container">
    <main>
        <div class="py-5 text-center">
            <h2>회원 가입</h2>
            <p class="lead"> 아래의 정보들을 모두 입력하시오. </p>
        </div>
            <div>
                <h4 class="mb-3">기본 정보</h4>
                <form class="needs-validation" novalidate>
                    <div class="row g-3">
                        <div class="col-12">
                            <label for="name" class="form-label">이 름</label>
                            <input type="text" class="form-control" id="name" placeholder="" value="" required>
                            <div class="invalid-feedback">
                                Valid first name is required.
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label for="bday">생년월일</label>
                            <input type="date" class="form-control" id="bday" name = "new_date" value ='' placeholder="Date of Birth" required>
                        </div>

                        <div class="col-12">
                            <label for="id" class="form-label">아이디</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text">@</span>
                                <input type="text" class="form-control" id="id" placeholder="Username" required>
                                <div class="invalid-feedback">
                                    Your username is required.
                                </div>
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="password" class="form-label">비밀번호</label>
                            <input type="text" class="form-control" id="password" placeholder="1234 Main St" required>
                            <div class="invalid-feedback">
                                Please enter your shipping address.
                            </div>
                        </div>

                        <div class="col-12">
                            <label for="phoneNumber" class="form-label">전화번호</label>
                            <input type="text" class="form-control" id="phoneNumber" placeholder="Apartment or suite">
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

                    <h4 class="mb-3">결제정보(미구현)</h4>

                    <div class="my-3">
                        <div class="form-check">
                            <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
                            <label class="form-check-label" for="credit">체크 카드</label>
                        </div>
                        <div class="form-check">
                            <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
                            <label class="form-check-label" for="debit">신용 카드</label>
                        </div>
                        <div class="form-check">
                            <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
                            <label class="form-check-label" for="paypal">카카오 페이</label>
                        </div>
                    </div>

                    <div class="row gy-3">
                        <div class="col-md-6">
                            <label for="cc-name" class="form-label">Name on card</label>
                            <input type="text" class="form-control" id="cc-name" placeholder="" required>
                            <small class="text-muted">Full name as displayed on card</small>
                            <div class="invalid-feedback">
                                Name on card is required
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="cc-number" class="form-label">Credit card number</label>
                            <input type="text" class="form-control" id="cc-number" placeholder="" required>
                            <div class="invalid-feedback">
                                Credit card number is required
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="cc-expiration" class="form-label">Expiration</label>
                            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
                            <div class="invalid-feedback">
                                Expiration date required
                            </div>
                        </div>

                        <div class="col-md-3">
                            <label for="cc-cvv" class="form-label">CVV</label>
                            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                            <div class="invalid-feedback">
                                Security code required
                            </div>
                        </div>
                    </div>

                    <hr class="my-4">

                    <button class="w-100 btn btn-primary btn-lg" onclick="signUp()">회원가입 하기</button>
                </form>
            </div>
        </div>
    </main>
    <%@include file="../common/footer.jsp" %>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/form-validation.js"></script>
</body>
<script>
    function signUp(){
        var name=$('#name').val();
        var bday =$('#bday').val();
        var id=$('#id').val();
        var password=$('#password').val();
        var phoneNumber=$('#phoneNumber').val();

        var data = name+'-/-/-'+bday+"-/-/-"+id+"-/-/-"+password+"-/-/-"+phoneNumber;
        var check = confirm("회원 가입 하시겠습니까?");
        if(check) {
            $.ajax({ //ajax 프레임워크( jQuery)로 위 data를 서버로 보냄.
                url: "ajax.do", //ajax.do(ajaxAction)에 있는
                type: "post",
                data: {
                    req: "signup",
                    data: data
                },
                success: function (data) {
                    alert("회원가입이 완료됐습니다.");
                    window.location.href = 'loginPage.do';
                }
            })
        }
    }
</script>

</html>
