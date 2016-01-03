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

    <fieldset>
        <legend>比赛列表</legend>
    </fieldset>

    <div id="table" style="width: 80%;margin-top: 20px;">

        <table class="table">
            <thead>
            <tr>
                <th>创建时间</th>
                <th>比赛</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${list}" varStatus="status" >

                <tr>
                    <td class="rate-time"><fmt:formatDate value="${item.setTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td  scope="row">${item.name}</td>
                    <td class="rate-value"><c:out value="${item.intro}" /></td>
                    <td>
                        <a href="/game/${item.id}">查看详情</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="/game/setting/${item.id}">设置</a>

                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </div>

</div>
</body>
</html>
