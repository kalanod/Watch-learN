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
    <div id="liveAlertPlaceholder"></div>
    <button type="button" class="btn btn-outline-primary" id="checkBtn">Проверить</button>
</div>
<div id="controlsBlock">
    <h3>s<%=filmAdapter.getFilmById(request.getParameter("id")).getSeason()%>
        ep<%=filmAdapter.getFilmById(request.getParameter("id")).getEpisode()%>
    </h3>
    <div class="list-group" style="overflow-y:scroll; height:400px;">
        <%
            ArrayList<Film> episodes = filmAdapter.getAllEpisodesById(request.getParameter("id"));
            for (int i = 0; i < episodes.size(); i++) {
                if (episodes.get(i).getId().toString().equals(request.getParameter("id"))) {
        %>
        <a href='<%=request.getContextPath() + "/watch?id=" + episodes.get(i).getId()%>' class="list-group-item list-group-item-action active" aria-current="true"
           aria-disabled="true">s<%=episodes.get(i).getSeason()%>
            ep<%=episodes.get(i).getEpisode()%> <%=episodes.get(i).getEpisodeTitle()%>
        </a>
        <%} else {%>
        <a href="<%=request.getContextPath() + "/watch?id=" + episodes.get(i).getId()%>" class="list-group-item list-group-item-action">s<%=episodes.get(i).getSeason()%>
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

<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
    <symbol id="check-circle-fill" viewBox="0 0 16 16">
        <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
    </symbol>
    <symbol id="info-fill" viewBox="0 0 16 16">
        <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
    </symbol>
    <symbol id="exclamation-triangle-fill" viewBox="0 0 16 16">
        <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
    </symbol>
</svg>
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
    var checkBtn = $("#checkBtn")
    var alertPlacer = $("#liveAlertPlaceholder")
    checkBtn.hide()
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


    const appendAlert = (message, type) => {
        const wrapper = document.createElement('div')
        wrapper.innerHTML = [
            '<div class="alert alert-' +type + 'alert-dismissible" role="alert">',
            '   <div>' + message +'</div>',
            '   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>',
            '</div>'
        ].join('')

        alertPlacer.append(wrapper)
    }


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
    checkBtn.click(function () {

        var re = 1;
        for (var i of tasks[currentTask]["answers"]){
            console.log(document.getElementById(i["title"]).checked, i["isCorrect"])
            if ((document.getElementById(i["title"]).checked && i["isCorrect"] === 0) ||
                (!document.getElementById(i["title"]).checked && i["isCorrect"] === 1)){
                re = 0;
            }
        }
        if (re === 1){
            appendAlert("верно", "success")
            return
        }
        appendAlert("не верно", "danger")

    })
    $("#toTask-btn").click(function () {
        video.pause();
        checkBtn.show()
        showTask(currentTask)
    });
    toVideoBtn.click(function () {
        $("#liveAlertPlaceholder").empty()
        checkBtn.hide()
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

