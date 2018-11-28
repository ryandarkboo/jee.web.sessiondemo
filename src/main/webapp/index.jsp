<%@ page language="java" isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<body>
<h2>
<c:choose>
    <c:when test="${not empty cookie.userIdCookie}">Welcome back <c:out value="${cookie.userIdCookie.value}"/></c:when>
    <c:otherwise>Welcome</c:otherwise>
</c:choose>
</h2>
<table>
    <tr>
        <td>Hamburger</td>
        <td>
            <form action="${pageContext.servletContext.contextPath }/order-taker">
                <input name="orderItem" type="hidden" value="Hamburger">
                <input type="submit" value="Add"> 
            </form>
        </td>
    </tr>
    <tr>
        <td>French Fries</td>
        <td>
            <form action="${pageContext.servletContext.contextPath }/order-taker">
                <input name="orderItem" type="hidden" value="French Fries">
                <input type="submit" value="Add"> 
            </form>
        </td>
    </tr>
    <tr>
        <td>Soda</td>
        <td>
            <form action="${pageContext.servletContext.contextPath }/order-taker">
                <input name="orderItem" type="hidden" value="Soda">
                <input type="submit" value="Add"> 
            </form>
        </td>
    </tr>
</table>
<c:if test="${not empty orderItems}">
    <hr/>
    <div>
        <ul>
        <c:forEach items="${orderItems}" var="orderItem">
            <li><c:out value="${orderItem}"/>
        </c:forEach>
        </ul>
    </div>
</c:if>
</body>
</html>