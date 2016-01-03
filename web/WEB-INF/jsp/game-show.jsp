<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/1/3 0003
  Time: 下午 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
    <title>比赛列表</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/bootstrap-datetimepicker.css">

    <script src="/static/js/jquery-1.11.3.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/highcharts4.2.1.js"></script>
    <script src="/static/js/bootstrap-datetimepicker.js"></script>
    <script src="/static/js/bootstrap-datetimepicker.zh-CN.js"></script>

</head>
<body  style="background-color: #E6E6E6">

<jsp:include page="navbar.jsp"></jsp:include>

<div id="container" style="width: 80%;height: 75%;" align="center">

    <div>

        <fieldset>
            <legend>${obj.name}</legend>
        </fieldset>
        <p>${obj.intro}</p>


        <div style="width: 80%;margin-top: 20px;" align="left">
            <div>
                <fieldset>
                    <legend>裁判长：</legend>
                </fieldset>
                <p>
                    <c:forEach var="item" items="${personList1}" varStatus="status" >

                        ${item.name} &nbsp;&nbsp;

                    </c:forEach>
                </p>
            </div>
            <div>
                <fieldset>
                    <legend>裁判：</legend>
                </fieldset>
                <p>
                    <c:forEach var="item" items="${personList2}" varStatus="status" >

                        ${item.name} &nbsp;&nbsp;

                    </c:forEach>

                </p>
            </div>

        </div>

        <div style="width: 80%;margin-top: 20px;">
            <table class="table ">
                <caption>参赛人员列表：</caption>
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>尾数</th>
                    <th>重量</th>

                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${personList3}" varStatus="status" >

                    <tr>
                        <th  scope="row">${item.name} </th>
                        <td class="rate-time ">${item.number} </td>
                        <td class="rate-value"><c:out value="${item.weight}" /></td>
                    </tr>

                </c:forEach>


                </tbody>
            </table>
        </div>
    </div>


</div>
</body>
</html>
