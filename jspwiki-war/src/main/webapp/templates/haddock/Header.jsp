<%--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
--%>

<%@ taglib uri="http://jspwiki.apache.org/tags" prefix="wiki" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="org.apache.wiki.*" %>
<fmt:setLocale value="${prefs.Language}" />
<fmt:setBundle basename="templates.default"/>
<%
  WikiContext c = WikiContext.findContext(pageContext);
  String frontpage = c.getEngine().getFrontPage();
%>

<wiki:Plugin plugin="IfPlugin" args="page='TitleBox' contains='\\\\S' " >[{InsertPage page=TitleBox class=titlebox }]</wiki:Plugin>

<div class="header">

  <div class="topline">

    <span class="cage pull-left">
    <a class="logo pull-left"
       href="<wiki:Link page='<%=frontpage%>' format='url' />"
       title="<fmt:message key='actions.home.title' ><fmt:param><%=frontpage%></fmt:param></fmt:message> ">apache<b>jsp&#x03C9;iki</b></a>

        <wiki:PageExists page="LogoMenu">
        <ul class="dropdown-menu" data-hover-parent=".cage"  style="color:black;">
          <li class="logo-menu"><wiki:InsertPage page="LogoMenu" /></li>
        </ul>
        </wiki:PageExists>
    </span>

    <wiki:Include page="UserBox.jsp" />
    <wiki:Include page="SearchBox.jsp" />

  </div>

  <div class="pagename">
    <wiki:CheckRequestContext context='view'><wiki:PageName /></wiki:CheckRequestContext>
    <wiki:CheckRequestContext context='!view'><wiki:Link><wiki:PageName/></wiki:Link></wiki:CheckRequestContext>
  </div>

  <div class="breadcrumb">
    <fmt:message key="header.yourtrail"/><wiki:Breadcrumbs separator="<span class='divider'></span>" />
  </div>

</div>