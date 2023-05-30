<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<div class="row">
		<div class="offset-md-2 col-lg-5 col-md-7 offset-lg-4 offset-md-3">
			<div class="panel border bg-white">
				<div class="panel-heading">
				<h4>${error}</h4>
					<h3 class="pt-3 font-weight-bold">Login</h3>
				</div>
				<div class="panel-body p-3">
					<form:form action="${pageContext.request.contextPath}/loginAdmin" method="POST"  modelAttribute="user">
						<div class="form-group py-2">
							<div class="input-field">
								<span class="far fa-user p-2"></span> <form:input path="login_name" type="text" class="form-control" placeholder="Username" required="" />
							</div>
						</div>
						<div class="form-group py-1 pb-2">
							<div class="input-field">
								<span class="fas fa-lock px-2"></span> <form:input  path="hashed_passwd" type="password" class="form-control" placeholder="Password" required="" />
								<button class="btn bg-white text-muted">
									<span class="far fa-eye-slash"></span>
								</button>
							</div>
						</div>
						<div class="form-inline">
							<input type="checkbox" name="remember" id="remember"> <label
								for="remember" class="text-muted">Remember me</label> <a
								href="#" id="forgot" class="font-weight-bold">Forgot
								password?</a>
						</div>
						<input class="btn btn-primary btn-block mt-3" type="submit" value="Log in">
						<div class="text-center pt-4 text-muted">
							Don't have an account? <a href="#">Sign up</a>
						</div>
					</form:form>
				</div>
				<div class="mx-3 my-2 py-2 bordert">
					<div class="text-center py-3">
						<a href="https://wwww.facebook.com" target="_blank" class="px-2">
							<img
							src="https://www.dpreview.com/files/p/articles/4698742202/facebook.jpeg"
							alt="">
						</a> <a href="https://www.google.com" target="_blank" class="px-2">
							<img
							src="https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png"
							alt="">
						</a> <a href="https://www.github.com" target="_blank" class="px-2">
							<img
							src="https://www.freepnglogos.com/uploads/512x512-logo-png/512x512-logo-github-icon-35.png"
							alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>