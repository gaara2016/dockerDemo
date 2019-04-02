<%--
  Created by IntelliJ IDEA.
  User: zhanghao
  Date: 2018/9/17
  Time: 上午10:40
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
    <script src="/static/js/jquery.form.js"></script>
    <script src="/static/ui/DataTables/media/js/jquery.dataTables.min.js"></script>
    <script src="/static/ui/DataTables/extensions/Select/js/dataTables.select.min.js"></script>
    <script src="/static/ui/DataTables/media/js/dataTables.bootstrap.min.js"></script>
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
    <jsp:include page="header.jsp" flush="true" />

    <div class="content">
        <div class="row" style="margin:0px">
            <div class="div-line1"></div>
            <div class="col-xs-12 col-md-12 col-sm-12" style="margin-top:20px;padding-top:10px;background-color:#eee;box-shadow: 0px 0px 30px 5px #ddd;">
                <div class="col-md-6 col-sm-6" style="border-right:2px double #ccc;">
                    <table class="table table-bordered table-striped" id="image_tables">
                        <thead>
                            <tr>
                                <th colspan="2" style="text-align:center;font-size:18p;background:#F5F5E7 url('../img/cell_yellow.jpg') no-repeat;background-size:100%">服务列表</th>
                            </tr>
                            
                            <tr>
                                <th style="text-align:center">镜像名称</th>
                                <th style="text-align:center">镜像版本</th>
                            </tr>
                            <tr>
                                <th colspan="2" style="padding-right:5px">
                                    <div class="btn-group" style="width:100%">
                                        <button class="btn btn-default " style="width:25%;background-color:#F3E094" onclick="checkall(this,'image')" ><b>全选</b></button>
                                        <button class="btn btn-default" style="width:25%" onclick="uncheckall(this,'image')" ><b>取消全选</b></button>
                                        <button class="btn btn-default" style="width:25%;background-color:#a5b37e;color:white" onclick="imageAdd(this,'image')" ><b>添加</b></button>
                                        <button class="btn btn-default" style="width:25%" onclick="imageDelete(this,'image')" ><b>删除</b></button>
                                    </div>
            
                                </th>
                            </tr>
                        </thead>
                        <tbody id="image_tbody">
                            
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6 col-sm-6">
                    <div class="form-horizontal"> 
                        <div class="form-group has-warning">
                            <label for="image_information" class="col-sm-2 control-label" style="cursor: pointer;padding:0">定制信息：</label>
                            <div class="col-sm-9">
                                <textarea class="form-control" id="image_information" rows="20"></textarea>
                                
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    


    <jsp:include page="footer.jsp" flush="true"></jsp:include>
    <script>
        function checkall(obj,type){
            var table=$('#image_tables').DataTable();
            table.rows().select();
        }
        function uncheckall(obj,type){
            var table=$('#image_tables').DataTable();
            table.rows().deselect();		       
        }
        function imageAdd(obj,type){
            layer.open({
                  type: 2,
                  area: ['80%', '50%'],
                shade: [0.8, '#393D49'],
                  title: false, //不显示标题
                  content: 'docker_image_select.jsp?id=image_information', 
                  cancel: function(){
                    //layer.msg('镜像已经创建成功', {time: 3000, icon:6});
                    //$("#image_information").val("定制内容xxx");
                  }
            });	
        }
        function imageDelete(obj,type){
            var table=$('#image_tables').DataTable();
            var image_delete='';
            /* $("input:checkbox[name='image']:checked").each(function(){
                image_delete +=$(this).val() +",";
            });	 */
            var datas=table.rows({selected: true}).data();
               datas.each(function(index,elem){
                   image_delete +=index[0] +index[1]+",";
               });
            if(image_delete==""){
                alert("请选择要删除的镜像!");
            }else{
                var final_image_delete=image_delete.substring(0,image_delete.length-1);
                var delete_str='您确定要删除以下镜像?<br>'+final_image_delete.replace(/,/g,"<br>");
                //alert(image_delete);
                layer.confirm(delete_str, {
                          btn: ['确定','取消'] ,//按钮
                          title: false,
                    }, function(){
                          layer.msg('已经删除', {icon: 1});
                    }, function(){
                        //layer.closeAll();
                });
            }
        }
        
        $(document).ready(function(){
        
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
            
            
            /* docker本地仓库信息 */
            var image_arr=["镜像1","镜像2","镜像3","镜像4","镜像5","镜像6","镜像11","镜像21","镜像31","镜像41","镜像51","镜像61","镜像12","镜像22","镜像32","镜像42","镜像52","镜像62"];
            var image_str='';		
            for(var img of image_arr){
                image_str+='<tr><td style="text-align:center">'+img+'</td><td style="text-align:center">版本信息</td></tr>';
            }
            $(image_str).appendTo($("#image_tbody"));
            /* $("#image_tables").DataTable({
                "iDisplayLength": 10,
            });  */
            var table = $('#image_tables').DataTable( {
                iDisplayLength: 10,
                dom: 'Bfrtip',
                select: 'multi',
            } );
            
            /* 表单返回信息 */
            $("#image_deploy").ajaxForm(function(data){  
                alert(data);
            });
            
            
        });
        /* $(window).scroll(function () {
            if ($(window).width() < 768) {
                  $(".div-line").css("display","none");
               }else{
                   $(".div-line").css("display","block");
               }
        }); */
        
    </script>
</div>
</body>
</html>
