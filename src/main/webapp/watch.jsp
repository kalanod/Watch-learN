<%@ page import="com.calanco.watchandlearn.adapters.UserAdapter" %>
<%@ page import="com.calanco.watchandlearn.adapters.FilmAdapter" %>
<%@ page import="com.calanco.watchandlearn.Models.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.calanco.watchandlearn.Models.Film" %>
<%@ page import="com.calanco.watchandlearn.Models.Task" %>
<%@ page import="com.calanco.watchandlearn.Models.AnswerOpinion" %><%--
  Created by IntelliJ IDEA.
  User: yaidf
  Date: 08.12.2023
  Time: 13:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title><%=filmAdapter.getFilmById(request.getParameter("id"))%>
    </title>

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
<h2></h2>
<div class="videoBlock">
    <div id="progressBlock">
    </div>
    <h3 id="task-title"></h3>
    <video id="my-video" class="video-js" controls style="max-height: 100%; max-width: 100%"></video>
    <ul class="list-group taskE" id="task">
        <li class="list-group-item">
            <input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="firstRadio" checked>
            <label class="form-check-label" for="firstRadio">First radio</label>
        </li>
        <li class="list-group-item">
            <input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="secondRadio">
            <label class="form-check-label" for="secondRadio">Second radio</label>
        </li>
        <li class="list-group-item">
            <input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="thirdRadio">
            <label class="form-check-label" for="thirdRadio">Third radio</label>
        </li>
    </ul>
</div>
<div id="controlsBlock">
    <h3>s<%=filmAdapter.getFilmById(request.getParameter("id")).getSeason()%>
        ep<%=filmAdapter.getFilmById(request.getParameter("id")).getEpisode()%>
    </h3>
    <div class="list-group" style="overflow-y:scroll; height:400px;">
        <%
            ArrayList<Film> episodes = filmAdapter.getAllEpisodesById(request.getParameter("id"));
            for (int i = 0; i < episodes.size(); i++) {
                if (episodes.get(i).getId().equals(request.getParameter("id"))) {
        %>
        <a class="list-group-item list-group-item-action active" aria-current="true"
           aria-disabled="true">s<%=episodes.get(i).getSeason()%>
            ep<%=episodes.get(i).getEpisode()%> <%=episodes.get(i).getEpisodeTitle()%>
        </a>
        <%} else {%>
        <a href="#" class="list-group-item list-group-item-action">s<%=episodes.get(i).getSeason()%>
            ep<%=episodes.get(i).getEpisode()%> <%=episodes.get(i).getEpisodeTitle()%>
        </a>
        <%
                }
            }
        %>
    </div>
    <button type="button" class="btn btn-outline-primary" id="toTask-btn">К заданию</button>
    <button type="button" class="btn btn-outline-primary" id="toVideo-btn">Далее</button>

</div>
<h2><%=filmAdapter.getFilmById(request.getParameter("id")).getTitle()%>
    -<br> <%=filmAdapter.getFilmById(request.getParameter("id")).getEpisodeTitle()%>
</h2>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="https://vjs.zencdn.net/7.8.4/video.js"></script>
<script>
    var video = document.getElementById("my-video");
    var player = videojs('my-video');
    var tasks = [];
    player.src("<%=filmAdapter.getFilmUrlById(request.getParameter("id"))%>");
    $("#task").hide();
    var taskE = $(".taskE")
    var toVideoBtn = $("#toVideo-btn");
    toVideoBtn.hide();
    var taskTitle = $("#task-title");
    taskTitle.hide();
    var start = 0;
    <%for (int i = 0; i<tasks.size(); i++){%>
    tasks.push(<%=tasks.get(i)%>)
    <%}%>
    var currentTask = tasks.length > 0 ? 0 : -1;
    var currentTime;
    tasks.push({"posStart":  99999999999})
    player.on('timeupdate', function () {
        currentTime = player.currentTime()
        currentTask=0
        console.log(currentTask)
        for (var i = 0; i < tasks.length - 1; i++) {
            if (currentTime +1 >= tasks[i]["posStart"] && currentTime +1 < tasks[i + 1]["posStart"]) {
                currentTask = i;
                $("#toTask-btn").show()
                if (tasks[i]["isFinished"] === 0) {
                    video.pause();
                    showTask(i);
                }
            } else if (currentTime >= tasks[i]["posStart"] && currentTime < tasks[i + 1]["posStart"]) {
                currentTask = i + 1;
            }

        }
        if (currentTime > tasks[tasks.length - 2]["posStart"]) {
            $("#toTask-btn").hide()
        }
    });
    $("#toTask-btn").click(function () {
        video.pause();
        showTask(currentTask)
    });
    toVideoBtn.click(function () {
        console.log(currentTask)
        tasks[currentTask]["isFinished"] = 1;
        taskE.hide();
        $("#my-video").show();
        $("#task-title").hide();
        toVideoBtn.hide();
        $("#toTask-btn").show();
    });

    function showTask(i) {
        console.log("task number " + i);
        taskTitle.show();
        taskE.show(100);
        $("#my-video").hide();
        taskE.empty();
        taskTitle.empty();
        document.getElementById("task-title").innerHTML += tasks[i]["title"];
        for (var ans of tasks[i]["answers"]) {
            if (ans["isMultipleAnswers"] === 1) {
                document.getElementById("task").innerHTML +=
                    '<li class="list-group-item">' +
                    '<input class="form-check-input me-1" type="checkbox" value="" id="' + ans["title"] +'">' +
                    '<label class="form-check-label stretched-link" for="' + ans["title"] +'">' + ans["title"] +
                    '</label></li>';
            } else {
                document.getElementById("task").innerHTML +=
                    '<li class="list-group-item">' +
                    '<input class="form-check-input me-1" type="radio" name="listGroupRadio" value="" id="' + ans["title"] +'" checked>' +
                    '<label class="form-check-label stretched-link" for="' + ans["title"] +'">' + ans["title"] +
                    '</label></li>';
            }
        }
        toVideoBtn.show();
        $("#toTask-btn").hide();
    }

    <jsp:include page="js/jquery-3.7.1.min.js"/>
    <jsp:include page="js/bootstrap.bundle.min.js"/>
    <jsp:include page="js/color-modes.js"/>
    <jsp:include page="js/watch.js"/>
</script>
</body>
</html>

