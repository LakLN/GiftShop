<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html lang="en">

<head>
  	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Matrix lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Matrix admin lite design, Matrix admin lite dashboard bootstrap 5 dashboard template"
    />
    <meta
      name="description"
      content="Matrix Admin Lite Free Version is powerful and clean admin dashboard template, inpired from Bootstrap Framework"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Admin</title>
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value='/template/admin/images/bootstrap.favicon.png'/>"/>
    
    <!-- Custom CSS -->
    <link href="<c:url value='/template/admin/css/jquery.steps.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/template/admin/css/steps.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/template/admin/css/style.min.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/template/admin/css/multicheck.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/template/admin/css/dataTables.bootstrap4.css'/>" rel="stylesheet"/>
    
    
    <link href="<c:url value='/template/admin/css/themify-icons.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/template/admin/css/materialdesignicons.min.css'/>" rel="stylesheet"/>
    
    <!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" rel="stylesheet"/> -->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

<script src="<c:url value='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js'/>"></script>
    <script src="<c:url value='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js'/>"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> -->
    
</head>

<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>

	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5"
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">

		<%@ include file="/common/admin/header.jsp"%>

		<div class="page-wrapper">

			<dec:body />

			<%@ include file="/common/admin/footer.jsp"%>

		</div>
	</div>

	<script src="<c:url value='/template/admin/js/jquery.min.js'/>"></script>
	
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<c:url value='/template/admin/js/bootstrap.bundle.min.js'/>"></script>
    
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="<c:url value='/template/admin/js/perfect-scrollbar.jquery.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/sparkline.js'/>"></script>
    
    <!--Wave Effects -->
    <script src="<c:url value='/template/admin/js/waves.js'/>"></script>
    
    <!--Menu sidebar -->
    <script src="<c:url value='/template/admin/js/sidebarmenu.js'/>"></script>

    <!--Custom JavaScript -->
    <script src="<c:url value='/template/admin/js/custom.min.js'/>"></script>
    
    <!-- this page js -->
    <script src="<c:url value='/template/admin/js/jquery.steps.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/jquery.validate.min.js'/>"></script> 
    <script src="<c:url value='/template/admin/js/datatables.min.js'/>"></script>
    <script src="<c:url value='/template/admin/js/jquery.multicheck.js'/>"></script>
    <script src="<c:url value='/template/admin/js/datatable-checkbox-init.js'/>"></script>

</body>

</html>
    