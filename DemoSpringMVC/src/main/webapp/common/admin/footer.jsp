<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${not empty Role }">
<c:if test="${Role= user}">
<footer class="footer text-center">
	<hr>
	Nhóm 11 CNPM
	<a href="https://www.facebook.com/profile.php?id=100009455116078">Team 2022</a>.
</footer>
</c:if>
</c:if>