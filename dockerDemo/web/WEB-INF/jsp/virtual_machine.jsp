<%--
  Created by IntelliJ IDEA.
  User: zhanghao
  Date: 2018/9/17
  Time: 上午10:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/ionicons.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/css/_all-skins.min.css">
    <link rel="stylesheet" href="/static/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/static/ui/layui/css/layui.css">
    <title>RainBowML 用户界面</title>
    <link rel="shortcut icon" href="/static/img/RainbowML-small.png">

    <!-- jQuery 2.2.3 -->
    <script src="/static/js/jquery-2.2.3.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="/static/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/static/js/app.min.js"></script>
    <script src="/static/js/jquery.knob.js"></script>
    <script src="/static/js/jquery.form.js"></script>
    <script src="/static/js/jquery.dataTables1.min.js"></script>
    <script src="/static/js/dataTables.bootstrap.min.js"></script>
    <script src="/static/ui/layui/layer.js"></script>
    <script src="/static/ui/layui/layui.js"></script>
    <script src="/static/js/echarts.min.js"></script>
</head>
<body class="hold-transition skin-purple-light sidebar-mini">

<div class="wrapper">
    <jsp:include page="header.jsp" flush="true" />

    <div class="content">
        <div class="row" style="margin:0px">
            <div class="col-xs-12 col-md-12 col-sm-12" style="height:600px;margin:0;padding:0">
                <iframe src="http://10.10.108.63/infrastructure/" frameborder=”no” style="width:100%;height:100%;">	</iframe>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" flush="true"></jsp:include>
</div>
</body>
</html>
