<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="io.github.gdggarage.worldproblems.ProblemsApi" %>
<%
ProblemsApi api = new ProblemsApi();
api.init();
%>
<!DOCTYPE HTML>
<html>
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
  <title>WorldProblems</title>
  <link rel="stylesheet" href="style.css" type="text/css" media="screen">
  <link rel="stylesheet" href="animate.css" type="text/css" media="screen">
</head>
<body>
  <div class="first-world problem">
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
  <div class="separator">
    <div class="button animated">
      <a id="reload-button" href="index.html">RELOAD</a>
    </div>
  </div>
  <div class="third-world problem">
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
<script type="application/dart" src="world_problems.dart"></script>
<script src="packages/browser/dart.js"></script>
</body>
</html>
