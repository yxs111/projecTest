<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>城建教育</title>

		<!-- Bootstrap -->
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

		<!--[if lt IE 9]>
      	<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    	<![endif]-->

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

		<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/confirm.js"></script>
		<script type="text/javascript">
		function showAddPage(){
			location.href="${pageContext.request.contextPath}/user/insertUser";
		}
		function delSpeakerById(Obj,id,name){
		
		 Confirm.show('温馨提示：', '确定要删除'+name+'么？', {
                'Delete': {
                    'primary': true,
                    'callback': function() {
                    	var param={"id":id};
                    	$.post("${pageContext.request.contextPath}/user/delUserById",param,function(data){
                    		if(data=='success'){
                    		 Confirm.show('温馨提示：', '删除成功');
                    		 $(Obj).parent().parent().remove();
                    		}else{
                    		 Confirm.show('温馨提示：', '操作失败');
                    		}
                    	});
                    }
                }
            });
		}
		</script>
		<style type="text/css">
    	  th{
    	  	 text-align: center;
    	  }
        </style>
	</head>

	<body>
		<nav class="navbar-inverse">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">

				<a class="navbar-brand" href="${pageContext.request.contextPath}/video/videoList.action">视频管理系统</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-9">
				<ul class="nav navbar-nav">
					<li ><a href="${pageContext.request.contextPath}/video/list">视频管理</a></li>
					<li ><a href="${pageContext.request.contextPath}/speaker/list">主讲人管理</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/course/list">用户管理</a></li>


				</ul>
				<p class="navbar-text navbar-right">
					<span>${sessionScope.userName}</span> <i class="glyphicon glyphicon-log-in"
						aria-hidden="true"></i>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/showLogin"
						class="navbar-link">退出</a>
				</p>
			</div>
			<!-- /.navbar-collapse -->


		</div>
		<!-- /.container-fluid -->
	 </nav>
    
    <div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
	  <div class="container">
	          <h2>用户管理</h2>
	  </div>
	</div>
	
	
	<div class="container">
		
	    
	    <button onclick="showAddPage()" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		      添加
		</button>
		
	</div>
	
	<div class="container" style="margin-top: 20px;">
		
		<table class="table table-bordered table-hover" 
		   style="text-align: center;table-layout:fixed;">
      <thead >
        <tr class="active">
          <th>序号</th>
          <th>账户</th>
			<th>密码</th>
			<th>姓名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>手机</th>




          <%--<th style="width:60%;">简介</th>--%>
          <th>编辑</th>
          <th>删除</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${users}" var="user" varStatus="status">
            <tr>
	          <td>${status.index+1}</td>
	          <td>${user.account}</td>
				<td>${user.password}</td>
				<td>${user.username}</td>
				<td>${user.sex}</td>
				<td>${user.age}</td>
				<td>${user.phone}</td>


	          <%--<td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${course.courseDesc}</td>--%>
	          <td><a href="${pageContext.request.contextPath}/user/updateUser?id=${user.id}"><span class="glyphicon glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>
	          <td><a href="#" onclick="return delSpeakerById(this,'${user.id}','${user.account}')"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
           </tr>
        
        </c:forEach>
        
        
        </tbody>
      </table>
	</div>
	<div class="container">
		<div class="navbar-right">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<li>
						<a href="${pageContext.request.contextPath}/course/list?page=${pageInfo.prePage}&pageSize=${pageInfo.pageSize}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum" >
						<li><a href="${pageContext.request.contextPath}/course/list?page=${pageNum}&pageSize=${pageInfo.pageSize}">${pageNum}</a></li>
					</c:forEach>


					<li>
						<a href="${pageContext.request.contextPath}/course/list?page=${pageInfo.nextPage}&pageSize=${pageInfo.pageSize}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
  </body>

</html>