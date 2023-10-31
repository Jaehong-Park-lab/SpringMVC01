<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>Panel Footer</h2>
		<div class="panel panel-default">
			<div class="panel-heading">스프링 수정화면</div>
			<div class="panel-body">
				<form action="../boardUpdate.do" method="post">
					<input type="hidden" name="idx" value="${vo.idx}" />
					<table class="table table-bordered">
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" class="form-control" value="${vo.title}"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="7" class="form-control" name="content">${vo.content}</textarea></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" class="form-control" value="${vo.writer}" readonly="readonly"/></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<button type="submit" class="btn btn-primary btn-sm">수정</button>
							<button type="reset" class="btn btn-warning btn-sm">취소</button>
							<button type="button" class="btn btn-info btn-sm" onclick="location.href='boardList.do'">목록</button>
						</td>
					</tr>
				</table>
			</form>
			</div>
			<div class="panel-footer></div>
		</div>
	</div>
</body>
</html>