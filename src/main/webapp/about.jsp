<%@ page import="com.calanco.watchandlearn.adapters.UserAdapter" %>
<%@ page import="com.calanco.watchandlearn.adapters.FilmAdapter" %>
<%@ page import="com.calanco.watchandlearn.Models.Task" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: yaidf
  Date: 13.12.2023
  Time: 18:44
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <%!UserAdapter userAdapter = new UserAdapter();%>
    <%!FilmAdapter filmAdapter = new FilmAdapter();%>
    <%ArrayList<Task> tasks = filmAdapter.getTasksById(request.getParameter("id"));%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.118.2">
    <title>About</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link href="https://vjs.zencdn.net/7.8.4/video-js.css" rel="stylesheet">
    <style>
        <jsp:include page="css/headers.css"/>
        <jsp:include page="css/min.css"/>
        <jsp:include page="css/modals.css"/>
        <jsp:include page="css/watch.css"/>
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<h1>Сервис создан как курсовая рабата в рамках курса Технологии Програграммирования университета ГУАП 2023</h1>
<h3>Трофимов Андрей 2154<a href="vk.com/kalanod">vk.com/kalanod</a></h3>
<h3>Песецкий михаил 2154</h3>
<script><jsp:include page="js/jquery-3.7.1.min.js"/>
<jsp:include page="js/bootstrap.bundle.min.js"/>
<jsp:include page="js/color-modes.js"/>
<jsp:include page="js/watch.js"/>
</script>
</body>
</html>
