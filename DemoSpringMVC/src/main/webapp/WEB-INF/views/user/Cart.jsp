<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- checkout -->
<div class="cart-items">
	<div class="container">
		<div class="dreamcrub">
			<ul class="breadcrumbs">
				<li class="home"><a href="<c:url value='/trang-chu'/> "
					title="Go to Home Page">Home</a>&nbsp; <span>&gt;</span></li>
				<li class="women">Cart</li>
			</ul>
			<ul class="previous">
				<!-- <li><a href="index.html">Back to Previous Page</a></li> -->
				<li><button onclick="backButton()">Trở về trang trước</button></li>
				<script>
					function backButton() {
						window.history.back();
					}
				</script>
			</ul>
			<div class="clearfix"></div>
		</div>
		<h2 style="margin-bottom: 80px;">GIỎ HÀNG</h2>
		<div class="container">
			<table id="cart" class="table table-hover table-condensed">
				<thead>
					<tr>
						<th style="width: 50%">Sản phẩm</th>
						<th style="width: 6%">Số lượng</th>
						<th style="width: 10%; text-align: center">Đơn giá</th>
						<th style="width: 10%" class="text-center">Thành tiền</th>
						<th style="width: 10%"></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty cart}">
						<c:forEach var="item" items="${cart}">
							<tr>
								<td data-th="Product">
									<div class="row">
										<div class="col-sm-2 hidden-xs">
											<img
												src="<c:url value='/template/user/images/${item.value.product.image}'/>"
												alt="1" class="img-responsive" />
										</div>
										<div class="col-sm-10">
											<h4 class="nomargin">${item.value.product.name_product}</h4>
											<p></p>
										</div>
									</div>
								</td>
								<td data-th="Quantity" style="padding-top: 35px;"><input
									type="number" min="1" max="${item.value.inventory }" id="quantity-${item.key}"
									class="form-control text-center" value="${item.value.quantity}">
								</td>

								<td data-th="Price" class="item_price"
									style="padding-top: 40px; text-align: center">${item.value.product.purchase_price}
								</td>
								<td data-th="Subtotal" class="item_price"
									style="padding-top: 40px;" class="text-center">${item.value.total_purchase_price}</td>
								<td class="actions" style="padding-top: 35px;" data-th="">
									<a data-id="${item.key}"
									class="btn btn-info btn-sm update-cart"><i
										class="fa fa-refresh"></i></a> <a
									href="<c:url value='/DeleteCart/${item.key}'/>"
									class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></a>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
				<tfoot>
					<tr class="visible-xs">
						<td class="text-center"><strong>Total:
								${TotalPrice} </strong></td>
					</tr>
					<tr>
						<td><a href="<c:url value='/deleteCart'/>"
							class="btn btn-danger">Delete All</a></td>
						<td colspan="2" class="hidden-xs"></td>
						<td class="hidden-xs text-center"><strong class="item_price">Tổng:  
								${TotalPrice  }</strong></td>
						<td><c:if test="${not empty UserInfo}">
								<a href="<c:url value='/checkout/${UserInfo.getLogin_name()}'/>"
									class="btn btn-success btn-block">Checkout <i
									class="fa fa-angle-right"></i></a>
							</c:if> <c:if test="${ empty UserInfo}">
								<a href="<c:url value='/login'/>"
									class="btn btn-success btn-block">Checkout <i
									class="fa fa-angle-right"></i></a>
							</c:if></td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<script>
	function formatCash() {
		var item_price = document.getElementsByClassName("item_price");
		for (var i = 0; item_price.length; i++) {
			item_price[i].textContent = item_price[i].innerText.slice(0, -2)
					.replace(/\B(?=(\d{3})+(?!\d))/g, ',')
					+ " VNĐ";
		}
	}
	window.addEventListener("load", formatCash());
</script>

<content tag="script"> <script>
	$(".update-cart").on("click", function() {
		var id = $(this).data("id");
		var quantity = $("#quantity-" + id).val();
		window.location = "UpdateCart/" + id + "/" + quantity;
	});
</script> </content>

<!-- //checkout -->