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

<jsp:include page="../navbar.jsp"></jsp:include>

<div id="container" style="width: 100%;height: 75%;" align="center">

    <fieldset>
        <legend>比赛列表</legend>
    </fieldset>

    <div  style="width: 80%;margin-top: 20px;" >
       <%-- <div align="left" style="margin-bottom: 30px;">

        </div>--%>
        <table class="table " >
            <thead>
            <tr>

                <th>比赛编号</th>
                <th>创建时间</th>
                <th>比赛</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="rate-time"></td>
                <td class="rate-time">添加新赛事</td>
                <td  scope="row">
                    <input type="text" id="gameName" class="form-control">

                </td>
                <td class="rate-value">
                    <textarea id="gameIntro" class="form-control"></textarea>

                </td>
                <td>
                    <a href="javascript:void(0);" class="btn btn-info" onclick="save()"> 创建比赛</a>

                </td>
            </tr>
            <c:forEach var="item" items="${list}" varStatus="status" >

                <tr>
                    <td  scope="row">${item.id}</td>
                    <td class="rate-time"><fmt:formatDate value="${item.setTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td  scope="row">${item.name}</td>
                    <td class="rate-value"><c:out value="${item.intro}" /></td>
                    <td>
                        <a href="/game/${item.id}">查看详情</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="/game/setting/${item.id}">设置</a>
                        &nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" onclick="del('${item.id}')">删除</a>
                    </td>
                </tr>

            </c:forEach>

            </tbody>
        </table>
    </div>

</div>
</body>
</html>
<script>
    function save(){
        var name = $("#gameName").val();
        var intro = $("#gameIntro").val();
        $.post("/game/save",{
            "name":name,
            "intro":intro
        },function(data){
            if(data.success){
                alert("操作成功。");
                window.location.reload();
            }else{
                alert("操作失败。");
            }
        },"json");
    }


    function del(id){
        if(!confirm("确定删除么？")){
            return;
        }

        $.post("/game/delete",{
            "id":id
        },function(data){
            if(data.success){
                alert("操作成功。");
                window.location.reload();
            }else{
                alert("操作失败。");
            }
        },"json");
    }

</script>