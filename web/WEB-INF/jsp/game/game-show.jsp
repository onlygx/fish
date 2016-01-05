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
    <link rel="stylesheet" href="/static/css/font-awesome.css">
    <link rel="stylesheet" href="/static/css/jquery.bdt.css">

    <script src="/static/js/jquery-1.11.3.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/jquery.sortelements.js"></script>
    <script src="/static/js/jquery.bdt.js"></script>

</head>
<body  style="background-color: ivory">

<jsp:include page="../navbar.jsp"></jsp:include>

<div id="container" style="width: 100%;" align="center">

    <div>

        <fieldset>
            <legend>${obj.name}</legend>
        </fieldset>
        <p>${obj.intro}</p>
        <div>
            <img class="img-rounded" src="http://qr.liantu.com/api.php?text=${obj.id}" style="width: 200px;height: 200px;"/>
        </div>
        <div style="width: 80%;margin-top: 20px;" align="left">
            <div>
                <h3>
                    裁判长：
                    <c:forEach var="item" items="${personList1}" varStatus="status" >

                        <span class="label label-success">${item.name} </span>
                        &nbsp;&nbsp;

                    </c:forEach>
                </h3>
            </div>
            <div>
                <h3>
                    裁判：
                    <c:forEach var="item" items="${personList2}" varStatus="status" >

                        <span class="label label-success">${item.name} </span>
                        &nbsp;&nbsp;

                    </c:forEach>
                </h3>
            </div>

        </div>

        <div style="width: 80%;margin-top: 20px;">
            <table class="table table-bordered table-striped" id="table">
                <caption>参赛人员列表(包含裁判)：</caption>
                <thead>
                <tr>

                    <th>#</th>
                    <th>参赛编号</th>
                    <th>姓名</th>
                    <th>钓位</th>
                    <th>尾数</th>
                    <th>重量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${personList1}" varStatus="status" >

                    <tr>
                        <td  scope="row">
                            <input type="checkbox" id="c_${item.id}" value="${item.id}" name="person" >
                        </td>
                        <td class="rate-time ">${item.id} </td>
                        <td  scope="row" id="n_${item.id}">${item.name} </td>
                        <td class="rate-time ">${item.roomName} </td>
                        <td class="rate-time ">${item.number} </td>
                        <td class="rate-value"><c:out value="${item.weight}" /></td>
                        <td>


                        </td>
                    </tr>

                </c:forEach>
                <c:forEach var="item" items="${personList2}" varStatus="status" >

                    <tr>
                        <td  scope="row">
                            <input type="checkbox" id="c_${item.id}" value="${item.id}" name="person" >
                        </td>
                        <td class="rate-time ">${item.id} </td>
                        <td  scope="row" id="n_${item.id}">${item.name} </td>
                        <td class="rate-time ">${item.roomName} </td>
                        <td class="rate-time ">${item.number} </td>
                        <td class="rate-value"><c:out value="${item.weight}" /></td>
                        <td>


                        </td>
                    </tr>

                </c:forEach>
                <c:forEach var="item" items="${personList3}" varStatus="status" >

                    <tr>
                        <td  scope="row">
                            <input type="checkbox" id="c_${item.id}" value="${item.id}" name="person" >
                        </td>
                        <td class="rate-time ">${item.id} </td>
                        <td  scope="row" id="n_${item.id}">${item.name} </td>
                        <td class="rate-time ">${item.roomName} </td>
                        <td class="rate-time ">${item.number} </td>
                        <td class="rate-value"><c:out value="${item.weight}" /></td>
                        <td>

                            <a href="/person/${item.id}">查看二维码</a>

                        </td>
                    </tr>

                </c:forEach>


                </tbody>
            </table>
            <div align="left" style="margin-bottom: 50px;">

                <button class="btn btn-success" onclick="choujiang()">抽奖</button>
                &nbsp;幸运用户：<label id="cjr">结果...</label>
            </div>

        </div>

    </div>


</div>
</body>
</html>
<script>

    function choujiang(){
        var pers = new Array();

        $('input[name="person"]:checked').each(function(){
            pers.push($(this).val());
        });
        var random = parseInt(Math.random()*pers.length);
        var id = pers[random];
        var name = $("#n_"+id).text();

        $("#cjr").text(name);
    }






    $(document).ready(function(){
        $("#table").bdt({
            bPaginate:false,
            bScrollInfinite:true,
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "对不起，查询不到任何相关数据",
                "sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
                "sInfoEmtpy": "找不到相关数据",
                "sInfoFiltered": "数据表中共为 _MAX_ 条记录)",
                "sProcessing": "正在加载中...",
                "sSearch": "搜索",
                "sUrl": "", //多语言配置文件，可将oLanguage的设置放在一个txt文件中，例：Javascript/datatable/dtCH.txt
                "oPaginate": {
                    "sFirst":    "第一页",
                    "sPrevious": " 上一页 ",
                    "sNext":     " 下一页 ",
                    "sLast":     " 最后一页 "
                }
            },
            "aLengthMenu": [[10, 25, 50, -1, 0], ["每页10条", "每页25条", "每页50条", "显示所有数据", "不显示数据"]]

        });
    });


</script>