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
<title>MyLikeReviewList.jsp</title>
<link href="<%=cp%>/css/header.css" rel="stylesheet">
<!-- 모달 추가 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 부트스트랩 탭 설정 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<style type="text/css">
	#content
	{
		margin: 0 auto;
		text-align: center;
		width: 1300px;
	}
	#textbox
	{
		font-size: 50px;
		text-align: center;
	}
	th
	{
		background-color: #eeeeee;
		text-align: center;
	}
	.pull-right
	{
		margin: 0 auto;
		text-align: center;
	}
</style>
<script type="text/javascript">

	// 페이지 번호만 속성값으로 가지도록 <a> 태그가 작동하지 못하도록 처리
	//-- 실제 페이지를 클릭하면 동작하는 부분은 <form> 태그를 이용해 처리함
	$(document).ready(function()
	{
		var reportForm = $("#reportForm");
		
		$(".paginate_button a").on("click", function(e)
		{
			// <a> 태그 선택해도 페이지 이동 없도록 처리
			e.preventDefault();
			
			// <form> 태그 내 pageNum 속성 값은 href 속성값(클릭한 페이지 번호)으로 변경
			reportForm.find("input[name='pageNum']").val($(this).attr("href"));
			reportForm.submit();
		});
	});


</script>
</head>
<body>
<!-- 헤더 추가 -->
<div>
	<c:import url="/WEB-INF/views/main/header.jsp"></c:import>
</div>

<div id="textbox">
	<hr>
	<h3>내가 좋아요한 리뷰</h3>
</div>
<br><br><br>

<div class="container">
	<div class="row">
		<table class="table table-hover" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th>번호</th>
					<th>공연명</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<!-- c:foreach문으로 리스트 반복 뿌려주기 -->
			<c:forEach var="review" items="${likeList }">
			<tr>	
				<td>${review.bno }</td>
				<td>${review.play_nm }</td>
				<td><a href="playreviewdetail.action?playrev_cd=${review.playrev_cd }&play_cd=${review.play_cd }">${review.title }</a></td>
				<td>${review.user_nick }</td>
				<td>${review.playrev_dt }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>

		<!--  페이징 추가 -->
		<div class="pull-right">
			<ul class="pagination">
			<c:if test="${likePageMaker.prev }">
				<li class="paginate_button previous"><a href="${likePageMaker.startPage-1 }">Previous</a>
				</li>
			</c:if>
			
			<c:forEach var="num" begin="${likePageMaker.startPage }" end="${likePageMaker.endPage }">
				<li class="paginate_button"><a href="${num }">${num }</a></li>
			</c:forEach>
			
			<c:if test="${likePageMaker.next }">
				<li class="paginate_button next"><a href="${likePageMaker.endPage+1 }">Next</a></li>
			</c:if>
			</ul>
		</div><!-- close .pull-right -->
		<!-- 페이지 번호 클릭시 이동을 위한 hidden form 구성 -->
		<form id="likeForm" action="mylikecommentreviewlist.action" method="get">
			<input type="hidden" name="pageNum" value="${likePageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${likePageMaker.cri.amount }">
		</form>
	</div><!-- row -->
	<div>
		<button type="button" class="btn btn-info" onclick="location='mycommentreviewlist.action'">내가 댓글 단 리뷰 리스트</button>
	</div>
</div><!-- container -->


<br><br><br><br>
</body>
</html>