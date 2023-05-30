<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="registration-form">
	<div class="container">
		<div class="dreamcrub">
			<ul class="breadcrumbs">
				<li class="home"><a href="<c:url value='/trang-chu'/> "
					title="Go to Home Page">Trang chủ</a>&nbsp; <span>&gt;</span></li>
				<li>Đăng ký</li>
			</ul>
			<ul class="previous">
				<li><button onclick="backButton()">Trở về trang trước</button></li>
				<script>
					function backButton() {
						window.history.back();
					}
				</script>
			</ul>
			<div class="clearfix"></div>
		</div>
		<%-- <c:if test="${error != null}">
			<div>
				<h1 style="color: red">${error}</h1>
			</div>
		</c:if> --%>
		<div class="registration-grids">
			<h3 class="head text-center" style="margin-bottom: 30px;">ĐĂNG
				KÝ</h3>
			<p class="text-center">Đăng nhập để có thể mua sắm tại
				MeowMeowShop</p>
			<p class="text-center">
				Nếu bạn đã có tài khoản, bạn có thể <a
					href="<c:url value='/login'/>"> đăng nhập </a> tại</a>
			</p>

			<div class="reg">
				<form:form action="register" method="POST" modelAttribute="user">
					<div class="reg-form">
						<ul>
							<li class="text-info">Họ tên khách hàng:</li>
							<li><form:input type="text" path="full_name" /></li>

						</ul>
						<ul>
							<li class="text-info">Giới tính:</li>
							<li><form:radiobutton path="id_gender" value="1" label="Nam" checked="checked"/>
								<form:radiobutton path="id_gender" value="2" label="Nữ" /></li>
						</ul>

						<ul>
							<li class="text-info">Ngày tháng năm sinh:</li>
							<li><form:input type="date" path="birthdate" value="2002-01-01"/></li>

						</ul>


						<ul>
							<li class="text-info">Email:</li>
							<li><form:input type="text" path="email" placeholder="you@gmail.com"/></li>
						</ul>
						<ul>
							<li class="text-info">Số điện thoại:</li>
							<li><form:input type="text" path="phone"  placeholder="không bắt buộc"/></li>
						</ul>
					</div>
					<div class="reg-right">
						<%-- <ul>
							<li class="text-info">Địa chỉ:</li>
							<li><form:input type="text" path="id_address" /></li>
						</ul> --%>
						<ul>
							<li class="text-info">Tên đăng nhập:</li>
							<li><form:input type="text" path="login_name" /></li>
						</ul>
						<ul>
							<li class="text-info">Mật khẩu:</li>
							<li><form:input type="password" path="hashed_passwd" /></li>
						</ul>
					</div>
					<div class="col-sm-12">
					<input type="submit" value="Đăng ký">
						<p class="click">
							Bằng cách nhấn vào nút đăng ký, bạ đồng ý với điều khoản của
							chúng tôi</a>
						</p>
					</div>
					<div class="col-sm-12">
					
						<c:if test="${error != null}">
							<div class="alert alert-danger col-xs-offset-1 col-xs-10">
								${error}</div>
						</c:if>
					</div>
				</form:form>

			</div>
			
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- registration-form -->
