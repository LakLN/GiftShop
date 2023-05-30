<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Checkout</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.3/examples/checkout/">

<!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
.bd-placeholder-img {
	font-size: 1.5rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">
	<div class="container">
		<div class="py-5 text-center">
			<h2>Thanh toán đơn hàng</h2>
			<br>
		</div>


		<div class="row" style="padding-left: 200px; padding-bottom: 50px;">
			<%-- <form:form action="${pageContext.request.contextPath}/checkout" method="POST" modelAttribute="bills"> --%>
			<div class="col-md-6 order-md-1">
				<h4 class="mb-3">Thông tin cá nhân</h4>
				<form:form class="needs-validation"
					action="${pageContext.request.contextPath}/checkout/${UserInfo.login_name}" method="POST"
					modelAttribute="bills">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="full_name">Họ tên</label>
							<form:input type="text" path="full_name" class="form-control"
								id="" placeholder="" value="" />
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">Số điện thoại</label>
							<form:input type="text" path="phone" class="form-control" id=""
								placeholder="" value="" />
						</div>
					</div>
					<br>
					<!--         <div class="mb-3">
          <label for="username">Liên hệ</label>
          <div class="input-group">
            <input type="text" class="form-control" id="username" placeholder="Số điện thoại" required>
          </div>
        </div> -->

					<div class="mb-3">
						<label for="email">Email</label>
						<form:input type="email" path="email" class="form-control"
							id="email" placeholder="you@example.com" />
					</div>
					<br>

					<div class="mb-3">
						<label for="address">Địa chỉ</label>
						<!-- <input type="text" class="form-control" id="address" placeholder="Thông tin địa chỉ giao hàng" required> -->
						<form:textarea path="address" class="form-control"
							id="exampleFormControlTextarea1" rows="3"></form:textarea>
					</div>
					<br>

					<div class="mb-3">
						<label for="address">Ghi chú</label>
						<!-- <input type="text" class="form-control" id="address" placeholder="" required> -->
						<form:textarea path="note" class="form-control"
							id="exampleFormControlTextarea1" rows="3"></form:textarea>
					</div>
					<br>
					<!--         <hr class="mb-4">
        <h4 class="mb-3">Payment</h4>
        <hr class="mb-4"> -->
					<button onclick="display()"
						class="btn btn-primary btn-lg btn-block" type="submit">Thanh
						toán</button>
						<div>
						<c:if test="${error != null}">
							<div class="alert alert-danger col-xs-offset-1 col-xs-10">
								${error}</div>
						</c:if>
						</div>
				</form:form>
			</div>
			

			<div class="col-md-4 order-md-2 mb-4" style="padding-left: 50px;">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Your cart</span> <span
						class="badge badge-secondary badge-pill">${cart.size()}</span>
				</h4>

				<ul class="list-group mb-3">
					<c:if test="${not empty cart}">
						<c:forEach var="item" items="${cart}">
							<li
								class="list-group-item d-flex justify-content-between lh-condensed">
								<div>
									<h6 style="font-size: 16px;" class="my-0">${item.value.product.name_product}</h6>
									<small style="font-size: 14px;" class="text-muted">Số
										lượng: ${item.value.quantity}</small>
								</div> <span class="text-muted item_price">Tổng giá:
									${item.value.product.purchase_price}</span>
							</li>
						</c:forEach>
					</c:if>
					<li class="list-group-item d-flex justify-content-between"><span>Tổng:</span>
						<strong class="item_price">${TotalPrice}</strong></li>
				</ul>

			</div>

			<div>
				<p style="padding-bottom: 10px; font-size: 20px">Thanh toán qua MoMo</p>
				<p style="font-size: 16px">Số tài khoản: 0975178016</p>
				<p style="font-size: 16px">Chủ tài khoản: Thắng Lương</p>
			</div>
			
		</div>

		<script type="text/javascript">
			function display() {
				document.getElementById("success1").style.display = "block";
			}
		</script>
		<c:if test="${error == null}">
		<div class="popup" id="success1">
			<div class="popup-content">
				<div class="imgbox">
					<img src=<c:url value='/template/user/images/iconSS.png'/> alt=""
						class="img-popup">
				</div>
				<div class="popup-title">
					<h3>Đã thanh toán thành công!</h3>
				</div>
			</div>
		</div>
		</c:if>
		<!-- 
	<script type="text/javascript">
		window.onload = display();
	</script> -->

	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script
		src="https://getbootstrap.com/docs/4.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o"
		crossorigin="anonymous"></script>
	<script
		src="https://getbootstrap.com/docs/4.3/examples/checkout/form-validation.js"></script>

	<script>
		function formatCash() {
			var item_price = document.getElementsByClassName("item_price");
			for (var i = 0; item_price.length; i++) {
				item_price[i].textContent = item_price[i].innerText
						.slice(0, -2).replace(/\B(?=(\d{3})+(?!\d))/g, ',')
						+ " VNĐ";
			}
		}
		window.addEventListener("load", formatCash());
	</script>

</body>
</html>