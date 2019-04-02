// TODO: MySQL & HDFS
function mhload() {
	//传输数据
	//$("#mhschedule").css("display","block");
	var mh="65%";
	var opt="",srcdb="",desdb="",srctable="",destable="",src_file="",dst_file="";
	var mh_schedule = $("#mh_schedule").css("width",mh);
	console.log("mh_schedule: "+mh_schedule);
	var hdfsfile=$("#hdfs-file")[0].value+".txt";
	var start = $("#start-num")[0].value, end = $("#end-num")[0].value;
	var mysqldb=$("#MySQL-DB-nameH option:selected").text();
	var mysqltable=$("#MySQL-Table-nameH option:selected").text();
	console.log("mysqldb: "+mysqldb+" mysqltable: "+mysqltable);
	var role_str="";
	$("#MySQL-role option:selected").each(function(){
		role_str = $(this).text();
		$("#tip").empty();
		switch (role_str) {
			case "export":
				opt="HDFS To MySQL";
				$("#tip").html(opt);
//				src_file = hdfsfile;
//				dst_file = "null";
//				desdb=mysqldb;
//				destable=mysqltable;
				break;
			case "import":
				opt="MySQL To HDFS";
				$("#tip").html(opt);
//				srcdb=mysqldb;
//				srctable=mysqltable;
//				dst_file=hdfsfile;
//				src_file="null";
				break;
		}
	});		
	$("#log").html("<h3><small>" + "装载中……请耐心等候" + "</small><h3>");
	/*$("#ganglia").css("display","block");*/
	$("#loading").css("display","block");
	$("#ganglia_2").css("display","block");
	if (start == "")
		start = "0";
	if (end == "")
		end = "10000";
	
	var baseurl="http://10.10.108.72:3001/data_loader?operate="+role_str+"&dbname="+mysqldb+"&tablename="+mysqltable+"&hdfs="+hdfsfile;
//	var baseurl="http://10.10.108.72:3001/data_loader?operate=export&dbname=bigdata&tablename=data_AB&hdfs=sb.txt";
//	var baseurl="http://localhost:8080/rainbowhtest/servlet/DataLoadServlet";
//				   ${pageContext.request.contextPath }/servlet/DataLoadServlet
//	var baseurl="/servlet/DataLoadServlet";	
//	var newurl = baseurl + '?opt=' + role_str + "&srcDB="
//			+ srcdb + "&srcTable=" + srctable + "&start=" + start + "&end="
//			+ end + "&dstDB=" + desdb + "&dstTable=" + destable+"&srcFile="+src_file + "&dstFile="+dst_file;
//	console.log(newurl);
	$.ajax({
		url : baseurl,
		dataType : 'json',
		success : function(data) {
			console.log("数据："+data);
			if (data.status > 0){
				$("#log").html("<h3><small>" + "装载成功！" + "</small><h3>");
				alert("装载成功！");
				$("#loading").css("display","none");
				/*$("#loading").click(function(){
					$(this).css("display","none");
				});*/
			}
			else{
				$("#log").html("<h3><small>" + "装载失败！" + "</small><h3>");
				alert("装载失败！");
				$("#loading").css("display","none");
				/*$("#loading").click(function(){
					$(this).css("display","none");
				});*/
			}			
		}
	
	}).fail(function() {
		$("#log").html("<h3><small>" + "装载失败:服务器没响应" + "</small><h3>");
		alert("装载失败:服务器没响应");
		$("#loading").css("display","none");
		

	});
}
