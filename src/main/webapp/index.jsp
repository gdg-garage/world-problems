<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="io.github.gdggarage.worldproblems.ProblemsWorker" %>
<%
ProblemsWorker api = new ProblemsWorker();
%>
<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="HandheldFriendly" content="true" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>WorldProblems &mdash; a GDG Garage project</title>
  <!-- 
      Oh hai. This is a GDG Garage project.

      This was put together in a joint effort by the following people:

        David Vavra, backend, Java + Cloud Endpoints
        Jirka Penzes, frontend, Dart
        Sindri Avaruus, frontend, HTML/CSS
        Vit Pleskot, backend, Java + Cloud Endpoints
        Filip Hracek, frontend, Dart + HTML/CSS

      The project was a way for us to try out new things, in true
      GDG Garage spirit.

      Code: https://github.com/gdg-garage/world-problems
      GDG Garage site: http://gdg-garage.github.io/
  -->
  <link rel="stylesheet" href="style.css" type="text/css" media="screen">
  <link rel="stylesheet" href="animate.css" type="text/css" media="screen">
</head>
<body>
  <div class="first-world problem">
    <div class="problem-wrapper">
      <p class="title">#<span>first</span>worldproblem</p>
      <p class="text">
        <%= api.first().getText() %>
      </p>
      <p class="problem-footer">
        <span class="author">
          &mdash; <%= api.first().getAuthor() %>
        </span>
        <span class="source">
          <a class="url" href="<%= api.first().getUrl() %>"><%= api.first().getSource() %></a>
        </span>
      </p>
    </div>
  </div>
  <div class="separator">
    <a id="reload-button" href="index.html">
      <div class="button animated">
        <img src="world-problems.png" alt="RELOAD" />
      </div>
    </a>
  </div>
  <div class="third-world problem">
    <div class="problem-wrapper">
      <p class="title">#<span>third</span>worldproblem</p>
      <p class="text">
        <%= api.third().getText() %>
      </p>
      <p class="problem-footer">
        <span class="author">
          &mdash; <%= api.third().getAuthor() %>
        </span>
        <span class="source">
          <a class="url" href="<%= api.third().getUrl() %>"><%= api.first().getSource() %></a>
        </span>
      </p>
    </div>
  </div>
<script type="application/dart" src="world_problems.dart"></script>
<script src="packages/browser/dart.js"></script>
</body>
</html>
