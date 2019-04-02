<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
	<%--pageEncoding="UTF-8"%>--%>
<%--<style>--%>
        <%--#head1,#navbar-collapse,#head2 {--%>
            <%--background: -webkit-linear-gradient(#9E9E9E, #000000); /* Safari 5.1 - 6.0 */--%>
            <%--background: -o-linear-gradient(#9E9E9E, #000000); /* Opera 11.1 - 12.0 */--%>
            <%--background: -moz-linear-gradient(#9E9E9E, #000000); /* Firefox 3.6 - 15 */--%>
            <%--background: linear-gradient(#9E9E9E, #000000); /* 标准的语法（必须放在最后） */--%>
        <%--}--%>
        <%----%>
    <%--</style>--%>
<%--<header class="main-header">--%>
  <%--<nav class="navbar navbar-static-top" style="margin-left:0px" id="head1">--%>
    <%--<div class="container-fluid">--%>
    <%--<div class="navbar-header">--%>
      <%--<a href="${base}/rainbowhtest/index.jsp" class="navbar-brand" id="head2" style="padding:5px"><img src="/static/img/RainbowML-small.png" style="height:40px;vertical-align:top"></a>--%>
      <%----%>
      <%--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">--%>
        <%--<i class="fa fa-bars" ></i>--%>
        <%----%>
        <%----%>
      <%--</button>--%>
    <%--</div>--%>

    <%--<!-- Collect the nav links, forms, and other content for toggling -->--%>
    <%--<div class="collapse navbar-collapse" id="navbar-collapse">--%>
      <%--<ul class="nav navbar-nav">--%>
        <%--<li class="active"><a href="http://10.10.108.91:8080/rainbowhtest/view/summary.jsp">资源管理</a></li>--%>
        <%--<li class="dropdown">--%>
          <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">组件管理 <span class="caret"></span></a>--%>
          <%--<ul class="dropdown-menu" role="menu">--%>
            <%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/hadoop.jsp#tab-overview">Hadoop</a></li>--%>
            <%--<li class="divider"></li>--%>
            <%--<li><a href="${base}/rainbowhtest/view/hdfs.jsp">HDFS</a></li>--%>
            <%--<li class="divider"></li>--%>
            <%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/ganglia.jsp">Ganglia</a></li>--%>
            <%--&lt;%&ndash; <li class="divider"></li>--%>
            <%--<li><a href="${base}/rainbowhtest/view/tensorflow.jsp">Tensorflow</a></li> &ndash;%&gt;--%>
            <%--<li class="divider"></li>--%>
            <%--<li><a href="${base}/rainbowhtest/view/redis.jsp">Redis</a></li>--%>
            <%--<li class="divider"></li>--%>
            <%--<li><a href="http://10.10.108.65:6006">TensorBoard</a></li>--%>
          <%--</ul>--%>
        <%--</li>--%>
        <%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/realpower.jsp">实时功耗</a></li>--%>
        <%--<li class="dropdown">--%>
          <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">自动部署<span class="caret"></span></a>--%>
          <%--<ul class="dropdown-menu" role="menu">--%>
            <%--&lt;%&ndash; <li><a href="http://10.10.108.63">整机部署</a></li> &ndash;%&gt;--%>
            <%--&lt;%&ndash; <li class="divider"></li>--%>
            <%--<li><a href="${base}/rainbowhtest/view/deploy.jsp">应用部署</a></li>  &ndash;%&gt;--%>
            <%--<li class="divider"></li>--%>
            <%--<li><a href="/virtual_machine">整机部署</a ></li>--%>
            <%--<li class="divider"></li>--%>
            <%--<li><a href="/confitest">docker配置</a></li>--%>
            <%--&lt;%&ndash;--%>
            <%--<li><a href="${base}/rainbowhtest/view/docker_configure.jsp">docker配置</a></li>--%>
            <%--&ndash;%&gt;--%>
            <%--<li class="divider"></li>--%>
            <%--<li><a href="/deploytest">docker镜像部署</a></li>--%>
          <%--</ul>--%>
        <%--</li>--%>
		<%--<li class="dropdown">--%>
          <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">数据工具 <span class="caret"></span></a>--%>
          <%--<ul class="dropdown-menu" role="menu">--%>
            <%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/search.jsp">数据查询</a></li>--%>
			<%--<li class="divider"></li>--%>
			<%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/data_load_v1.jsp">数据装载</a></li>--%>
          <%--</ul>--%>
        <%--</li>--%>
        <%--<li class="dropdown">--%>
          <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">智能日志 <span class="caret"></span></a>--%>
          <%--<ul class="dropdown-menu" role="menu">--%>
            <%--<li><a href="${base}/rainbowhtest/view/flume_ng.jsp">运行情况</a></li>--%>
            <%--<li class="divider"></li>--%>
            <%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/log_tables.jsp">系统日志</a></li>--%>
            <%--<li class="divider"></li>--%>
            <%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/log_4.jsp">可视化</a></li>--%>
          <%--</ul>--%>
        <%--</li>--%>
        <%--<li><a href="http://10.10. .91:8080/rainbowhtest/view/ceshi.jsp">测试工具</a></li>--%>
      <%--</ul>--%>
      <%----%>
    <%--</div><!-- /.navbar-collapse -->--%>
    <%--</div><!-- /.container-fluid -->--%>
  <%--</nav>--%>
<%--</header>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<style>
  #head1,#navbar-collapse,#head2 {
    background: -webkit-linear-gradient(#9E9E9E, #000000); /* Safari 5.1 - 6.0 */
    background: -o-linear-gradient(#9E9E9E, #000000); /* Opera 11.1 - 12.0 */
    background: -moz-linear-gradient(#9E9E9E, #000000); /* Firefox 3.6 - 15 */
    background: linear-gradient(#9E9E9E, #000000); /* 标准的语法（必须放在最后） */
  }

</style>
<header class="main-header">
  <nav class="navbar navbar-static-top" style="margin-left:0px" id="head1">
    <div class="container-fluid">
      <div class="navbar-header">
        <a href="${base}/rainbowhtest/index.jsp" class="navbar-brand" id="head2" style="padding:5px"><img src="/static/img/RainbowML-small.png" style="height:40px;vertical-align:top"></a>

        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
          <i class="fa fa-bars" ></i>


        </button>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="navbar-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="http://10.10.108.91:8080/rainbowhtest/view/summary.jsp">资源管理</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">组件管理 <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <li><a href="http://10.10.108.91:8080/rainbowhtest/view/hadoop.jsp#tab-overview">Hadoop</a></li>
              <li class="divider"></li>
              <li><a href="${base}/rainbowhtest/view/hdfs.jsp">HDFS</a></li>
              <li class="divider"></li>
              <li><a href="http://10.10.108.91:8080/rainbowhtest/view/ganglia.jsp">Ganglia</a></li>
              <%-- <li class="divider"></li>
              <li><a href="${base}/rainbowhtest/view/tensorflow.jsp">Tensorflow</a></li> --%>
              <li class="divider"></li>
              <li><a href="${base}/rainbowhtest/view/redis.jsp">Redis</a></li>
              <li class="divider"></li>
              <li><a href="http://10.10.108.65:6006">TensorBoard</a></li>
            </ul>
          </li>
          <li><a href="http://10.10.108.91:8080/rainbowhtest/view/realpower.jsp">实时功耗</a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">自动部署<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <%-- <li><a href="http://10.10.108.63">整机部署</a></li> --%>
              <%-- <li class="divider"></li>
              <li><a href="${base}/rainbowhtest/view/deploy.jsp">应用部署</a></li>  --%>
              <%--<li class="divider"></li>--%>
              <li><a href="/virtual_machine">整机部署</a ></li>
              <li class="divider"></li>
              <li><a href="/confitest">docker配置</a></li>
              <li class="divider"></li>
              <li><a href="/make_image">docker镜像定制</a></li>
              <%--
              <li><a href="${base}/rainbowhtest/view/docker_configure.jsp">docker配置</a></li>
              --%>
              <li class="divider"></li>
              <li><a href="/deploytest">docker镜像部署</a></li>
            </ul>
          </li>
          <%--<li class="dropdown">--%>
          <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">数据工具 <span class="caret"></span></a>--%>
          <%--<ul class="dropdown-menu" role="menu">--%>
          <%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/search.jsp">数据查询</a></li>--%>
          <%--<li class="divider"></li>--%>
          <%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/data_load_v1.jsp">数据装载</a></li>--%>
          <%--</ul>--%>
          <%--</li>--%>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">智能日志 <span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
              <%--<li><a href="${base}/rainbowhtest/view/flume_ng.jsp">运行情况</a></li>--%>
              <%--<li class="divider"></li>--%>
              <li><a href="http://10.10.108.91:8080/rainbowhtest/view/log_tables.jsp">系统日志</a></li>
              <li class="divider"></li>
              <%--<li><a href="http://10.10.108.91:8080/rainbowhtest/view/log_4.jsp">可视化</a></li>--%>
            </ul>
          </li>
          <%--<li><a href="http://10.10. .91:8080/rainbowhtest/view/ceshi.jsp">测试工具</a></li>--%>
        </ul>

      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
</header>

