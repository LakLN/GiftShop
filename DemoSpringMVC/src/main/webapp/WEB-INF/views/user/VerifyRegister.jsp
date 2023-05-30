<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="<c:url value='/template/admin/css/login.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link
	href="<c:url value='https://use.fontawesome.com/releases/v5.7.2/css/all.css'/>"
	rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3">
				<div class="panel border bg-white">
					<div class="panel-heading">
						<h1>${error}</h1>
						<h3 class="pt-3 font-weight-bold">Mã OTP đã được gửi đến ${Email}</h3>
					</div>
					<div class="panel-body p-3">
						<form action="${pageContext.request.contextPath}/sendMail"
							method="POST" >
							<div class="form-group py-2">
								<div class="input-field">
									<span class="far fa-user p-2"></span>
									<input name="OTP" type="text" class="form-control"
										placeholder="Mã OTP" required="" />
								</div>
							</div>
							
							 <div class="form-inline">
								 <a href="<c:url value='/verify'/>" id="forgot" class="font-weight-bold">Gửi lại OTP</a>
							</div> 
							<input class="btn btn-primary btn-block mt-3" type="submit"
								value="Xác thực">
							
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>