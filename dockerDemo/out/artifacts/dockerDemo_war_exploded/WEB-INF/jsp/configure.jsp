<%--
  Created by IntelliJ IDEA.
  User: zhanghao
  Date: 2018/9/5
  Time: 下午5:18
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
    <link rel="stylesheet" href="/static/ui/DataTables/media/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/static/ui/DataTables/extensions/Select/css/select.dataTables.min.css">
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
    <script src="/static/ui/DataTables/media/js/jquery.dataTables.min.js"></script>
    <script src="/static/ui/DataTables/extensions/Select/js/dataTables.select.min.js"></script>
    <script src="/static/ui/DataTables/media/js/dataTables.bootstrap.min.js"></script>
    <script src="/static/ui/layui/layer.js"></script>
    <script src="/static/ui/layui/layui.js"></script>
    <script src="/static/js/echarts.min.js"></script>
    <style>
        .div-line{
            margin:0 auto;
            height: 8px;
            width: 100%;
            background: radial-gradient(black 12%,#a5b37e,#F3E094,white 80%);
            margin-bottom:-15px
        }
    </style>
</head>
<body class="hold-transition skin-purple-light sidebar-mini">

<div class="wrapper">
    <jsp:include page="header.jsp" flush="true" />

    <div class="content">
        <div class="div-line"></div>
        <div class="col-xs-12 col-md-12 col-sm-12" style="margin-top:20px;padding-top:10px;background-color:#eee;box-shadow: 0px 0px 30px 5px #ddd;">
            <div class="col-md-6 col-sm-6" style="border-right:2px double #ccc;">
                    <table class="table table-bordered table-striped" id="ip_tables" >
                        <thead>
                        <tr>
                            <th colspan="3" style="text-align:center">服务器列表</th>
                        </tr>
                        <!-- <tr>
                            <th colspan="2" style="text-align:center">虚拟机配置 CPU：1核、内存：2GB</th>
                        </tr> -->
                        <tr>
                            <th style="text-align:center">虚拟机IP</th>
                            <th style="text-align:center">虚拟机配置</th>
                            <th style="text-align:center">物理机IP</th>
                        </tr>
                        <tr>
                            <th colspan="3" style="padding-right:5px">
                                <div class="btn-group" style="width:100%">
                                    <button class="btn btn-default " id="all_ip" onclick="checkall(this)" style="width:50%;background-color:#a5b37e;color:white"><b>全选</b></button>
                                    <button class="btn btn-default" id="noall_ip" onclick="uncheckall(this)" style="width:50%"><b>取消全选</b></button>
                                </div>
                            </th>
                        </tr>
                        </thead>
                        <tbody id="ip_tbody">

                        </tbody>
                    </table>
                </div>
                <div class="col-md-6 col-sm-6">
                    <h3>步骤</h3>
                    <form class="form-horizontal" id="install_step" action="/configureOperation" method="post">
                        <div class="form-group has-warning">
                            <label for="install_ip" class="col-sm-2 control-label" style="cursor: pointer">虚拟机ip：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="ip" id="install_ip" />
                            </div>
                        </div>
                        <%--自动化安装脚本--%>
                        <div class="form-group has-warning" style="margin-bottom:0px">
                            <label for="step_1" class="col-sm-2 control-label" style="cursor: pointer">步骤1：</label>
                            <div class="col-sm-10">
                                <input type="submit" class="form-control" id="step_1" name="getSteps" value="automate get scripts" >
                                <div class="col-sm-12" style="text-align:center">
                                    <img src="/static/img/down.png" style="width:35%;height:66px"/>
                                </div>
                            </div>
                        </div>

                        <%--安装docker--%>
                        <div class="form-group has-warning" style="margin-bottom:0px">
                            <label for="step_2" class="col-sm-2 control-label" style="cursor: pointer">步骤2：</label>
                            <div class="col-sm-10">
                                <input type="submit" class="form-control" id="step_2" name="getSteps" value="install docker" >
                                <div class="col-sm-12" style="text-align:center">
                                    <img src="/static/img/down.png" style="width:35%;height:66px"/>
                                </div>
                            </div>
                        </div>

                        <%--配置daemon文件--%>
                        <div class="form-group has-warning">
                            <label for="step_3" class="col-sm-2 control-label" style="cursor: pointer">步骤3：</label>
                            <div class="col-sm-10">
                                <input type="submit" class="form-control" id="step_3" name="getSteps" value="start docker and configure daemon" >
                            </div>
                        </div>



                    </form>
                </div>
            </div>
        </div>
    </div>


    <jsp:include page="footer.jsp" flush="true"></jsp:include>
    <script>
        function ipcheck(data){
            var old_ip_str=$("#install_ip").val();
            var old_ip_arr=old_ip_str.split(",");
            var ip_str='';
            var table=$('#ip_tables').DataTable();
            var final_ip='';
            if(old_ip_arr.indexOf(data)==-1){
                var datas=table.rows({selected: true}).data();
                datas.each(function(index,elem){
                    ip_str +=index[0] +",";
                });
                final_ip=data+','+ip_str;
            }else{
                for(var i=0;i<old_ip_arr.length;i++){
                    if(old_ip_arr[i] != data){
                        final_ip += old_ip_arr[i]+',';
                    }
                }
            }
            $("#install_ip").val(final_ip.substring(0,final_ip.length-1));
        }
        function checkall(obj){
            var ip_str='';
            var table=$('#ip_tables').DataTable();
            table.rows().select();
            var datas=table.rows({selected: true}).data();
            datas.each(function(index,elem){
                ip_str +=index[0] +",";
            });
            $("#install_ip").val(ip_str.substring(0,ip_str.length-1));
        }
        function uncheckall(obj){
            var table=$('#ip_tables').DataTable();
            table.rows().deselect();
            $("#install_ip").val('');
        }
        $(document).ready(function(){

            /* 服务器列表 */
            //var virtual_machine_ip=["10.10.108.110","10.10.108.111","10.10.108.112","10.10.108.113","10.10.108.114","10.10.108.115","10.10.108.167","10.10.108.168","10.10.108.169","10.10.108.170","10.10.108.116","10.10.108.117","10.10.108.118","10.10.108.171","10.10.108.172","10.10.108.173","10.10.108.174","10.10.108.119","10.10.108.120","10.10.108.121","10.10.108.177","10.10.108.178","10.10.108.179","10.10.108.198 C类","10.10.108.199 C类","10.10.108.200 C类","10.10.108.210 C类","10.10.108.175","10.10.108.176","10.10.108.122","10.10.108.123","10.10.108.124","10.10.108.125","10.10.108.126","10.10.108.127","10.10.108.128","10.10.108.129","10.10.108.130","10.10.108.180","10.10.108.181","10.10.108.182","10.10.108.131","10.10.108.132","10.10.108.133","10.10.108.134","10.10.108.135","10.10.108.136","10.10.108.137","10.10.108.138","10.10.108.139","10.10.108.183","10.10.108.184","10.10.108.185","10.10.108.211 C类 ","10.10.108.212 C类","10.10.108.213 C类","10.10.108.140","10.10.108.141","10.10.108.142","10.10.108.143","10.10.108.144","10.10.108.145","10.10.108.146","10.10.108.147","10.10.108.148","10.10.108.186","10.10.108.187","10.10.108.188","10.10.108.189","10.10.108.190","10.10.108.191","10.10.108.192 C类","10.10.108.214 C类","10.10.108.215 C类","10.10.108.216 C类","10.10.108.217 C类","10.10.108.218 C类","10.10.108.219 C类","10.10.108.220 C类","10.10.108.149","10.10.108.150","10.10.108.151","10.10.108.152","10.10.108.153","10.10.108.154","10.10.108.193 C类","10.10.108.194 C类","10.10.108.197 C类","10.10.108.155","10.10.108.156","10.10.108.157","10.10.108.158","10.10.108.159","10.10.108.160","10.10.108.195 C类","10.10.108.196 C类","10.10.108.161","10.10.108.162","10.10.108.163","10.10.108.164","10.10.108.165","10.10.108.166"];
            var virtual_machine_ip= {
                "10.10.108.63": [
                    "10.10.108.110",
                    "10.10.108.111",
                    "10.10.108.112"
                ],
                "10.10.108.65": [
                    "10.10.108.113",
                    "10.10.108.114",
                    "10.10.108.115",
                    "10.10.108.167",
                    "10.10.108.168",
                    "10.10.108.169",
                    "10.10.108.170"
                ],
                "10.10.108.61": [
                    "10.10.108.116",
                    "10.10.108.117",
                    "10.10.108.118",
                    "10.10.108.171",
                    "10.10.108.172",
                    "10.10.108.173",
                    "10.10.108.174"
                ],
                "10.10.108.76": [
                    "10.10.108.119",
                    "10.10.108.120",
                    "10.10.108.121",
                    "10.10.108.177",
                    "10.10.108.178",
                    "10.10.108.179",
                    "10.10.108.198",
                    "10.10.108.199",
                    "10.10.108.200",
                    "10.10.108.210",
                    "10.10.108.175",
                    "10.10.108.176"
                ],
                "10.10.108.13": [
                    "10.10.108.122",
                    "10.10.108.123",
                    "10.10.108.124"
                ],
                "10.10.108.36": [
                    "10.10.108.125",
                    "10.10.108.126",
                    "10.10.108.127"
                ],
                "10.10.108.70": [
                    "10.10.108.128",
                    "10.10.108.129",
                    "10.10.108.130",
                    "10.10.108.180",
                    "10.10.108.181",
                    "10.10.108.182"
                ],
                "10.10.108.71": [
                    "10.10.108.131",
                    "10.10.108.132",
                    "10.10.108.133"
                ],
                "10.10.108.73": [
                    "10.10.108.134",
                    "10.10.108.135",
                    "10.10.108.136"
                ],
                "10.10.108.74": [
                    "10.10.108.137",
                    "10.10.108.138",
                    "10.10.108.139",
                    "10.10.108.183",
                    "10.10.108.184",
                    "10.10.108.185",
                    "10.10.108.211",
                    "10.10.108.212",
                    "10.10.108.213"
                ],
                "10.10.108.75": [
                    "10.10.108.140",
                    "10.10.108.141",
                    "10.10.108.142"
                ],
                "10.10.108.37": [
                    "10.10.108.143",
                    "10.10.108.144",
                    "10.10.108.145"
                ],
                "10.10.108.86": [
                    "10.10.108.146",
                    "10.10.108.147",
                    "10.10.108.148",
                    "10.10.108.186",
                    "10.10.108.187",
                    "10.10.108.188",
                    "10.10.108.189",
                    "10.10.108.190",
                    "10.10.108.191",
                    "10.10.108.192",
                    "10.10.108.214",
                    "10.10.108.215",
                    "10.10.108.216",
                    "10.10.108.217",
                    "10.10.108.218",
                    "10.10.108.219",
                    "10.10.108.220"
                ],
                "10.10.108.100": [
                    "10.10.108.149",
                    "10.10.108.150",
                    "10.10.108.151"
                ],
                "10.10.108.60": [
                    "10.10.108.152",
                    "10.10.108.153",
                    "10.10.108.154",
                    "10.10.108.193",
                    "10.10.108.194",
                    "10.10.108.197"
                ],
                "10.10.108.97": [
                    "10.10.108.155",
                    "10.10.108.156",
                    "10.10.108.157"
                ],
                "10.10.108.51": [
                    "10.10.108.158",
                    "10.10.108.159",
                    "10.10.108.160",
                    "10.10.108.195",
                    "10.10.108.196"
                ],
                "10.10.108.52": [
                    "10.10.108.161",
                    "10.10.108.162",
                    "10.10.108.163"
                ],
                "10.10.108.53": [
                    "10.10.108.164",
                    "10.10.108.165",
                    "10.10.108.166"
                ]
            };
            var table_html='';
            for(var wl_ip in virtual_machine_ip){
                //table_html+='<tr><td style="text-align:center"><input type="checkbox" name="ip" value="'+ip+'" onclick="ipcheck()"></td><td style="text-align:center">'+ip+'</td><td style="text-align:center">虚拟机配置 CPU：1核、内存：2GB</td><td style="text-align:center"></td></tr>';
                for(var virtual_ip of virtual_machine_ip[wl_ip]){
                    table_html+='<tr onclick="ipcheck(\''+virtual_ip+'\')"><td style="text-align:center">'+virtual_ip+'</td><td style="text-align:center">虚拟机配置 CPU：1核、内存：2GB</td><td style="text-align:center">'+wl_ip+'</td></tr>';

                }
            }
            $(table_html).appendTo($("#ip_tbody"));
            /* $("#ip_tables").DataTable({
             "iDisplayLength": 10,
             }); */
            $('#ip_tables').DataTable( {
                select: 'multi'
            } );

            /* docker本地仓库信息 */
            var image_arr=[["镜像1","版本1","2018-09-06","限制1"],["镜像2","版本2","2018-09-07","限制2"]];
            var image_str='';
            for(var img of image_arr){
                image_str+='<tr><td style="text-align:center">'+img[0]+'</td><td style="text-align:center">'+img[1]+'</td><td style="text-align:center">'+img[2]+'</td><td style="text-align:center">'+img[3]+'</td></tr>';
            }
            $(image_str).appendTo($("#image_tbody"));
            $("#image_tables").DataTable({
                "iDisplayLength": 10,
            });

            /* 表单返回信息 */
            $("#install_step").ajaxForm(function(data){
                alert(data);
            });


        });

    </script>
</div>
</body>
</html>







<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: zhanghao--%>
  <%--Date: 2018/9/5--%>
  <%--Time: 下午5:18--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
         <%--pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta charset="utf-8">--%>
    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <%--<link rel="stylesheet" href="/static/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="/static/css/ionicons.min.css">--%>
    <%--<!-- Font Awesome -->--%>
    <%--<link rel="stylesheet" href="/static/css/font-awesome.min.css">--%>
    <%--<!-- Theme style -->--%>
    <%--<link rel="stylesheet" href="/static/css/AdminLTE.min.css">--%>
    <%--<link rel="stylesheet" href="/static/css/_all-skins.min.css">--%>
    <%--<link rel="stylesheet" href="/static/css/dataTables.bootstrap.css">--%>
    <%--<link rel="stylesheet" href="/static/ui/layui/css/layui.css">--%>
    <%--<title>RainBowML 用户界面</title>--%>
    <%--<link rel="shortcut icon" href="/static/img/RainbowML-small.png">--%>

    <%--<!-- jQuery 2.2.3 -->--%>
    <%--<script src="/static/js/jquery-2.2.3.min.js"></script>--%>
    <%--<!-- Bootstrap 3.3.6 -->--%>
    <%--<script src="/static/js/bootstrap.min.js"></script>--%>
    <%--<!-- AdminLTE App -->--%>
    <%--<script src="/static/js/app.min.js"></script>--%>
    <%--<script src="/static/js/jquery.knob.js"></script>--%>
    <%--<script src="/static/js/jquery.dataTables1.min.js"></script>--%>
    <%--<script src="/static/js/dataTables.bootstrap.min.js"></script>--%>
    <%--<script src="/static/ui/layui/layer.js"></script>--%>
    <%--<script src="/static/ui/layui/layui.js"></script>--%>
    <%--<script src="/static/js/echarts.min.js"></script>--%>
<%--</head>--%>
<%--<body class="hold-transition skin-purple-light sidebar-mini">--%>

<%--<div class="wrapper">--%>
    <%--<jsp:include page="header.jsp" flush="true" />--%>

    <%--<div class="content">--%>
        <%--<div class="row" style="margin:0px">--%>
            <%--<div class="col-xs-12 col-md-12 col-sm-12" >--%>
                <%--<div class="col-md-5 col-sm-5">--%>
                    <%--<table class="table table-bordered table-striped" id="ip_tables" >--%>
                        <%--<thead>--%>
                        <%--<tr>--%>
                            <%--<th colspan="2" style="text-align:center">服务器列表</th>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<th colspan="2" style="text-align:center">虚拟机配置 CPU：1核、内存：2GB</th>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<th width="80px" style="text-align:center">选择</th>--%>
                            <%--<th style="text-align:center">虚拟机IP</th>--%>
                        <%--</tr>--%>
                        <%--<tr>--%>
                            <%--<th colspan="2">--%>
                                <%--<button class="btn bg-olive margin" id="all_ip" onclick="checkall(this)" style="width:45%">全选</button>--%>
                                <%--<button class="btn bg-teal margin" id="noall_ip" onclick="uncheckall(this)"style="width:45%">取消全选</button></th>--%>
                        <%--</tr>--%>
                        <%--</thead>--%>
                        <%--<tbody id="ip_tbody">--%>

                        <%--</tbody>--%>
                    <%--</table>--%>
                <%--</div>--%>
                <%--<div class="col-md-6 col-sm-6">--%>
                    <%--<h3>步骤</h3>--%>
                    <%--<form class="form-horizontal" id="install_step" action="/configureOperation" method="post">--%>
                        <%--<div class="form-group has-warning">--%>
                            <%--<label for="install_ip" class="col-sm-2 control-label" style="cursor: pointer">虚拟机ip：</label>--%>
                            <%--<div class="col-sm-10">--%>
                                <%--<input type="text" class="form-control" name="ip" id="install_ip" />--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--&lt;%&ndash;自动化安装脚本&ndash;%&gt;--%>
                        <%--<div class="form-group has-warning" style="margin-bottom:0px">--%>
                            <%--<label for="step_1" class="col-sm-2 control-label" style="cursor: pointer">步骤1：</label>--%>
                            <%--<div class="col-sm-10">--%>
                                <%--<input type="submit" class="form-control" id="step_1" name="getSteps" value="automate get scripts" >--%>
                                <%--<div class="col-sm-12" style="text-align:center">--%>
                                    <%--<img src="/static/img/down.png" style="width:35%;height:66px"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <%--&lt;%&ndash;安装docker&ndash;%&gt;--%>
                        <%--<div class="form-group has-warning" style="margin-bottom:0px">--%>
                            <%--<label for="step_2" class="col-sm-2 control-label" style="cursor: pointer">步骤2：</label>--%>
                            <%--<div class="col-sm-10">--%>
                                <%--<input type="submit" class="form-control" id="step_2" name="getSteps" value="install docker" >--%>
                                <%--<div class="col-sm-12" style="text-align:center">--%>
                                    <%--<img src="/static/img/down.png" style="width:35%;height:66px"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <%--&lt;%&ndash;配置daemon文件&ndash;%&gt;--%>
                        <%--<div class="form-group has-warning">--%>
                            <%--<label for="step_3" class="col-sm-2 control-label" style="cursor: pointer">步骤3：</label>--%>
                            <%--<div class="col-sm-10">--%>
                                <%--<input type="submit" class="form-control" id="step_3" name="getSteps" value="start docker and configure daemon" >--%>
                            <%--</div>--%>
                        <%--</div>--%>



                    <%--</form>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>


    <%--<jsp:include page="footer.jsp" flush="true"></jsp:include>--%>
    <%--<script>--%>
        <%--function ipcheck(){--%>
            <%--var ip_str='';--%>
            <%--$("input:checkbox[name='ip']:checked").each(function(){--%>
                <%--ip_str+=$(this).val() +",";--%>
            <%--});--%>
            <%--$("#install_ip").val(ip_str.substring(0,ip_str.length-1));--%>
        <%--}--%>
        <%--function checkall(obj){--%>
            <%--$("input:checkbox[name='ip']").each(function(index,elem){--%>
                <%--elem.checked="true";--%>
            <%--});--%>
            <%--ipcheck();--%>
        <%--}--%>
        <%--function uncheckall(obj){--%>
            <%--$("input:checkbox[name='ip']").each(function(index,elem){--%>
                <%--elem.checked="";--%>
            <%--});--%>
            <%--ipcheck();--%>
        <%--}--%>
        <%--$(document).ready(function(){--%>

            <%--var virtual_machine_ip=["10.10.108.110","10.10.108.111","10.10.108.112","10.10.108.113","10.10.108.114","10.10.108.115","10.10.108.167","10.10.108.168","10.10.108.169","10.10.108.170","10.10.108.116","10.10.108.117","10.10.108.118","10.10.108.171","10.10.108.172","10.10.108.173","10.10.108.174","10.10.108.119","10.10.108.120","10.10.108.121","10.10.108.177","10.10.108.178","10.10.108.179","10.10.108.198","10.10.108.199","10.10.108.200","10.10.108.210","10.10.108.175","10.10.108.176","10.10.108.122","10.10.108.123","10.10.108.124","10.10.108.125","10.10.108.126","10.10.108.127","10.10.108.128","10.10.108.129","10.10.108.130","10.10.108.180","10.10.108.181","10.10.108.182","10.10.108.131","10.10.108.132","10.10.108.133","10.10.108.134","10.10.108.135","10.10.108.136","10.10.108.137","10.10.108.138","10.10.108.139","10.10.108.183","10.10.108.184","10.10.108.185","10.10.108.211","10.10.108.212","10.10.108.213","10.10.108.140","10.10.108.141","10.10.108.142","10.10.108.143","10.10.108.144","10.10.108.145","10.10.108.146","10.10.108.147","10.10.108.148","10.10.108.186","10.10.108.187","10.10.108.188","10.10.108.189","10.10.108.190","10.10.108.191","10.10.108.192","10.10.108.214","10.10.108.215","10.10.108.216","10.10.108.217","10.10.108.218","10.10.108.219","10.10.108.220","10.10.108.149","10.10.108.150","10.10.108.151","10.10.108.152","10.10.108.153","10.10.108.154","10.10.108.193","10.10.108.194","10.10.108.197","10.10.108.155","10.10.108.156","10.10.108.157","10.10.108.158","10.10.108.159","10.10.108.160","10.10.108.195","10.10.108.196","10.10.108.161","10.10.108.162","10.10.108.163","10.10.108.164","10.10.108.165","10.10.108.166"];--%>
            <%--var table_html='';--%>
            <%--for(var ip of virtual_machine_ip){--%>
                <%--table_html+='<tr><td style="text-align:center"><input type="checkbox" name="ip" value="'+ip+'" onclick="ipcheck()"></td><td style="text-align:center">'+ip+'</td></tr>';--%>
            <%--}--%>
            <%--$(table_html).appendTo($("#ip_tbody"));--%>
            <%--$("#ip_tables").DataTable({--%>
                <%--"iDisplayLength": 10,--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


