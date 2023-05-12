<%--
  Created by IntelliJ IDEA.
  User: Бублик
  Date: 12.04.2023
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="domain.Laptop"%>
<%@ page import="domain.Product"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Rabbit</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="../jspf/nav-bar-lp.jsp" />

<div id="main">
    <aside class="leftAside">
        <h3>Список Ноутбуков</h3>
        <table>
            <thead>
            <tr>
                <th>Код</th>
                <th>Наименование модели</th>
                <th>Быстродействие процессора</th>
                <th>Объем оперативной памяти</th>
                <th>Объем памяти жесткого диска</th>
                <th>Тип cd-диска</th>
                <th>Цена</th>
                <th>Количество на складе</th>
                <th>Редактировать</th>
                <th>Удалить</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="lp" items="${laptopAll}">
                <tr>
                    <td>${lp.id}</td>
                    <td>${lp.model}</td>
                    <td>${lp.speed}</td>
                    <td>${lp.ram}</td>
                    <td>${lp.hd}</td>
                    <td>${lp.screen}</td>
                    <td>${lp.price}</td>
                    <td>${lp.count}</td>
                    <td><a href='<c:url value="/editLaptopServlet?id=${lp.id}" />'role="button" class="btn btn-outline-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg></a>  </td> 
                    <td><a href='<c:url value="/deleteLaptopServlet?id=${lp.id}"/>'  role="button" class="btn btn-outline-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
  <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
</svg> </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </aside>
    <section>
        <article>
            <h3>Данные по Ноутбуку</h3>
            <div class="text-article">
                <form method="POST" action="" id="edit_laptop" value="${laptopEdit[0].getModel()}">
                    <p>
                        <label for="model">Наименование модели</label>
                        <select id="model" name="model">
                            <%--<option disabled>Выберите модель</option>--%>
                            <c:forEach var="product" items="${products}">
                                <option value="${product}">
                                        ${product.model}
                                </option>
                            </c:forEach>
                        </select>
                    </p>
                    <p>
                        <label for="speed">Быстродействие процессора</label>
                        <input type="text" name="speed" id="speed" value="${laptopEdit[0].getSpeed()}"/>
                    </p>
                    <p>
                        <label for="ram">Объем оперативной памяти</label>
                        <input type="text" name="ram" id="ram" value="${laptopEdit[0].getRam()}"/>
                    </p>
                    <p>
                        <label for="hd">Объем памяти жесткого диска</label>
                        <input type="text" name="hd" id="hd" value="${laptopEdit[0].getHd()}"/>
                    </p>
                    <p>
                        <label for="screen">Диагональ экрана</label>
                        <input type="text" name="screen" id="screen" value="${laptopEdit[0].getScreen()}"/>
                    </p>
                    <p>
                        <label for="price">Цена</label>
                        <input type="text" name="price" id="price" value="${laptopEdit[0].getPrice()}"/>
                    </p>
                    <p>
                        <label for="count">Количество на складе</label>
                        <input type="text" name="count" id="count" value="${laptopEdit[0].getCount()}"/>
                    </p>
                    
                </form>
                <p>
                    <button type="submit" form="edit_laptop">Редактировать</button>
                </p>
            </div>
        </article>
    </section>
</div>
</body>
</html>