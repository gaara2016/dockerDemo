function doload() {
	//修改灵活配置
	//var baseurl = 'http://10.10.108.86:6666';
	var baseurl;
	var arrStr = document.cookie.split(";"); 
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0] == "deamon_listener" || temp[0] == " deamon_listener"){
			baseurl='http://'+unescape(temp[1]).replace(/^\s|\s$/g,"").replace(/^\"|\"$/g,'')+':6666';			
		}
	}
		
	var start = $("#start-num")[0].value, end = $("#end-num")[0].value;
	var opt="",srcdb="",srctable="",desdb="",destable="",src_file="",dst_file="";
			//ordb=	$("#Oracle-DB-name option:selected").text();
			//ortable=$("#Oracle-Table-name option:selected").text(),
			//impdb=$("#Impala-DB-name option:selected").text(),
			//imptable=$("#Impala-Table-name option:selected").text();
	var ordb=$("#Oracle-DB-name")[0].value;	
	var ortable=$("#Oracle-Table-name")[0].value;
	var impdb=$("#Impala-DB-name")[0].value;
	var imptable=$("#Impala-Table-name")[0].value;
	alert(ordb);
	
	$("#log").html("<h3><small>" + "装载中……请耐心等候" + "</small><h3>");
	$("#Oracle-role option:selected").each(function() {
		str = $(this).text();
		$("#tip").empty();
		alert(str);
		switch (str) {
		case "导入":
			opt="ImpalaToOracle";
			srcdb=impdb;
			srctable=imptable;
			desdb=ordb;
			destable=ortable;
			break;
		case "导出":
			opt="OracleToImpala";
			srcdb=ordb;
			srctable=ortable;
			desdb=impdb;
			destable=imptable;
			break;
		}
	});
	if (start == "")
		start = "0";
	if (end == "")
		end = "10000";
	var newurl = baseurl + '/DATALOAD?opt=' + opt + "&srcDB="
			+ srcdb + "&srcTable=" + srctable + "&start=" + start + "&end="
			+ end + "&dstDB=" + desdb + "&dstTable=" + destable +"&srcFile="+src_file + "&dstFile="+dst_file;
	console.log(newurl);
	$.ajax({
		url : newurl,
		dataType : 'jsonp',
		crossDomain : true,
		success : function(data) {

			if (data.state == "success")
				$("#log").html("<h3><small>" + "装载成功" + "</small><h3>");
			else if (data.state == "failure")
				$("#log").html("<h3><small>" + "装载失败" + "</small><h3>");
		}

	}).fail(function() {
		$("#log").html("<h3><small>" + "装载失败:服务器没响应" + "</small><h3>");
	});
	// /DATALOAD?opt=OracleToImpala&srcDB=DBname&srcTable=Tablename&start=0&end=10000&
	// dstDB=DBname&dstTable=Tablename

}

// TODO: Oracle & HDFS
function doloadH() {
	//修改灵活配置
	var baseurl;
	var arrStr = document.cookie.split(";"); 
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0] == "deamon_listener" || temp[0] == " deamon_listener"){
			baseurl='http://'+unescape(temp[1]).replace(/^\s|\s$/g,"").replace(/^\"|\"$/g,'')+':6666';			
		}
	}
	//var baseurl = 'http://10.10.108.86:6666';
	var start = $("#start-num")[0].value, end = $("#end-num")[0].value;
	
	var opt="",srcdb="",desdb="",srctable="",destable="",src_file="",dst_file="";
			//ordb=	$("#Oracle-DB-nameH option:selected").text();
			//ortable=$("#Oracle-Table-nameH option:selected").text(),
			//hdfsfile=$("#option:selected").text(),
	var ordb=$("#Oracle-DB-nameH")[0].value;
	var ortable=$("#Oracle-Table-nameH")[0].value;
	var hdfsfile=$("#hdfs-file")[0].value;
	$("#logH").html("<h3><small>" + "装载中……请耐心等候" + "</small><h3>");
	$("#Oracle-roleH option:selected").each(function() {
		str = $(this).text();
		$("#tipH").empty();
		switch (str) {
		case "导入":
			opt="HDFSToOracle";
			//srcdb=hdfs;
			src_file = hdfsfile;
			dst_file = "";
			//srctable=imptable;
			desdb=ordb;
			destable=ortable;
			//destable=ortable;
			break;
		case "导出":
			opt="OracleToHDFS";
			srcdb=ordb;
			srctable=ortable;
			//desdb=hdfs;
			dst_file=hdfsfile;
			src_file="";
			//destable=imptable;
			break;
		}
	});
	if (start == "")
		start = "0";
	if (end == "")
		end = "10000";
	var newurl = baseurl + '/DATALOAD?opt=' + opt + "&srcDB="
			+ srcdb + "&srcTable=" + srctable + "&start=" + start + "&end="
			+ end + "&dstDB=" + desdb + "&dstTable=" + destable+"&srcFile="+src_file + "&dstFile="+dst_file;
	console.log(newurl);
	$.ajax({
		url : newurl,
		dataType : 'jsonp',
		crossDomain : true,
		success : function(data) {

			if (data.state == "success")
				$("#logH").html("<h3><small>" + "装载成功" + "</small><h3>");
			else if (data.state == "failure")
				$("#logH").html("<h3><small>" + "装载失败" + "</small><h3>");
		}

	}).fail(function() {
		$("#logH").html("<h3><small>" + "装载失败:服务器没响应" + "</small><h3>");
	});
	// /DATALOAD?opt=OracleToImpala&srcDB=DBname&srcTable=Tablename&start=0&end=10000&
	// dstDB=DBname&dstTable=Tablename

}
function doloadHH() {
	//修改灵活配置
	var baseurl;
	var arrStr = document.cookie.split(";"); 
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0] == "deamon_listener" || temp[0] == " deamon_listener"){
			baseurl='http://'+unescape(temp[1]).replace(/^\s|\s$/g,"").replace(/^\"|\"$/g,'')+':6666';			
		}
	}
	//var baseurl = 'http://10.10.108.86:6666';
	var start = $("#start-num")[0].value, end = $("#end-num")[0].value;
	var opt="",srcdb="",desdb="",srctable="",destable="",src_file="",dst_file="";
			//ordb=	$("#Oracle-DB-nameH option:selected").text();
			//ortable=$("#Oracle-Table-nameH option:selected").text(),
			//hdfsfile=$("#option:selected").text(),
	var impdb=$("#Impala-DB-nameH")[0].value;
	var imptable=$("#Impala-Table-nameH")[0].value;
	var hdfsfile=$("#hdfs-file-2")[0].value;
	$("#logHH").html("<h3><small>" + "装载中……请耐心等候" + "</small><h3>");
	$("#Impala-role option:selected").each(function() {
		str = $(this).text();
		$("#tipHH").empty();
		switch (str) {
		case "导入":
			opt="HDFSToImpala";
			//srcdb=hdfs;
			src_file = hdfsfile;
			dst_file = "";
			//srctable=imptable;
			desdb=impdb;
			destable=imptable;
			//destable=ortable;
			break;
		case "导出":
			opt="ImpalaToHDFS";
			srcdb=impdb;
			srctable=imptable;
			//desdb=hdfs;
			dst_file=hdfsfile;
			src_file="";
			//destable=imptable;
			break;
		}
	});
	if (start == "")
		start = "0";
	if (end == "")
		end = "10000";
	var newurl = baseurl + '/DATALOAD?opt=' + opt + "&srcDB="
			+ srcdb + "&srcTable=" + srctable + "&start=" + start + "&end="
			+ end + "&dstDB=" + desdb + "&dstTable=" + destable+"&srcFile="+src_file + "&dstFile="+dst_file;
	console.log(newurl);
	$.ajax({
		url : newurl,
		dataType : 'jsonp',
		crossDomain : true,
		success : function(data) {

			if (data.state == "success")
				$("#logHH").html("<h3><small>" + "装载成功" + "</small><h3>");
			else if (data.state == "failure")
				$("#logHH").html("<h3><small>" + "装载失败" + "</small><h3>");
		}

	}).fail(function() {
		$("#logHH").html("<h3><small>" + "装载失败:服务器没响应" + "</small><h3>");
	});
}