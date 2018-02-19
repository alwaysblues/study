<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- cos.jar 라이브러리를 이용하여 파일 업로드 구현 enctype에 multipart/form=data을 입력 -->
<form action="fileFormOk.jsp" method="post" enctype="multipart/form=data">
file	:	<input type="file" name="file"><br>
<input type="submit" value="파일업로드"/>

</form>

</body>
</html>