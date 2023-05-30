<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html>
<head>
<title>MeowMeow Gift Shop</title>
<link rel="icon" href="<c:url value="/template/user/images/logo.ico"/>" type="image/icon type">
<link href="<c:url value='/template/user/css/bootstrap.css?some_var_to_bust_cache=2431105'/> " rel='stylesheet' type='text/css' />
<%-- <link href="<c:url value='/template/user/css/popup.css'/> " rel='stylesheet' type='text/css' /> --%>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<c:url value='/template/user/js/jquery.min.js'/> "></script>
<!-- Custom Theme files -->
<link href="<c:url value='/template/user/css/style.css?some_var_to_bust_cache=2431105'/> " rel="stylesheet" type="text/css" media="all" />
<link href="<c:url value='/template/user/css/component.css?some_var_to_bust_cache=2431105'/> " rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Eshop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<!-- for bootstrap working -->
<script type="text/javascript" src="<c:url value='/template/user/js/bootstrap-3.1.1.min.js'/> "></script>
<!-- //for bootstrap working -->
<!-- cart -->
	<script type="text/javascript" src="<c:url value='/template/user/js/simpleCart.min.js'/> "></script>
<!-- cart -->
<link rel="stylesheet" href="<c:url value='/template/user/css/flexslider.css?some_var_to_bust_cache=2431105' />" type="text/css" media="screen" />
<link rel="stylesheet" href="<c:url value='/template/user/css/check.css' />" type="text/css"  />

<!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
<script src="<c:url value='/template/user/js/platform.js'/>"></script>

	<dec:head/>
</head>



<body>
	<%@ include file="/common/user/header.jsp" %>
	<dec:body/>
 	
 	<%@ include file ="/common/user/footer.jsp" %>
	 <!-- Bootstrap core JavaScript -->
  
 	<dec:getProperty property="page.script"></dec:getProperty>

</body>

</html>	