function dosearch() {
	var searchfield = $("#search_field")[0].value;
	console.log("关键字："+searchfield);
	if (searchfield == "") {
		alert("请输入关键字!");
		return false;
	}
	/*var filetype = $("[name='filetyperadio']:radio:checked").val();
	var database = $("#database-type option:selected").text();*/
	/*$("#reslut_label").html(
			"<h2>查询结果 &nbsp;&nbsp;<small> 当前数据库：" + database + "，当前关键字：" + searchfield
					+ "</small></h2>");*/
	$("#cx_ganglia").css("display","block");
	$("#loading").css("display","block");
	$.ajax({  
        type : "get",  
        async:true,  
        url : "http://10.10.108.72:3001/search?key="+searchfield,  
        dataType : "json",
        success : function(data){  
        	$("#ganglia").css("display","block");
        	if (data.status > 0){				
				alert("查询成功！");
				$("#loading").css("display","none");
	        	var datas_arr=data.datas.split("\n");
	            console.log(data.datas);
	            $("#showTable").html("");
	            var new_tables = '';
	            new_tables += '<table id="data_table" class="table table-bordered table-striped">'
	                + '<thead>'
	                + '<tr>'
	                + '<th>' + '编号' + '</th>'
	                + '<th>' + '关键字' + '</th>'
	                + '<th>' + '查询结果' + '</th>'
	                + '</tr>'
	                + '</thead>';
	
	            new_tables += '<tbody>';
	            for (var i = 0;i < datas_arr.length; i++) {                                                                            
					new_tables +=
	                                '<tr>'
	                                + '<td>' + i + '</td>'
	                                + '<td>' + searchfield + '</td>'
	                                + '<td>' + datas_arr[i] + '</td>'
	                                + '</tr>';
	            }
	            new_tables += '</tbody>' + '</table>';
	            $(new_tables).appendTo($("#showTable"));
	            $("#data_table").DataTable({
	                "searching": false,
	                "ordering": false,
	                "iDisplayLength": 25
	            });
        	}
			 else
				alert("抱歉，没有数据！"); 
        	    $("#loading").css("display","none");
            
        },  
        error:function(){  
            alert('fail');  
            $("#loading").css("display","none");
        }  
    });    
	

}
function do_page(search, file, page) {
	console.time('分页查询部分');
	
	var baseurl;
	var arrStr = document.cookie.split(";"); 
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0] == "deamon_listener" || temp[0] == " deamon_listener"){
			baseurl='http://'+unescape(temp[1]).replace(/^\s|\s$/g,"").replace(/^\"|\"$/g,'')+':6666';			
		}
	}
	alert(baseurl);
	//修改灵活配置
	
	var searchurl = baseurl + '/SEARCH?search_field=' + search + '&file_type='
			+ file + '&pagenumber=' + page + '&return_type=json';
	console.log(searchurl);
	$("#files_field").empty();
	$("#reslut_label").html("<h2>查询结果<small>当前关键字：" + search + "</small></h2>");
	$("#reslut_label").show();
	$("#results_table").show();
	$("#ftr_search-input").show();
	$("#ftrresult_field").hide();

	$.ajax(
					{
						url : searchurl,
						dataType : 'jsonp',
						crossDomain : true,
						success : function(data) {
							console.log(data.total_count);
							for (var i = 0; i < data.total_count; i++) {

								var file_title = data.files[i].file_title
										.replace(/_/g, ' '), file_id = data.files[i].file_id, file_type = data.files[i].file_type, author_name = data.files[i].author_name, author_id = data.files[i].author_id, updata_time = data.files[i].updata_time, download_count = data.files[i].download_count, view_count = data.files[i].view_count, file_size = data.files[i].file_size, key_words = data.files[i].key_words, excerpt = data.files[i].excerpt;
								var imgurl, checkstring = "";
								switch (file_type) {
								case '.pdf': {
									imgurl = "<a target='blank' href="
											+ baseurl
											+ "/DOWNLOAD?file_name="
											+ data.files[i].index_fullpath
											+ "><img src='../img/pdf.png' /></a>";
									checkstring = '<input type="checkbox"   value="'
											+ file_title
											+ ' " name="filetitlecheck">';
									break;
								}
								case '.txt': {
									imgurl = "<a target='blank' href="
											+ baseurl + "/DOWNLOAD?file_name="
											+ data.files[i].index_fullpath
											+ "><img  src='../img/txt.png' />";
									break;
								}
								case '.xml': {
									imgurl = "<a target='blank' href="
											+ baseurl + "/DOWNLOAD?file_name="
											+ data.files[i].index_fullpath
											+ "><img  src='../img/xml.png' />";
									break;
								}
								default:
									imgurl = "<a target='blank' href="
											+ baseurl
											+ "/DOWNLOAD?file_name="
											+ data.files[i].index_fullpath
											+ "><img src='../img/default.png' />";
								}
								$("#files_field")
										.append(
												'<tr class = "file-row"><td>'
														+ checkstring
														+ imgurl
														+ '</td><td style="width: 500px">'
														+ file_title
														+ '</td><td> '
														+ key_words
														+ '</td><td>'
														+ author_name
														+ '</td><td>'
														+ download_count
														+ '</td><td>'
														+ view_count
														+ '</td><td>'
														+ file_size
														+ '</td><td>'
														+ updata_time
														+ '</td></tr>');

							}
							$("#page_nav").show();// 显示分页条
							console.timeEnd('分页查询部分');
						}
					}).fail(function() {
				alert("服务器没响应，请稍后再试");
				console.timeEnd('分页查询部分');
			});

}
function doftrsearch() {

	console.time("全文检索");
	$("#page_nav").hide();// 隐藏分页条
	var ftrsearchfield = $("#ftr_field")[0].value;
	var searchfile = "";
	var temp = "";
	if (ftrsearchfield == "") {
		alert("请输入关键字");
		return false;
	}
	$("[name='filetitlecheck']:checkbox:checked").each(function() {
		temp = $(this).val();
		console.log(temp);
		if (temp != "all" && temp != "txt" && temp != "pdf" && temp != "xml") {
			if (searchfile == "")
				searchfile = temp;
			else
				searchfile = searchfile + "|" + temp; // 分隔符为|
		}
	});
	// searchfile = $("[name='filetitleradio']:radio:checked").val();
	// // 单选框选择的文件名
	console.log(searchfile);// 打印选择的文件名
	if (searchfile == "") {
		alert("请选择文件");
		return false;
	}

	// 生成全文检索链接
	var baseurl;
	var arrStr = document.cookie.split(";"); 
	for(var i = 0;i < arrStr.length;i ++){
		var temp = arrStr[i].split("=");
		if(temp[0] == "deamon_listener" || temp[0] == " deamon_listener"){
			baseurl='http://'+unescape(temp[1]).replace(/^\s|\s$/g,"").replace(/^\"|\"$/g,'')+':6666';			
		}
	}
	alert(baseurl);
	//修改灵活配置
	//var baseurl = 'http://10.10.108.86:6666';
	var ftrsearchurl = baseurl + '/RUNAPP?file_name=' + searchfile
			+ '&keywords=' + ftrsearchfield + '&return_type=json';
	searchfile = searchfile.replace(/_/g, ' ');
	searchfile = searchfile.replace(/[|]/g, "<br>");
	$("#reslut_label").html(
			"<h2 >全文检索结果<br><small>检索文件名：" + searchfile + "<br>检索关键字："
					+ ftrsearchfield + "</small></h2>");
	$("#reslut_label").show();
	$.ajax({
		url : ftrsearchurl,
		dataType : 'jsonp',
		crossDomain : true,
		success : function(data) {
			fake();
		}
	}).fail(fake());
	function fake() {
		// TODO:处理返回的文件数据
		$("#files_field").empty();

		$("#results_table").hide();
		$("#ftrresult_field").show();
		var data = '{"keyword":"'
				+ ftrsearchfield
				+ '","files":[{"file_name":"5de25195b10f448eba8aa44b62baa572POSTER Dr. Watson Provides Data for Post-Breach Analysis.pdf","row_count":"","rows":["Nowadays security systems have become highly sophisti-","D.4.6 [Operating Systems]: Security and Protection|Ac-","cess controls, Information flow controls, Security kernels","Design, Experimentation, Human Factors, Security","Computer security encompasses concepts and methods for","puter security starts from the policies that regulate access","invest in information security is to safeguard the conden-","mation security systems have evolved signicantly. Policies","of strong & reliable security mechanisms for all levels, se-","overcome new security blockages. Thus, it is mandatory to","invest in security systems but equally is important to antic-","help security systems during postmortem. As an example,","in mind the security and digital forensic aspects. They pro-"]}]}';
		console.log(data);
		for (var i = 0; i < data.total_count; i++) {
			// start fake
			$("#files_field").empty();

			$("#results_table").hide();
			$("#ftrresult_field").show();
			var data = '{"total_count":"1","keyword":"'
					+ ftrsearchfield
					+ '","files":[{"file_name":"5de25195b10f448eba8aa44b62baa572POSTER Dr. Watson Provides Data for Post-Breach Analysis.pdf","row_count":"13","rows":["Nowadays security systems have become highly sophisti-","D.4.6 [Operating Systems]: Security and Protection|Ac-","cess controls, Information flow controls, Security kernels","Design, Experimentation, Human Factors, Security","Computer security encompasses concepts and methods for","puter security starts from the policies that regulate access","invest in information security is to safeguard the confiden-","mation security systems have evolved significantly. Policies","of strong & reliable security mechanisms for all levels, se-","overcome new security blockages. Thus, it is mandatory to","invest in security systems but equally is important to antic-","help security systems during postmortem. As an example,","in mind the security and digital forensic aspects. They pro-"]}]}';
			console.log(data);
			data = JSON.parse(data);
			var ftrtext = "";
			for (var i = 0; i < data.total_count; i++) {

				ftrtext += '<h4>' + data.files[i].file_name + '<small>关键字：'
						+ data.keyword + '出现' + data.files[i].row_count
						+ '次</small></h4><div class="well">';
				for (var j = 0; j < data.files[i].row_count; j++) {
					ftrtext += '<p>' + data.files[i].rows[j] + '</p>';
				}
				ftrtext += '</div>';
				$("#ftr-row").html(ftrtext);
			}
			var keyword = data.keyword;// 关键字高亮代码
			$("p:contains('" + keyword + "')").each(
					function() {
						var t = $(this).html();
						var re = eval('/' + keyword + '/g');
						$(this).html(
								t.replace(re, "<b style='background:yellow'>"
										+ keyword + "</b>"));
					});
			console.timeEnd("全文检索");
		}
	}
	
}