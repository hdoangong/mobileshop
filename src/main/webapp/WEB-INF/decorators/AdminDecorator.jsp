<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Admin</title>
<link rel="stylesheet"
	href="<c:url value="/resources/templates/admin/main.css" />" />
<script
	src="<c:url value="/resources/templates/admin/jquery-1.12.4.min.js" />"></script>

<style>
	.btn-hover {
		cursor: pointer;
	}
</style>
</head>

<body>
	<div
		class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
		<%-- <%@ include file="../common/admin/header.jsp"%>  --%>
		<div class="app-main" style="padding-top: 0px;">
			<%@ include file="../common/admin/menu.jsp"%>
			<div class="app-main__outer">
				<div class="app-main__inner">
					<div class="">
						<div class="page-title-wrapper">
							<sitemesh:write property="body" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../common/admin/footer.jsp"%>
	</div>
	<script type="text/javascript"
		src="<c:url value="/resources/templates/admin/main.js" />"></script>
		
	<script type="text/javascript"
		src="<c:url value="/resources/js/user/index.js" />"></script>
</body>

</html>

