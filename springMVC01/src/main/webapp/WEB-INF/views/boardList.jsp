<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>Panel Footer</h2>
		<div class="panel panel-default">
			<div class="panel-heading">스프링 리스트</div>
			<div class="panel-body">
				<table class="table table-bordered">
					<tr>
						<td>순번</td>
						<td>작성자</td>
						<td>내용</td>
						<td>작성자</td>
						<td>작성날짜</td>
					</tr>
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.idx}</td>
							<td><a href="boardContent.do?idx=${vo.idx}">${vo.title}</a></td>
							<td>${vo.content}</td>
							<td>${vo.writer}</td>
							<td>${fn:split(vo.indate, " ")[0]}</td>
							<td>${vo.count}</td>
						</tr>
					</c:forEach>
				</table>
				<!-- <button class="btn btn-primary btn-sm">글쓰기</button> -->
				<a href="boardForm.do" class="btn btn-primary btn-sm">글쓰기</a>
			</div>
			<div class="panel-footer">인프런_스프1탄_제레미</div>
		</div>
	</div>
</body>
</html>