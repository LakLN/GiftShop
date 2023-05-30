<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	color: #1a202c;
	text-align: left;
	background-color: #e2e8f0;
}

.main-body {
	padding: 20px;
}

.card {
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0
		rgba(0, 0, 0, .06);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: .25rem;
}

.card-body {
	flex: 1 1 auto;
	min-height: 1px;
	padding: 50px;
}

.gutters-sm {
	margin-right: -8px;
	margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
	padding-right: 8px;
	padding-left: 8px;
}

.mb-3, .my-3 {
	margin-bottom: 1rem !important;
}

.bg-gray-300 {
	background-color: #e2e8f0;
}

.h-100 {
	height: 100% !important;
}

.shadow-none {
	box-shadow: none !important;
}

/* Style the tab */
.tab {
	overflow: hidden;
	background-color: #f1f1f1;
	display: flex;
	padding: 14px 16px;
	justify-content: center;
	align-item: center;
	margin: 30px 0;
}

/* Style the buttons that are used to open the tab content */
.tab button {
	background-color: #4c4c4c;
	color: white;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	border: none;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #1C1C1C;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #fff;
	color: #4c4c4c;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border-top: none;
}

.link-p {
	display: block;
	min-height: 250px;
	height: auto;
	width: 100%;
	max-width: 100%;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>

	<div class="container">
		<div class="main-body">

			<!-- Breadcrumb -->
			<nav aria-label="breadcrumb" class="main-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="<c:url value='/trang-chu'/> ">Trang chủ</a></li>
					<li class="breadcrumb-item active" aria-current="page">Tài
						khoản cá nhân</li>
				</ol>
			</nav>
			<!-- /Breadcrumb -->
			<div class="tab">
				<button class="tablinks active col-xs-4"
					onclick="openCity(event, 'profile-info')">Trang thông tin
					người dùng</button>
				<button class="tablinks col-xs-4"
					onclick="openCity(event, 'profile-order-manager')">Quản lý
					đơn hàng</button>
				<!-- <button class="tablinks col-xs-4"
					onclick="openCity(event, 'change-password')">Đổi mật khẩu</button> -->
			</div>

			<div id="profile-info" class="row gutters-sm tabcontent">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body" style="height: 524.5px">
							<div class="d-flex flex-column align-items-center text-center"
								style="padding-top: 80px;">
								<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
									alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									<h4>${UserInfo.getFull_name()}</h4>
									<h4>${UserInfo.getEmail()}</h4>
									<button class="btn btn-primary">${user.getId()}</button>
									<button class="btn btn-outline-primary">Message</button>
								</div>
							</div>
						</div>
					</div>
				</div>

				<form:form action="${UserInfo.getLogin_name()}" method="POST"
					modelAttribute="user">
					<div class="col-md-8">
						<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Id</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<h5>${UserInfo.getId()}</h5>
										<form:input class="form-control" type="hidden" path="id"
											readonly="true" />
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">

										<h6 class="mb-0">Login name</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<h5>${UserInfo.getLogin_name()}</h5>
										<%-- <form:input class="form-control" type="hidden"
											path="login_name" readonly="true" /> --%>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Email</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<h5>${UserInfo.getEmail()}</h5>
										<%--<form:input class="form-control" type="hidden" path="email" />--%>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Full Name</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<!-- <input class="form-control" type="text" value="IDOR Attack by NHG@gmail.com" readonly="true"/> -->
										<form:input class="form-control" type="text" path="full_name" />
									</div>
								</div>

								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Phone</h6>
									</div>
									<div class="col-sm-9 text-secondary">
										<form:input class="form-control" type="text" path="phone" />
									</div>
								</div>


								<!-- 								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Address</h6>
									</div>
									<div class="col-sm-9 text-secondary">Bay Area, San
										Francisco, CA</div>
								</div> -->
								<hr>
								<div class="row">
									<div class="col-sm-12">
										<input type="submit" class="btn btn-primary px-4"
											value="Lưu thay đổi">
									</div>
								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>

			<div id="profile-order-manager" class="tabcontent">
				<div class="col-md-12 mb-3">
					<c:forEach var="item" items="${Bill}">
						<div class="card mb-3" style="height: auto">
							<div class="card-body">
								<div class="row" style="padding: 12px 30px">
									<div class="col-xs-6">
										<span><b>Ngày</b>: ${item.create_at}</span> <br> <span><b>Người
												nhận</b>: ${item.full_name}</span> <br> <span><b>Số
												điện thoại</b>: ${item.phone}</span> <br> <span><b>Email</b>:
											${item.email}</span> <br> <span><b>Địa chỉ</b>:
											${item.address}</span>
									</div>

									<div class="col-xs-6">
										<span><b>Tổng giá trị đơn hàng</b>: <span
											class="item_price">${item.total}</span></span> <br> <span><b>Trạng
												thái</b>: ${item.status}</span> <br> <span><b>Ghi chú</b>:
											${item.note}</span>
									</div>
								</div>
								<div class="row" style="padding: 12px 30px">
									<table id="cart" class="table table-hover table-condensed">
										<thead>
											<tr>
												<td style="width: 35%">Hình ảnh</td>
												<td style="width: 15%">Tên sản phẩm</td>
												<td style="width: 10%">Số lượng</td>
												<td style="width: 15%">Tổng tiền sản phẩm</td>
												<td style="width: 10%">Hủy</td>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="bill_detail" items="${billDetail}">
												<c:choose>
													<c:when test="${bill_detail.id_bill == item.id}">

														<tr>
															<td class="hidden-xs"><img
																style="width: 47px; height: auto"
																src="<c:url value='/template/user/images/${bill_detail.image}'/> "
																class="img-responsive" alt="" /></td>
															<td>${bill_detail.name_product}</td>
															<td>${bill_detail.quantity}</td>
															<td class="item_price">${bill_detail.total}</td>
															<td class="text-center"><i class="fa fa-trash-o"></i>
															</td>
														</tr>
													</c:when>
												</c:choose>
											</c:forEach>
											<tr>

												<td colspan="3" align="right"><b>Tổng cộng</b></td>
												<td class="total item_price" colspan="2"><b>${item.total}</b></td>
											</tr>
										</tbody>


									</table>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<!-- 		<div id="change-password" class="tabcontent">
		
			
		</div> -->
	</div>

	<script>
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}
		window.addEventListener("load", openCity(event, 'profile-info'));
	</script>
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