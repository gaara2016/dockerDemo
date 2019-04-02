<%--
  Created by IntelliJ IDEA.
  User: zhanghao
  Date: 2018/9/17
  Time: 上午10:41
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
    <style>
        .div-line{
            margin:0 auto;
            height: 40rem;
            width: 8px;
            background: radial-gradient(#919191 12%, #eee 80%);

        }
        .div-line1{
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
    <div class="content">
        <div class="row" style="margin:0px">
            <div class="div-line1"></div>
            <div class="col-xs-12 col-md-12 col-sm-12" style="margin-top:20px;padding-top:10px;background-color:#eee;box-shadow: 0px 0px 30px 5px #ddd;min-height: 320px;">
                <div class="form-horizontal">
                    <div class="form-group has-warning">
                        <label class="col-sm-2 control-label" style="cursor: pointer;padding:0;color:#a26518">镜像类型：</label>
                        <div class="col-sm-3">
                            <div class="layui-form">
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <div class="layui-input-inline">
                                            <select name="modules" lay-verify="required" lay-search="" lay-filter="image_classify">
                                                <option value="">直接选择或搜索选择</option>
                                                <option value="镜像类型1">镜像类型1</option>
                                                <option value="镜像类型2">镜像类型2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group has-warning">
                        <label class="col-sm-2 control-label" style="cursor: pointer;padding:0"></label>
                        <div class="col-sm-8">
                            <div id="image_classify_btns">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-horizontal">
                    <div class="form-group has-default">
                        <label for="image_version" class="col-sm-2 control-label" style="cursor: pointer;padding:0;color:#a26518">镜像版本：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="image_version" name="image_version" >
                            <%
                                //获得number
                                String str=request.getParameter("id");
                            %>

                            <div class="col-sm-12" style="padding:0px">
                                <button class="btn margin" style="background-color:#a5b37e;color:white;margin-left:0px;" onclick="submitNew('<%=str %>')" ><b>确 定</b></button>
                                <button class="btn margin" style="background-color:#F3E094;" onclick="cancelAll()" ><b>取 消</b></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    function submitNew(parentid){
        //layer.msg('镜像已经创建成功', {time: 3000, icon:6});
        /* var mylay = parent.layer.getFrameIndex(window.name);//获取弹出层的名字
         parent.layer.close(mylay); */
        var image_version='';
        var image_name='';
        var data;
        var result_str='返回的定制内容xxx';
        parent.$("#"+parentid).val(result_str);
        $.ajax({
            type: "post",
            async: false,
            url: "",
            data: {"data":data},
            dataType: "json",
            timeout: 1000,
            success: function (datas) {
                alert(datas);

            }
        });
    }
    function cancelAll(){
        var mylay = parent.layer.getFrameIndex(window.name);//获取弹出层的名字
        parent.layer.close(mylay);
    }
    $(document).ready(function(){


        //test
        $("#generation_template").click(function(){
            $("#generation_template").ajaxForm(function(data){
                alert(data);
                $("#image_information").val(data);
            });
        });



        layui.use(['layer','form', 'laypage', 'element'], function () {
            var layer = layui.layer, laypage = layui.laypage, element = layui.element , form = layui.form;
            form.on('select(image_classify)', function(data){
                //alert(data.value);
                var version_arr = ["镜像版本1","镜像版本2","镜像版本3","镜像版本4"];
                var btns_str = '<ul class="layui-timeline">';
                for(var btn_i of version_arr){
                    //btns_str+='<button type="button" class="btn bg-olive btn-flat" style="margin:5px 5px 5px 0px;border-radius:5px;padding:3px 6px;font-size:16px">'+btn_i+'</button>';
                    btns_str += '<li class="layui-timeline-item"><i class="layui-icon layui-timeline-axis" style="background-color:rgba(82, 205, 205, 0.76);"></i><div class="layui-timeline-content layui-text"><h3 class="layui-timeline-title" style="cursor: pointer">'+btn_i+'</h3></div></li>';
                }
                btns_str += '</ul>';
                $('#image_classify_btns').html(btns_str);
                var version_lis = $(".layui-timeline-title");
                $(".layui-timeline-title").each(function(index,elem){
                    $(elem).click(function(){
                        $(version_lis).css("color","black");
                        $(this).css("color","green");
                        $("#image_version").val($(this).html());
                    });

                });
                var image_classify=	data.value;
                $.ajax({
                    type: "post",
                    async: false,
                    url: "",
                    data: {"image_classify":image_classify},
                    dataType: "json",
                    timeout: 1000,
                    success: function (datas) {
                        alert(datas);
                        for(var i in datas){
                        }
                    }
                });
            });


        });

        /* 进度条 */
        /* var timer=null;
         var count=0;
         clearInterval(timer);
         timer=setInterval(dockerdeploy,3000);
         function dockerdeploy(){
         if(count!=100){
         count=count+10;
         var count_str=count+"%";
         if(count<=50){
         $(".progress-bar").css("background-color","#F3E094");
         }else{
         $(".progress-bar").css("background-color","#a5b37e");
         }
         $(".progress-bar").css("width",count_str);
         $(".progress-bar b").html(count_str);

         }else{
         layer.alert('安装成功！', {icon: 6,offset: '200px',});
         clearInterval(timer);
         }
         } */



    });
</script>
</body>
</html>

