<%--
  Created by IntelliJ IDEA.
  User: GaoXiang
  Date: 2016/1/4 0004
  Time: 下午 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
    <title>人员展示</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">

    <script src="/static/js/jquery-1.11.3.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
</head>
<body  style="background-color: #E6E6E6">
    <div id="container " align="center" >
        <div class="">
            <h3>姓名：${obj.name}</h3>
        </div>
        <div>
            <img class="img-rounded" src="http://qr.liantu.com/api.php?text=${obj.id}" style="width: 200px;height: 200px;"/>
        </div>
    </div>
</body>
</html>
<script>

    (function($){
        window.print();
    }(jQuery));
</script>