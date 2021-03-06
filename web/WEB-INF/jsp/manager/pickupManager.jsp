<%--
  Created by IntelliJ IDEA.
  User: dnwnd
  Date: 2021-05-15
  Time: 오후 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String orderInfo = (String) request.getAttribute("orderInfo");
%>
<html>
<head>
  <title>Little4 Restaurant MANAGER</title>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <link href='css/bootstrap-table.css' rel='stylesheet' type='text/css'>
  <link href='css/boardtable.css' rel='stylesheet' type='text/css'
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Caveat&display=swap" rel="stylesheet">

  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&family=Oswald:wght@300&display=swap" rel="stylesheet">
<%--  <script src="/js/jquery-3.2.1.min.js"></script>--%>
<%--  <script src="/js/bootstrap.min.js"></script>--%>
<%--  <script src="/js/bootstrap-table.js"></script>--%>
<%--  <script src="/js/bootstrap-table-cookie.js"></script>--%>
<%--  <script src="/js/bootstrap-table-export.min.js"></script>--%>
</head>
<body>
<%@include file="../common/header.jsp" %>
<br>
<br>
<h1 class="text-center" style="font-family: 'Noto Serif KR', serif;">ORDER LIST</h1>
  <div id="container" class="py-3 row text-center" style="font-family: 'Noto Serif KR', serif;">
    <table  class="boardtable" style="font-family: 'Noto Serif KR', serif;" id="table" data-toggle="table" data-pagination="true" data-toolbar="#toolbar">
      <thead>
      <tr>
        <th data-field="action">설정</th>
        <th data-field="statement" data-sortable="true">처리상태</th>
        <th data-field="date" data-sortable="true">날짜</th>
        <th data-field="name" data-sortable="true">이름</th>
        <th data-field="id" data-sortable="true">아이디</th>
        <th data-field="menu" data-sortable="true">메뉴</th>
        <th data-field="price" data-sortable="true">가격</th>
        <th data-field="message" data-sortable="true">요청사항</th>
        <th data-field="payment" data-sortable="true">결제수단</th>
      </tr>
      </thead>
    </table>
  </div>
<%--</div>--%>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
<script>
  $(document).ready(function(){
    // MakeTableData();
    callSetupTableView();
  })

  var orderInfo=<%=orderInfo%>;

  function callSetupTableView(){
    $('#table').bootstrapTable('load',data());
    // $('#table').bootstrapTable('append',data());
    $('#table').bootstrapTable('refresh');
  }

  function data(){
    var rows = [];
    for(var i=0;i<orderInfo.length;i++){
      var order=orderInfo[i];
      rows.push({
        name: order.name,
        id: order.id,
        menu: order.orderedList,
        price: order.totalPrice,
        message: order.message,
        payment: order.payment,
        statement:order.statement,
        date:order.date,
        action : '<button class="btn-dark" onclick="completeOrder('+i+')">주문완료</button>'
      });
    }
    return rows;
  }


  // function MakeTableData() {
  //   var list = $('#table');
  //   var text = '';
  //
  //   for(var i=0;i<orderInfo.length;i++){
  //     text += '<tr>'
  //             + '<th><button onclick="completeOrder('+i+')">주문완료</button></th>'
  //             + '<th>' + orderInfo[i].name + '</th>'
  //             + '<th>' + orderInfo[i].id + '</th>'
  //             + '<th>' + orderInfo[i].orderedList + '</th>'
  //             + '<th>' + orderInfo[i].totalPrice + '</th>'
  //             + '<th>' + orderInfo[i].message + '</th>'
  //             + '<th>' + orderInfo[i].payment + '</th>'
  //             + '</tr>';
  //   }
  //   list.append(text);
  // }


  function completeOrder(i){ //대상자에서 삭제
    var order =orderInfo[i];
    var check =
            swal({
              title : '주문완료 처리',
              text : order.name+"["+order.id+"]의 주문을 완료하시겠습니까?",
              icon : 'info',
              button : '확인'
            }).then(function (){
              if(check){
                $.ajax({
                  url : "ajax.do", //AjaxAction
                  type : "post",
                  data : {
                    req : "completeOrder",
                    data : orderInfo[i].oid
                  },
                  success :function(data){
                    swal({
                      title : '완료되었습니다.',
                      icon : 'success',
                      button: '확인'
                    }).then(function ()
                    {
                      location.reload();
                    });
                  }
                })
              }
            });
  }
</script>

</html>