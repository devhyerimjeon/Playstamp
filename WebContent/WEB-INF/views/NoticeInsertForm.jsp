<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeInsertForm.jsp</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function()
	{
		$("#cancleBtn").click(function()
		{
			if (confirm("정말 글 작성을 취소하시겠습니까?"))
			{
				$(location).attr("href", "notice.action");
			}
			else
				return;
		});
	});
</script>
<style type="text/css">
	.btns { margin: auto; text-align: center;}
	.container { width:1300px;}

</style>
</head>
<body>
<div class="container">
	<h2>공지사항 관리</h2>
	<hr>
	<h4>공지사항 작성</h4>
	<hr>
	<form action="noticeinsert.action" method="post">
			<input type="hidden" id="notice_cd" name="notice_cd" value="${notice.notice_cd }">
		<div class="col-xs-4">
		  <input type="text" class="form-control" id="title" name="title" required="required">
		</div>
		<br><br>
		<hr>
		<div class="col-xs-12">
		  <textarea class="form-control" id="contents" name="contents" rows="10" required="required"></textarea>
		</div>
		<hr>
		<div class="btns">
			<button type="submit" class="btn btn-default" id="updateBtn">작성</button>
			<button type="button" class="btn btn-default" id="cancleBtn">취소</button>
		</div>
	</form>
</div>
</body>
</html>