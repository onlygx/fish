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
    <title>比赛设置</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
<%--    <link rel="stylesheet" href="/static/css/bootstrap-datetimepicker.css">--%>

    <script src="/static/js/jquery-1.11.3.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
<%--    <script src="/static/js/highcharts4.2.1.js"></script>
    <script src="/static/js/bootstrap-datetimepicker.js"></script>
    <script src="/static/js/bootstrap-datetimepicker.zh-CN.js"></script>--%>

</head>
<body  style="background-color: #E6E6E6">

<jsp:include page="../navbar.jsp"></jsp:include>

<div id="container" style="width: 100%;" align="center">

    <div>

        <fieldset>
            <legend>${obj.name}</legend>
        </fieldset>
        <p>${obj.intro}</p>

        <div style="width: 80%;margin-top: 20px;" align="left">
            <fieldset>
                <legend>钓位设置</legend>
            </fieldset>

            <ul class="list-group">
                <c:forEach var="item1" items="${rooms}" varStatus="status1" >
                    <li class="list-group-item" style="color: green;">${item1.name}</li>
                    <li class="list-group-item">

                        <ul class="list-group">
                            <c:forEach var="item2" items="${item1.child}" varStatus="status2" >
                                <li class="list-group-item" style="color: brown;">${item2.name}</li>
                                <li class="list-group-item">

                                    <ul class="list-group">
                                        <c:forEach var="item3" items="${item2.child}" varStatus="status3" >
                                            <li class="list-group-item" style="color: chocolate;">${item3.name}</li>
                                        </c:forEach>

                                        <li class="list-group-item">
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="r_${item2.id}" placeholder="钓位..." style="width: 200px;">
                                                <button class="btn btn-success" onclick="saveRoom(r_${item2.id}.value,'${item2.id}',null);">添加</button>
                                            </div>

                                        </li>
                                    </ul>
                                </li>
                            </c:forEach>

                            <li class="list-group-item">
                                <div class="form-inline">
                                    <input type="text" class="form-control" id="r_${item1.id}" placeholder="钓区..." style="width: 200px;">
                                    <button class="btn btn-success" onclick="saveRoom(r_${item1.id}.value,'${item1.id}',null);">添加</button>
                                </div>

                            </li>
                        </ul>
                    </li>

                </c:forEach>
                <li class="list-group-item">
                    <div class="form-inline">
                        <input type="text" class="form-control" id="r_0" placeholder="湖泊..." style="width: 200px;">
                        <button class="btn btn-success" onclick="saveRoom(r_0.value,'0','${obj.id}');">添加</button>
                    </div>

                </li>
            </ul>


        </div>

        <%--<div style="width: 80%;margin-top: 20px;" align="left">
            <div>
                <fieldset>
                    <legend>

                        <div class="form-inline">
                            <span> 裁判长：</span>
                            <c:forEach var="item" items="${personList1}" varStatus="status" >
                                <span class="label label-primary">${item.name} </span>
                                &nbsp;&nbsp;
                            </c:forEach>
                            <input type="text" class="form-control" id="person1" placeholder="裁判长..." style="width: 200px;">
                            <button class="btn btn-success" onclick="savePerson(person1.value,1,'${obj.id}');">添加</button>
                        </div>
                    </legend>

                </fieldset>
            </div>
            <div>
                <fieldset>
                    <legend>
                        <div class="form-inline">
                            <span> 裁判：</span>
                            <c:forEach var="item" items="${personList2}" varStatus="status" >
                                <span class="label label-info">${item.name} </span>
                                &nbsp;&nbsp;

                            </c:forEach>
                            <input type="text" class="form-control" id="person2" placeholder="裁判..." style="width: 200px;">
                            <button class="btn btn-success" onclick="savePerson(person2.value,2,'${obj.id}');">添加</button>
                        </div>
                    </legend>

                </fieldset>
            </div>

        </div>--%>

        <div style="width: 80%;margin-top: 20px;">


                <table class="table ">
                    <caption>裁判长：</caption>
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>操作</th>

                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td  scope="row">
                            <input type="text" class="form-control" id="person1" placeholder="裁判..." style="width: 200px;">
                        </td>
                        <td>
                            <button class="btn btn-info" onclick="savePerson(person1.value,1,'${obj.id}')"> 添加参赛者</button>
                        </td>
                    </tr>

                    <c:forEach var="item" items="${personList1}" varStatus="status" >

                        <tr>
                            <td  scope="row">${item.name} </td>
                            <td>
                                <a href="javascript:void(0);" onclick="delPerson('${item.id}')">删除</a>

                            </td>
                        </tr>

                    </c:forEach>


                    </tbody>
                </table>

            <table class="table ">
                <caption>裁判：</caption>
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>操作</th>

                </tr>
                </thead>
                <tbody>

                <tr>
                    <td  scope="row">
                        <input type="text" class="form-control" id="person2" placeholder="裁判..." style="width: 200px;">
                    </td>
                    <td>
                        <button class="btn btn-info" onclick="savePerson(person2.value,2,'${obj.id}')"> 添加参赛者</button>
                    </td>
                </tr>

                <c:forEach var="item" items="${personList2}" varStatus="status" >

                    <tr>
                        <td  scope="row">${item.name} </td>
                        <td>
                            <a href="javascript:void(0);" onclick="delPerson('${item.id}')">删除</a>

                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>

            <table class="table ">
                <caption>参赛人员列表：</caption>
                <thead>
                <tr>
                    <th>姓名</th>
                    <th>钓位</th>
                    <th>尾数</th>
                    <th>重量</th>
                    <th>操作</th>

                </tr>
                </thead>
                <tbody>

                <tr>
                    <td  scope="row">
                        <input type="text" class="form-control" id="person3" placeholder="裁判..." style="width: 200px;">
                    </td>
                    <td  scope="row"> </td>
                    <td class="rate-time "> </td>
                    <td class="rate-value"> </td>
                    <td>
                        <button class="btn btn-info" onclick="savePerson(person3.value,3,'${obj.id}')"> 添加参赛者</button>
                    </td>
                </tr>

                <c:forEach var="item" items="${personList3}" varStatus="status" >

                    <tr>
                        <td  scope="row">${item.name} </td>
                        <td  scope="row">${item.roomName} </td>
                        <td class="rate-time ">${item.number} </td>
                        <td class="rate-value"><c:out value="${item.weight}" /></td>
                        <td>
                            <a href="javascript:void(0);" onclick="delPerson('${item.id}')">删除</a>
                            &nbsp;
                            <a href="/person/${item.id}">打印名片</a>

                        </td>
                    </tr>

                </c:forEach>


                </tbody>
            </table>
        </div>
    </div>


</div>
</body>
</html>
<script>
    function saveRoom(name,parentId,gameId){
        if(name.trim()==""){
            alert("请输入名称");
            return ;
        }
        $.post("/room/save",{
            "name":name,
            "parentId":parentId,
            "gameId":gameId
        },function(data){
            if(data.success){
                alert("操作成功。");
                window.location.reload();
            }else{
                alert("操作失败。");
            }
        },"json");
    }

    function savePerson(name,type,gameId){
        if(name.trim()==""){
            alert("请输入名称");
            return ;
        }

        $.post("/person/save",{
            "name":name,
            "type":type,
            "gameId":gameId
        },function(data){
            if(data.success){
                alert("操作成功。");
                window.location.reload();
            }else{
                alert("操作失败。");
            }
        },"json");
    }

    function delPerson(id){
        if(!confirm("确定删除么？")){
            return;
        }

        $.post("/person/delete",{
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