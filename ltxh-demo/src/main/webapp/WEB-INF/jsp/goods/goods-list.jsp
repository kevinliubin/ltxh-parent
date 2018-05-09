<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<!--[if lt IE 9]>
		<script type="text/javascript" src="lib/html5.js"></script>
		<script type="text/javascript" src="lib/respond.min.js"></script>
		<script type="text/javascript" src="lib/PIE_IE678.js"></script>
		<![endif]-->
		<link href="<%=basePath%>resources/common/css/H-ui.min.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>resources/common/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>resources/common/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>resources/common/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>resources/common/css/style.css"/>
		<!--[if IE 6]>
		<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
		<script>DD_belatedPNG.fix('*');</script>
		<![endif]-->
		<title>农业协会管理系统</title><link rel="shortcut icon" href="<%=basePath%>resources/web/images/icon.ico"/>
	</head>

	<body>
		<nav class="breadcrumb">
			<i class="Hui-iconfont">&#xe67f;</i> 首页
			<span class="c-gray en">&gt;</span> 基础管理
			<span class="c-gray en">&gt;</span> 供求列表
			<a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新">
				<i class="Hui-iconfont btn-refresh">&#xe68f;</i>
			</a>
		</nav>
        <div style="height:20px;"></div>
		<div class="pd-20">
			<!--会员列表 star-->
						<div class="cl pd-5 bg-1 bk-gray  mb-20">
							<span class="l">
								<a class="btn btn-primary radius" href="javascript:;" onclick="func_add_ac('发布供求','goods/addGoods.action','800','450')">
									<i class="Hui-iconfont">&#xe600;</i> 发布供求
								</a>
							</span>
						</div>
			<table class="table table-border table-bordered table-bg" id="table">
				<thead>
					<tr>
						<th scope="col" colspan="10" style="background-color: #FFFFFF;">
							<div class="text-c pd-20 cl f-14 font-w100">
								<form action="" method="post" id="search-box">
									<div class="row cl">
										<div class="col-2">
											供求标题:
											<input type="text" id="g_title" name="g_title" class="input-text" style="width: 150px;" value="${g_title}" />
										</div>
											<div class="col-1">
											<span class="select-box">
											<select name="g_type" id="g_type" class="select">
											            <option value="">全部</option>
														<option value="1">供应信息</option>
														<option value="2">求购信息</option>
														<option value="3">协会发布</option>
											</select>
											</span>
											</div>
										<div class="col-3">
											<button type="button" class="btn btn-success" onclick="search()" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
										</div>
									</div>
								</form>
							</div>
						</th>
					</tr>
					<tr>
						<th colspan="10">供求信息列表</th>
					</tr>
					<tr class="text-c">
						<th width="40">ID</th>
						<th width="100">供求标题</th>
						<th width="100">供求类型</th>
						<th width="80">发布人</th>
						<th width="100">品种</th>
						<th width="50">发布时间</th>
						<th width="100">联系电话</th>
						<th width="50">联系人</th>
						<th width="50">供求价格</th>
						<th width="200">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${pageBean.content }" varStatus="i" var="one">
				<tr class="text-c">
						<td>${i.index+1+pageBean.pageable.pageSize*(pageBean.pageable.pageNumber-1) }</td>
						<td>${one.g_title }</td>
						<td>
						<c:if test="${one.g_type == 1 }">供应信息</c:if>
						<c:if test="${one.g_type == 2 }">求购信息</c:if>
						<c:if test="${one.g_type == 3 }">协会发布</c:if>
						</td>
						<td>${one.username}</td>
						<td>${one.g_goods_type}</td>
						<td>${one.g_release_timef }</td>
						<td>${one.g_contact_phone}</td>
						<td>${one.g_contact_person }</td>
						<td>${one.g_goods_price }元</td>
						<td class="td-manage">
						    <a title="预览二维码" href="javascript:;" onClick="show_qr('${one.g_goods_ewm_path}')" class="pd-5"  style="text-decoration:none" >
								<i class="Hui-iconfont">&#xe665;</i>预览二维码
							</a>
							<a title="编辑" href="javascript:;" onClick="func_edit_ac('编辑供求','goods/editGoods.action?g_id=${one.g_id}','800','450')" class="pd-5"  style="text-decoration:none" >
								<i class="Hui-iconfont">&#xe6df;</i>编辑
							</a>
							<a class="pd-5" title="删除" href="javascript:;" onclick="one_del(this,'${one.g_id}')" class="ml-5" style="text-decoration:none">
								<i class="Hui-iconfont">&#xe6e2;</i>删除
							</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		<!--分页开始-->
		<jsp:include page="../common/pager.jsp"></jsp:include>
		 <!--分页结束-->
		</div>
		<script type="text/javascript" src="<%=basePath%>resources/common/lib/jquery/1.9.1/jquery.min.js"></script>
		<script src="<%=basePath %>resources/util/yeUtil.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="<%=basePath%>resources/common/lib/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>resources/common/lib/Validform/5.3.2/Validform.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>resources/common/lib/layer/1.9.3/layer.js"></script>
		<script type="text/javascript" src="<%=basePath%>resources/common/lib/icheck/jquery.icheck.min.js"></script>
		<script src="<%=basePath%>resources/common/lib/datatables/1.10.0/jquery.dataTables.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="<%=basePath%>resources/common/js/H-ui.js"></script>
		<script type="text/javascript" src="<%=basePath%>resources/common/js/H-ui.admin.js"></script>
		<!--商家管理js-->
	</body>
   <script type="text/javascript">
   $(function(){
	   $("#g_type").val('${g_type}');
   });
   
   //发布文章
   function releaseNews(news_id,state){
	   layer.confirm(state == 1 ? "确定要发布吗?":"确定要取消发布吗?",function(){
		  	$.post("news/releaseNews.action",{news_id:news_id,news_state:state},function(data){
		  	   	ajaxCallBack(data,reloadThis);
		  	   	},"text"); 
	      });  
       }
   
   	//删除活动--------------------------------------------start------------------------------------------------------
   	function one_del(obj,id){
   	layer.confirm("确定要删除吗?",function(){  	
   	$.post("goods/delGoods.action",{g_id:id},function(data){
   	ajaxCallBack(data,reloadThis);
   	},"text");
   	});
   	}
   	//--------------------------------------------------end--------------------------------------------------------
   	//新增活动链接-----------------------------------------start------------------------------------------------------------
   	function func_add_ac(title,url,w,h){
   	var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
   	}
   	//-------------------------------------------------end-------------------------------------------------------------
   	//编辑活动链接-----------------------------------------start------------------------------------------------------------
   	function func_edit_ac(title,url,w,h){
   	var index = layer.open({
			type: 2,
			title: title,
			content: url
		});
		layer.full(index);
   	}
   	//-------------------------------------------------end-------------------------------------------------------------
   	function show_qr(path){
   		if(!isnotnull(path)){
   			layer.msg("暂无数据");
   			return;
   		}
   		layer.open({
			type: 2,
			title: "",
			area:["130px","130px"],
			content: "<%=basePath%>upload/"+path
		});
   	}
   	
   </script>
   <script type="text/javascript" src="<%=basePath%>resources/util/pager.js"></script>
</html>