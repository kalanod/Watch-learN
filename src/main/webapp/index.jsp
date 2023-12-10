<%@ page import="com.calanco.watchandlearn.adapters.UserAdapter" %>
<%@ page import="com.calanco.watchandlearn.Models.User" %>
<%@ page import="com.calanco.watchandlearn.adapters.FilmAdapter" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <%!UserAdapter userAdapter = new UserAdapter();%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.118.2">
    <title>WatchAndLearn</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <style>
        <jsp:include page="css/headers.css"/>
        <jsp:include page="css/min.css"/>
        <jsp:include page="css/modals.css"/>
        <jsp:include page="css/carusel.css"/>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .btn-bd-primary {
            --bd-violet-bg: #712cf9;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .bd-mode-toggle .dropdown-menu .active .bi {
            display: block !important;
        }
    </style>


</head>
<body>
<%@include file="header.jsp" %>
<H1>Рекомендации</H1>
<br>
<div id="carousel1" class="carousel slide">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carousel1" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>

        <% for (int i = 1; i * 4 < userAdapter.getRecomendatedFilms((User) request.getSession().getAttribute("User")).size(); i++) {%>
        <button type="button" data-bs-target="#carousel1" data-bs-slide-to="<%=i%>"
                aria-label="Slide <%=i + 1%>"></button>
        <%}%>
    </div>
    <div class="carousel-inner">
        <% for (int i = 0; i < userAdapter.getRecomendatedFilms((User) request.getSession().getAttribute("User")).size(); i++) {
            if (i == 0){%>
        <div class="carousel-item active">
            <div class="carousel-block">
                <%}
                else if (i % 4 == 0){%>
            </div>
        </div>
        <div class="carousel-item">
            <div class="carousel-block">
                <%}%>
                <a href='<%=request.getContextPath() + "/watch?id=" + userAdapter.getLastWatchedFilms((User) request.getSession().getAttribute("User")).get(i).getId()%>'>
                    <div class="card carusel-cart text-bg-dark">
                        <div class="img-overlay-wrap">
                            <img src="<%=userAdapter.getLastWatchedFilms((User) request.getSession().getAttribute("User")).get(i).getIcnSrc()%>" class="card-img" alt="...">
                            <img class="img-overlay-wrap-svg" src='logo/play.svg' alt="..."/>
                        </div>
                        <div class="card-img-overlay">
                            <p class="card-text"><%=userAdapter.getLastWatchedFilms((User) request.getSession().getAttribute("User")).get(i).getTitle()%></p>
                        </div>
                    </div>
                </a>
                <%}
                    if (userAdapter.getRecomendatedFilms((User) request.getSession().getAttribute("User")).size() != 0) { %>
            </div>
        </div>
        <%}%>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carousel1"
            data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carousel1"
            data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>
<H1>Продолжить просмотр</H1>
<br>
<div id="carousel2" class="carousel slide">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carousel2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>

        <% for (int i = 1; i * 4 <  userAdapter.getLastWatchedFilms((User) request.getSession().getAttribute("User")).size(); i++) {%>
        <button type="button" data-bs-target="#carousel2" data-bs-slide-to="<%=i%>"
                aria-label="Slide <%=i + 1%>"></button>
        <%}%>
    </div>
    <div class="carousel-inner">
        <% for (int i = 0; i < userAdapter.getLastWatchedFilms((User) request.getSession().getAttribute("User")).size(); i++) {
            if (i == 0){%>
        <div class="carousel-item active">
            <div class="carousel-block">
                <%}
                else if (i % 4 == 0){%>
            </div>
        </div>
        <div class="carousel-item">
            <div class="carousel-block">
                <%}%>
                <a href='<%=request.getContextPath() + "/watch?id=" + userAdapter.getLastWatchedFilms((User) request.getSession().getAttribute("User")).get(i).getId()%>'>
                <div class="card carusel-cart text-bg-dark">
                    <div class="img-overlay-wrap">
                    <img src="<%=userAdapter.getLastWatchedFilms((User) request.getSession().getAttribute("User")).get(i).getIcnSrc()%>" class="card-img" alt="...">
                    <img class="img-overlay-wrap-svg" src='logo/play.svg' alt="..."/>
                    </div>
                    <div class="card-img-overlay">
                        <p class="card-text"><%=userAdapter.getLastWatchedFilms((User) request.getSession().getAttribute("User")).get(i).getTitle()%></p>
                    </div>
                </div>
                </a>
                <%}
                    if (userAdapter.getLastWatchedFilms((User) request.getSession().getAttribute("User")).size() != 0) { %>
            </div>
        </div>
        <%}%>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carousel2"
            data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carousel2"
            data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


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
