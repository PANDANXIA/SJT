<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>报表生成测试</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
<link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css">
<link href="media/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="media/css/style-metro.css" rel="stylesheet" type="text/css">
<link href="media/css/style.css" rel="stylesheet" type="text/css">
<link href="media/css/style-responsive.css" rel="stylesheet" type="text/css">
<link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="media/css/uniform.default.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="datatable/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="media/css/select2_metro.css">
<link rel="stylesheet" type="text/css" href="media/css/chosen.css">
<!-- END PAGE LEVEL STYLES -->

<!--<link rel="shortcut icon" href="media/image/favicon.ico" />-->
<style>

</style>
</head>
<body>
<!-- BEGIN HEADER start-->
<%@include file="header.jsp"%>
<!-- BEGIN HEADER end-->
<div class="page-container row-fluid">
		<!-- BEGIN SIDEBAR   左边导航 start-->
		<!--#include file="sidebar.jsp"-->
		<%@include file="sidebar.jsp"%>
		<!-- END SIDEBAR 左边导航 end-->

		<!-- BEGIN PAGE -->

		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->

			<div class="container-fluid">

				<!-- BEGIN PAGE HEADER-->

				<div class="row-fluid">
					<div class="span12">

						<!-- BEGIN STYLE CUSTOMIZER @义飞 class="logoutbox"-->
						<h3 class="page-title">
							项目报表 <small></small>
						</h3>

					</div>
				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->
				<div class="row-fluid">
					<div id="searchbox" class="span11 offset1"></div>
				</div>
				<div class="row-fluid">
					<div class="span6 offset1 databtnlist">
						<button type="button" class="btn green " id="btnsearch">搜索</button>
						<button type="button" class="btn red" id="btnclear">清除</button>
						<button type="button" class="btn blue" data-toggle="modal"
							data-target="#myModal" id="btnset">设置筛选条件</button>
						<button type="button" class="btn green " id="exportexcel" >下载报表测试</button>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12 datacontainer">
						<table id="attachments-table"
							class="table table-bordered table-hover table-striped"
							cellspacing="0" width="100%">
							<thead>
								<tr>
									<th>项目编号</th>
									<th>项目名称</th>
									<th>项目状态</th>
									<th>合同数量</th>
									<th>需安装数量</th>
									<th>已安装数量</th>
									<th>安装率</th>
									<th>上线数量</th>
									<th>上线率</th>
									<th>验收数量</th>
									<th>验收率</th>
									<th>问题数量</th>
									<th>项目经理</th>
									<th>客户经理</th>
									<th>最后更新时间</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner">
			<!--2017 &copy; -->
		</div>
		<div class="footer-tools">
			<span class="go-top"> <i class="icon-angle-up"></i>
			</span>
		</div>
	</div>
	<!-- END FOOTER -->
	<!-- Modal -->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true"></button>
					<h4 class="modal-title" id="myModalLabel">设置筛选条件</h4>
				</div>
				<div class="modal-body searchcontainer">

					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="pro_id" operator="like">
							<div class="badge col-name">项目编号</div>
							<div class="width20">类似于</div>
							<div class="width40">
								<input type="text" value="" class="inputchar"
									class="m-wrap onlyNumAlpha" data-tabindex="1">
							</div>
						</div>
					</div>
					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="pro_name" operator="like">
							<div class="badge col-name">项目名称</div>
							<div class="width20">类似于</div>
							<div class="width40">
								<input type="text" value="" class="m-wrap" data-tabindex="2">
							</div>
						</div>
					</div>
					<!-- 上次更新时间 -->
					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="updated_at" operator=">">
							<div class="badge col-name">上次更新时间</div>
							<div class="width20">大于</div>
							<div class="width40">
								<select>
									<option value="一周">一周</option>
									<option value="二周">二周</option>
									<option value="一月">一月</option>
								</select>
							</div>
						</div>
					</div>
					<!-- row end -->
					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="problem_count" operator=">=">
							<div class="badge col-name">问题数量</div>
							<div class="width20">大于等于</div>
							<div class="width40">
								<input type="text" value="" class="m-wrap" data-tabindex="1">
							</div>
						</div>
					</div>
					<!-- row end -->
					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="pro_station" operator="=">
							<div class="badge col-name">项目状态</div>
							<div class="width20">等于</div>
							<div class="width40">
								<select id="selstatus">
								</select>
							</div>
						</div>
					</div>
					<!-- row end -->
					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="pro_check_per" operator="">
							<div class="badge col-name">安装率</div>
							<div class="width20">
								<select style="width: 70px" class="sel_op">
									<option value=">">大于</option>
									<option value="<=">小于等于</option>

								</select>
							</div>
							<div class="width40">
								<input type="number" min=0 max=100 style="width: 88%"
									class="inputper"> %
							</div>
						</div>
					</div>
					<!-- row end -->
					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="onlinne_number_per" operator="">
							<div class="badge col-name">上线率</div>
							<div class="width20">
								<select style="width: 70px" class="sel_op">
									<option value=">">大于</option>
									<option value="<=">小于等于</option>

								</select>
							</div>
							<div class="width40">
								<input type="number" min=0 max=100 style="width: 88%"
									class="inputper"> %
							</div>
						</div>
					</div>
					<!-- row end -->
					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="pro_already_per" operator="">
							<div class="badge col-name">验收率</div>
							<div class="width20">
								<select style="width: 70px" class="sel_op">
									<option value=">">大于</option>
									<option value="<=">小于等于</option>

								</select>
							</div>
							<div class="width40">
								<input type="number" style="width: 88%" class="inputper">
								%
							</div>
						</div>
					</div>
					<!-- row end -->
					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="pro_manager_pro" operator="like">
							<div class="badge col-name">项目经理</div>
							<div class="width20">类似于</div>
							<div class="width40">
								<input type="text" value="" class="m-wrap" data-tabindex="2">
							</div>
						</div>
					</div>
					<!-- row end -->
					<div class="row">
						<span class="span_chk"><input type="checkbox"></span>
						<div class="searchtxt" key="pro_manager_acc" operator="like">
							<div class="badge col-name">客户经理</div>
							<div class="width20">类似于</div>
							<div class="width40">
								<input type="text" value="" class="m-wrap" data-tabindex="2">
							</div>
						</div>
					</div>
					<!-- row end -->
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn blue" id="savesearch">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="close">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<script src="media/js/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="datatable/js/jquery.dataTables.js" type="text/javascript"></script>
	<script src="media/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="media/js/app.js"></script>
	<script src="media/js/json2.js"></script>
	
	<script>
		var oTable;
		var wher = new Array();
		
		$(document).ready(function() {
			App.init();
			$(".page-content").css("height", $(window).height());
				/*===datatable start====*/
				wher = [];
				loaddata();
				loadCombobox('selstatus', 'project');
				
				function loaddata() {
					oTable = $('#attachments-table').DataTable({
						searching : false,
						"processing" : false,		//DataTables载入数据时，是否显示‘进度’提示
						fixedColumns : true,
						"sScrollX" : "100%",		//DataTables的宽  
						"sScrollY" : "400px",   	//DataTables的高
						"scrollX" : true,
						"sScrollXInner" : "150%", 
						"bScrollCollapse" : true, 	//是否开启DataTables的高度自适应，当数据条数不够分页数据条数的时候，插件高度是否随数据条数而改变  
						"bPaginate" : true,			//是否显示（应用）分页器  
						"paging" : true,
						// serverSide: true,
						processing : true,
						order : [ [ 0, "asc" ] ],	//默认的排序方式，第1列，升序排列
						columns : [ // 获取属于该表的列的集合
									{ data : 'pro_id', name : '项目编号'},
									{ data : 'pro_name', name : '项目名称'},
									{ data : 'pro_station', name : '项目状态'},
									{ data : "pro_todal", name : '合同数量',
									  orderable : false, searchable : false,
									  defaultContent : ""},//此列默认值为""，以防数据中没有此值，DataTables加载数据的时候报错  
									{ data : 'pro_need', name : '需安装数量'},
									{ data : 'pro_already', name : '已安装数量'},
									{ data : 'pro_check_per', name : '安装率'},
									{ data : 'online_number', name : '上线数量'},
									{ data : 'onlinne_number_per', name : '上线率'},
									{ data : 'pro_check', name : '验收数量'},
									{ data : 'pro_already_per', name : '验收率'},
									{ data : 'problem_count', name : '问题数量'},
									{ data : 'pro_manager_pro', name : '项目经理'},
									{ data : 'pro_manager_acc', name : '客户经理'},
									{ data : 'updated_at', name : '最后更新时间'}
								  ],
						ajax : {
								url : domainName + "/hdk/api/custom",
								type : 'get',
								dataType : 'jsonp',
								contentType : 'application/json',
								data : { wher : JSON.stringify(wher), reportCustomCode : "REP_000002"}
						 	},
						"oLanguage" : {	//国际化配置  
										"sLengthMenu" : "每页显示 _MENU_条",
										"sZeroRecords" : "没有找到符合条件的数据",
										"sProcessing" : "",
										"sInfo" : "当前第 _START_ - _END_ 条　共计 _TOTAL_ 条",
										"sInfoEmpty" : "没有记录",
										"sInfoFiltered" : "(从 _MAX_ 条记录中过滤)",
										"sSearch" : "搜索：",
										"oPaginate" : {
										"sFirst" : "首页",
										"sPrevious" : "前一页",
										"sNext" : "后一页",
										"sLast" : "尾页"
									}
						}
				});
			}
				/*===datatable end====*/
				
				$("#savesearch").bind("click",function() {
					var searcharr = "";
					var result = true;
					$(".searchcontainer .span_chk").each(function(i) {
						if ($(this).find("input:checkbox").is(":checked")) {
							/*===验证 start===*/
							/*===验证 end===*/
						
							if ($(this).next(".searchtxt")
									.find("input[type='text'],input[type='number'],select").size() != 0) {
								$(this).next(".searchtxt")
									.find("input[type='text'],input[type='number'],select")
									.each(function(i) {
										var obj = $(this);
										obj.attr("value",obj.val());
								})
							}
							searcharr += $(this).next(".searchtxt").prop("outerHTML");
						}
					})
					if (!result) { return; }
					$("#searchbox").empty();
					$("#searchbox").append(searcharr);
					$("#searchbox select").each(function(i) {
						$(this).val($(this).attr("value"));
					})
					$("#close").trigger("click");
				})
				
				$("#btnsearch").bind("click",function() {
					
					wher = [];
					$("#searchbox .searchtxt").each(function(i) {
						var key = $(this).attr("key");
						var value = $(this).find("input,select").val();
						var operator = $(this).attr("operator");
						if (operator == "like") {
							value = "%" + value + "%"
						}
						if (operator == "") {
							operator = $(this).find(".sel_op").val();
							value = $(this).find("input").val();
						}
						if (value != "") {
							wher.push({
										"key" : key,
										"value" : value,
										"operator" : operator
									});
						}
					})
					console.log(wher);
					oTable.destroy();
					loaddata();
				})
							
				$("#btnclear").bind("click", function() {
					$(".searchtxt").find("input,select").val("");
				})
				$("#btnset").bind("click", function() {
					$("#myModal .searchtxt").find("input").val("");
				})
				/*===报表end===*/
				$("#exportexcel").on("click",function() {
					flag = confirm("确认下载报表? ");
					if(flag == true){
						$("#searchbox .searchtxt").each(function(i) {
							var key = $(this).attr("key");
							var value = $(this).find("input,select").val();
							var operator = $(this).attr("operator");
							if (operator == "like") {
								value = "%" + value + "%"
							}
							if (operator == "") {
								operator = $(this).find(".sel_op").val();
								value = $(this).find("input").val();
							}
							if (value != "") {
								wher.push({
											"key" : key,
											"value" : value,
											"operator" : operator
										});
							}
						});
						tmp = JSON.stringify(wher);
						tmp = encodeURIComponent(tmp); //可把字符串作为URI 组件进行编码。其返回值URIstring 的副本，其中的某些字符将被十六进制的转义序列进行替换。
			// 			后台返回 HSSFWorkbook 内存中的内容，以流方式回写， 即可实现下载
						window.location.href = domainName +"/hdk/api/export?reportCustomCode=REP_000002&wher="+ tmp
// 						 $.ajax({
// 							url : domainName + "/hdk/api/export",
// 							type : 'get',
// 							dataType : 'jsonp',
// 							contentType : 'application/json',
// 							data : { wher : JSON.stringify(wher), reportCustomCode : "REP_000002"},
// 						});
					}
				});
		});
	</script>
	
	<!-- <script>
	$("#exportexcel").on("click",function() {
		console.log("123");
		flag = confirm("请确认下载报表！");
		if(flag == true){
			wher = [];
			$("#searchbox .searchtxt").each(function(i) {
				var key = $(this).attr("key");
				var value = $(this).find("input,select").val();
				var operator = $(this).attr("operator");
				if (operator == "like") {
					value = "%" + value + "%"
				}
				if (operator == "") {
					operator = $(this).find(".sel_op").val();
					value = $(this).find("input").val();
				}
				if (value != "") {
					wher.push({
								"key" : key,
								"value" : value,
								"operator" : operator
							});
				}
			});
// 			后台返回 HSSFWorkbook 内存中的内容，以流方式回写， 即可实现下载
			window.location.href = domainName +"/hdk/api/export?wher="+ JSON.stringify(wher)
				+ "&reportCustomCode=REP_000002";				
		}
		
		
		
		/* $.ajax({
			url : domainName + "/hdk/api/export",
			type : 'get',
			dataType : 'jsonp',
			contentType : 'application/json',
			data : { wher : JSON.stringify(wher), reportCustomCode : "REP_000002"},
			success : function(data){
			}
		}) */
	});
	</script> -->
</body>
</html>