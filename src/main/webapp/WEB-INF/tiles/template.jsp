<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="css/head.css" />
<!-- 아이콘 사용 링크 -->
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css" />
</head>
<body>
	<!-- 헤더 -->
	<tiles:insertAttribute name="head"></tiles:insertAttribute>
	
	<!-- 바디 -->
	<tiles:insertAttribute name="body"></tiles:insertAttribute>


</body>
</html>

