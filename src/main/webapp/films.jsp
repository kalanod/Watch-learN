<%--
  Created by IntelliJ IDEA.
  User: yaidf
  Date: 08.12.2023
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.calanco.watchandlearn.adapters.UserAdapter" %>
<%@ page import="com.calanco.watchandlearn.Models.User" %>
<%@ page import="com.calanco.watchandlearn.adapters.FilmAdapter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.calanco.watchandlearn.Models.Film" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <%!UserAdapter userAdapter = new UserAdapter();%>
    <%!FilmAdapter filmAdapter = new FilmAdapter();%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <style>
        <jsp:include page="css/headers.css"/>
        <jsp:include page="css/min.css"/>
        <jsp:include page="css/modals.css"/>
        <jsp:include page="css/films.css"/>
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<%
    String typ;
    switch (request.getParameter("type")) {
        case "films":
            typ = "Фильмы";
            break;
        case "mult":
            typ = "Сериалы";
            break;
        case "comleted":
            typ = "Просмотрено";
            break;
        case "onLearn":
            typ = "Смотрю";
            break;
        default:
            typ = "Список";
    }%>
<H1 style="margin-left: 150px"><%=typ%></H1>
<hr class="my-4">
<% int pageN;
    int itemsOnPage = 15;
    if (request.getParameter("page") == null) {
        pageN = 0;
    } else {
        pageN = Integer.parseInt(request.getParameter("page"));
    }
    ArrayList<Film> films=null;
    if (request.getParameter("type").equals("completed")){
        films = filmAdapter.getFilmsById(userAdapter.getWatched((User) request.getSession().getAttribute("User")));
    }else {
        films = filmAdapter.getFilms(
                request.getParameter("type"),
                pageN * itemsOnPage,
                itemsOnPage);
    }
    for (int i = 0;
         i < films.size();
         i++) {
%>
<a href="<%=request.getContextPath()+"/watch?id=" + films.get(i).getId()%>" style="text-decoration: 0">
    <div class="film-card">
        <div class="img-overlay-wrap" style="width: 18rem;height: 9rem;">
            <img src="<%=films.get(i).getIcnSrc()%>" class="card-img" style="width: 100%;height: 100%;"
                 alt="...">
            <img class="img-overlay-wrap-svg" src='logo/play.svg' alt="..."/>
        </div>
        <div class="t" style="display: inline-block">
            <p class="t"><%=films.get(i).getTitle()%>
            </p>
        </div>
    </div>
</a>
<%}%>
<nav aria-label="Page navigation example">
    <ul class="pagination  justify-content-center">
        <% int i = 0;

            if (filmAdapter.getFilmsCount() > itemsOnPage) {
                if (pageN != 0) { %>
        <li class="page-item"><a class="page-link"
                                 href="<%=request.getContextPath()+"/films?page="+(pageN-1)+"&type="+request.getParameter("type")%>">Previous</a>
        </li>
        <%
            }
            for (i = Math.max(0, pageN * itemsOnPage - 5 * itemsOnPage);
                 i < filmAdapter.getFilmsCount() && i < 9 * itemsOnPage + Math.max(0, pageN * itemsOnPage - 5 * itemsOnPage);
                 i += itemsOnPage) {
                if (i / itemsOnPage != pageN) {
        %>
        <li class="page-item"><a class="page-link"
                                 href="<%=request.getContextPath()+"/films?page="+i/itemsOnPage+"&type="+request.getParameter("type")%>"><%=i / itemsOnPage%>
        </a></li>
        <%} else {%>
        <li class="page-item active" aria-current="page">
            <a class="page-link"
               href="<%=request.getContextPath()+"/films?page="+i/itemsOnPage+"&type="+request.getParameter("type")%>"><%=i / itemsOnPage %>
            </a>
        </li>
        <%
                    }
                }
            }
        %>


        <%if ((pageN + 1) * itemsOnPage < filmAdapter.getFilmsCount()) {%>
        <li class="page-item"><a class="page-link"
                                 href="<%=request.getContextPath()+"/films?page="+(pageN+1)+"&type="+request.getParameter("type")%>">Next</a>
        </li>
        <%}%>
    </ul>
</nav>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<script>
    <jsp:include page="js/jquery-3.7.1.min.js"/>
    <jsp:include page="js/bootstrap.bundle.min.js"/>
    <jsp:include page="js/color-modes.js"/>
    <jsp:include page="js/index.js"/>
</script>
</body>
</html>
