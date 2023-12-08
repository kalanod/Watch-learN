<%@ page import="com.calanco.watchandlearn.adapters.UserAdapter" %>
<%@ page import="com.calanco.watchandlearn.adapters.FilmAdapter" %>
<%@ page import="com.calanco.watchandlearn.Models.User" %><%--
  Created by IntelliJ IDEA.
  User: yaidf
  Date: 08.12.2023
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%!UserAdapter userAdapter = new UserAdapter();%>
    <%!FilmAdapter filmAdapter = new FilmAdapter();%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.118.2">
    <title><%=filmAdapter.getFilmById(request.getParameter("id"))%></title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <style>
        <jsp:include page="css/headers.css"/>
        <jsp:include page="css/min.css"/>
        <jsp:include page="css/modals.css"/>
        <jsp:include page="css/watch.css"/>
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
<div class="dropdown position-fixed bottom-0 end-0 mb-3 me-3 bd-mode-toggle">
    <button class="btn btn-bd-primary py-2 dropdown-toggle d-flex align-items-center"
            id="bd-theme"
            type="button"
            aria-expanded="false"
            data-bs-toggle="dropdown"
            aria-label="Toggle theme (auto)">
        <svg class="bi my-1 theme-icon-active" width="1em" height="1em">
            <use href="#circle-half"></use>
        </svg>
        <span class="visually-hidden" id="bd-theme-text">Toggle theme</span>
    </button>
    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="bd-theme-text">
        <li>
            <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="light"
                    aria-pressed="false">
                <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                    <use href="#sun-fill"></use>
                </svg>
                Light
                <svg class="bi ms-auto d-none" width="1em" height="1em">
                    <use href="#check2"></use>
                </svg>
            </button>
        </li>
        <li>
            <button type="button" class="dropdown-item d-flex align-items-center" data-bs-theme-value="dark"
                    aria-pressed="false">
                <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                    <use href="#moon-stars-fill"></use>
                </svg>
                Dark
                <svg class="bi ms-auto d-none" width="1em" height="1em">
                    <use href="#check2"></use>
                </svg>
            </button>
        </li>
        <li>
            <button type="button" class="dropdown-item d-flex align-items-center active" data-bs-theme-value="auto"
                    aria-pressed="true">
                <svg class="bi me-2 opacity-50 theme-icon" width="1em" height="1em">
                    <use href="#circle-half"></use>
                </svg>
                Auto
                <svg class="bi ms-auto d-none" width="1em" height="1em">
                    <use href="#check2"></use>
                </svg>
            </button>
        </li>
    </ul>
</div>
<header class="p-3 mb-3 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                    <use xlink:href="#bootstrap"/>
                </svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="#" class="nav-link px-2 link-secondary">Overview</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Inventory</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Customers</a></li>
                <li><a href="#" class="nav-link px-2 link-body-emphasis">Products</a></li>
            </ul>

            <% if (userAdapter.isAuthorized((User) request.getSession().getAttribute("User"))){%>

            <div class="dropdown text-end" id="userBtn">
                <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    <img src="${sessionScope.User.imgSrc}" alt="mdo" width="32" height="32" class="rounded-circle">
                </a>
                <ul class="dropdown-menu text-small">
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/my">Профиль</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/tasks?type=onLearn">На изучении ${sessionScope.User.tasksOnWay}</a></li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}$/tasks?type=comleted">Изучено ${sessionScope.User.tasksCompleted}</a></li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/signOut" id="signOutBtn">Sign out</a></li>
                </ul>
            </div>
            <%}else {%>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#signUpForm"
                    id="signUpBtn">
                Sign-Up
            </button>
            <button type="button" class="btn btn-link" data-toggle="modal" data-target="#signInForm" id="signInBtn">
                Sign-In
            </button>
            <%}%>
        </div>
    </div>
</header>
<div id="videoBlock">
    <div id="progressBlock">

    </div>
</div>
<div id="controlsBlock">

</div>




<div class="modal fade" aria-hidden="true" tabindex="-1" aria-labelledby="signUpFormTitle" role="dialog"
     id="signUpForm">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2" id="signUpFormTitle">Sign up for free</h1>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control rounded-3" id="signUpName"
                               placeholder="bob">
                        <label for="signUpName">Name</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3" id="signUpEmail"
                               placeholder="name@calanco.com">
                        <label for="signUpEmail">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control rounded-3" id="signUpPassword"
                               placeholder="Password">
                        <label for="signUpPassword">Password</label>
                    </div>
                    <label for="exampleColorInput" class="form-label">Color picker</label>
                    <input type="color" class="form-control form-control-color" id="exampleColorInput" value="#563d7c" title="Choose your color">
                    <button id="signUpFormBtn" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button">Sign up</button>
                    <small class="text-body-secondary">By clicking Sign up, you agree to the terms of use.</small>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" aria-hidden="true" tabindex="-1" aria-labelledby="signInFormTitle" role="dialog"
     id="signInForm">
    <div class="modal-dialog" role="document">
        <div class="modal-content rounded-4 shadow">
            <div class="modal-header p-5 pb-4 border-bottom-0">
                <h1 class="fw-bold mb-0 fs-2" id="signInFormTitle">Sign in</h1>
                <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
                </button>
            </div>

            <div class="modal-body p-5 pt-0">
                <form class="">
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control rounded-3" id="signInEmail"
                               placeholder="name@example.com">
                        <label for="signInEmail">Email address</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control rounded-3" id="signInPassword"
                               placeholder="Password">
                        <label for="signInPassword">Password</label>
                    </div>
                    <button id="signInFormBtn" class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="button">Sign in</button>
                </form>
            </div>
        </div>
    </div>
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
