<%--
  Created by IntelliJ IDEA.
  User: zhanghao
  Date: 2018/9/6
  Time: 下午5:06
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
    <link rel="stylesheet" href="/static_cos5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static_cos5/css/ionicons.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static_cos5/css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/css/_all-skins.min.css">
    <link rel="stylesheet" href="/static/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/static/ui/DataTables/media/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/static/ui/DataTables/extensions/Select/css/select.dataTables.min.css">
    <link rel="stylesheet" href="/static/ui/layui/css/layui.css">
    <title>RainBowML 用户界面</title>
    <link rel="shortcut icon" href="/static_cos5/img/RainbowML-small.png">

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
        <div class="row" style="margin:0px">
            <div class="div-line"></div>
            <div class="col-xs-12 col-md-12 col-sm-12" style="margin-top:20px;padding-top:10px;background-color:#eee;box-shadow: 0px 0px 30px 5px #ddd;">
                <div class="col-md-6 col-sm-6" style="border-right:2px double #ccc;">
                    <table class="table table-bordered table-striped" id="ip_tables" >
                        <thead>
                        <tr>
                            <th colspan="3" style="text-align:center;font-size:16px;background:#E6F3F6 url('/static/img/cell_blue.jpg') no-repeat;background-size:100%;">服务器列表</th>
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
                                    <button class="btn btn-default " onclick="checkall(this,'ip')" style="width:50%;background-color:#a5b37e;color:white"><b>全选</b></button>
                                    <button class="btn btn-default" onclick="uncheckall(this,'ip')" style="width:50%"><b>取消全选</b></button>
                                </div>
                            </th>
                        </tr>
                        </thead>
                        <tbody id="ip_tbody">

                        </tbody>
                    </table>
                </div>
                <div class="col-md-6 col-sm-6">
                    <table class="table table-bordered table-striped" id="image_tables" >
                        <thead>
                        <tr>
                            <th colspan="2" style="text-align:center;font-size:16px;background:#F5F5E7 url('/static/img/cell_yellow.jpg') no-repeat;background-size:100%">镜像列表</th>
                        </tr>

                        <tr>
                            <th width="80px" style="text-align:center">选择</th>
                            <th style="text-align:center">镜像列表</th>
                        </tr>
                        <%--<tr>--%>
                            <%--<th colspan="2">--%>
                                <%--<button class="btn bg-orange margin" id="all_ip" onclick="checkall(this,'image')" style="width:45%">全选</button>--%>
                                <%--<button class="btn bg-yellow margin" id="noall_ip" onclick="uncheckall(this,'image')" style="width:45%">取消全选</button>--%>
                            <%--</th>--%>
                        <%--</tr>--%>
                        </thead>
                        <tbody id="image_tbody">

                        </tbody>
                    </table>
                </div>
                <div class="col-md-12 col-sm-12" style="margin-top:20px;border-top:2px double #ccc;padding-top:10px;background-color:#eee;box-shadow: 0px 0px 30px 5px #ddd;">
                    <h3 style="margin-bottom:20px">docker镜像部署</h3>
                    <form class="form-horizontal" id="image_deploy" action="/deployOperation" method="post" name="imagedeploy">
                        <div class="form-group has-warning">
                            <label for="deploy_ip" class="col-sm-2 control-label" style="cursor: pointer">虚拟机ip：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="deploy_ip" name="serverIp" >
                            </div>
                        </div>
                        <div class="form-group has-warning">
                            <label for="deploy_image" class="col-sm-2 control-label" style="cursor: pointer">docker镜像：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="deploy_image" name="dockerImage" >
                            </div>
                        </div>
                        <div class="form-group has-success" style="margin-bottom:50px">
                            <label class="col-sm-2 control-label" style="cursor: pointer;color: #3c763d;">开始部署：</label>
                            <div class="col-sm-9">
                                <div class="col-sm-3" style="padding-left:0px">
                                    <input type="submit" class="form-control" id="strategy1" name="deployButton1" value="strategy_1" style="border-color: #3c763d;">
                                </div>
                                <div class="col-sm-3" style="padding-left:0px">
                                    <input type="submit" class="form-control" id="strategy2" name="deployButton2" value="strategy_2" style="border-color: #3c763d;">
                                </div>
                                <div class="col-sm-3" style="padding-left:0px">
                                    <input type="submit" class="form-control" id="strategy3" name="deployButton3" value="strategy_3" style="border-color: #3c763d;">
                                </div>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <jsp:include page="footer.jsp" flush="true"></jsp:include>
    <script>
        // function test(){
        //     var num=parseInt(Math.random()*10, 10);
        //     //alert(num);
        //     if(num % 2 == 0){
        //         $("#test_result").html('可以ping通<i class="fa fa-fw fa-check text-green"></i>');
        //     }else{
        //         $("#test_result").html('无法ping通<i class="fa fa-fw fa-close text-red"></i>');
        //     }
        //     var data;
        //     $.ajax({
        //         type: "post",
        //         async: false,
        //         url: "",
        //         data: {"data":data},
        //         dataType: "json",
        //         timeout: 1000,
        //         success: function (datas) {
        //             alert(datas);
        //             /* if(datas.status=="success"){
        //
        //             } */
        //         }
        //     });
        // }
        function ipcheck(data,type){
            var old_ip_str='';
            var old_ip_arr='';
            if(type=="ip"){
                old_ip_str=$("#deploy_ip").val();
                old_ip_arr=old_ip_str.split(",");
                var table=$('#ip_tables').DataTable();
                var final_ip='';
                var ip_str='';
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
                $("#deploy_ip").val(final_ip.substring(0,final_ip.length-1));

            }else{
                var image_str='';
                $("input:radio[name='image']:checked").each(function(){
                    image_str+=$(this).val() +",";
                });
                $("#deploy_image").val(image_str.substring(0,image_str.length-1));
            }
        }
        function checkall(obj,type){
            var ip_str='';
            var table='';
            if(type=='ip'){
                table=$('#ip_tables').DataTable();
                table.rows().select();
                var datas=table.rows({selected: true}).data();
                datas.each(function(index,elem){
                    ip_str +=index[0] +",";
                });
                $("#deploy_ip").val(ip_str.substring(0,ip_str.length-1));
            }else{
                table=$('#image_tables').DataTable();
                table.rows().select();
                var datas=table.rows({selected: true}).data();
                datas.each(function(index,elem){
                    ip_str +=index[0] +",";
                });
                $("#deploy_image").val(ip_str.substring(0,ip_str.length-1));
            }
        }
        function uncheckall(obj,type){
            if(type=='ip'){
                var table=$('#ip_tables').DataTable();
                table.rows().deselect();
                $("#deploy_ip").val('');
            }else{
                var table=$('#image_tables').DataTable();
                table.rows().deselect();
                $("#deploy_image").val('');
            }
        }
        $(document).ready(function(){

            /* 进度条 */
            // var timer=null;
            // var count=0;
            // clearInterval(timer);
            // timer=setInterval(dockerdeploy,3000);
            // function dockerdeploy(){
            //     if(count!=100){
            //         count=count+10;
            //         var count_str=count+"%";
            //         if(count<=50){
            //             $(".progress-bar").css("background-color","#F3E094");
            //         }else{
            //             $(".progress-bar").css("background-color","#a5b37e");
            //         }
            //         $(".progress-bar").css("width",count_str);
            //         $(".progress-bar b").html(count_str);
            //
            //     }else{
            //         layer.alert('安装成功！', {icon: 6,offset: '200px',});
            //         clearInterval(timer);
            //     }
            // }


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
                    table_html+='<tr onclick="ipcheck(\''+virtual_ip+'\',\'ip\')"><td style="text-align:center">'+virtual_ip+'</td><td style="text-align:center">虚拟机配置 CPU：1核、内存：2GB</td><td style="text-align:center">'+wl_ip+'</td></tr>';

                }

            }
            /* for(var ip of virtual_machine_ip){
                table_html+='<tr><td style="text-align:center"><input type="checkbox" name="ip" value="'+ip+'" onclick="ipcheck(\'ip\')"></td><td style="text-align:center">'+ip+'</td><td style="text-align:center">虚拟机配置 CPU：1核、内存：2GB</td><td style="text-align:center"></td></tr>';

            } */
            $(table_html).appendTo($("#ip_tbody"));
            $("#ip_tables").DataTable({
                "iDisplayLength": 10,
                select: 'multi'
            });

            /* docker本地仓库信息 */
            // var image_arr=["镜像1","镜像2","镜像3","镜像4","镜像5","镜像6"];
            // var image_str='';
            // for(var img of image_arr){
            //     image_str+='<tr onclick="ipcheck(\''+img+'\',\'image\')"><td style="text-align:center">'+img+'</td><td style="text-align:center">版本信息</td></tr>';
            // }
            // $(image_str).appendTo($("#image_tbody"));
            // $("#image_tables").DataTable({
            //     "iDisplayLength": 10,
            //     select: 'multi'
            // });
            /* docker本地仓库信息 */
            /*"centos","debian","jenkins","mongo","mysql","nginx","node","postgres","redis","ubuntu"*/
            var image_arr=["centos","debian","jenkins","mongo","mysql","nginx","node","postgres","redis","ubuntu"];
            var image_str='';
            for(var img of image_arr){
                image_str+='<tr><td style="text-align:center"><input type="radio" name="image" value="'+img+'" onclick="ipcheck(\'image\')"></td><td style="text-align:center">'+img+'</td></tr>';
            }
            $(image_str).appendTo($("#image_tbody"));
            $("#image_tables").DataTable({
                "iDisplayLength": 10,
            });


            /* 表单返回信息 */
            // $("#image_deploy").ajaxForm(function(data){
            //     layer.alert(data, {icon: 6,offset: '200px',});
            // });


        });

    </script>

</div>
</body>
</html>


