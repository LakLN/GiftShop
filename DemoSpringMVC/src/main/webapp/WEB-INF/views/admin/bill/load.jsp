<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">Danh sách hóa đơn (${Bill.size()})</h4>
		</div>
	</div>
</div>
<div class="container-fluid">
	<!-- Start Page Content -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh mục</h5>
					<div class="table-responsive">
						<table id="zero_config" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Mã hóa đơn</th>
									<!-- <th>Tên đăng nhập</th> -->
									<th>Họ tên</th>
									<th>Số điện thoại</th>
									<th>Email</th>
									<th>Địa chỉ</th>
									<th>Ngày tạo</th>
									<th>Ngày cập nhật</th>
									<th>Số lượng</th>
									<th>Tổng tiền</th>
									<th>Trạng thái</th>
									<th>Đã xóa</th>
									<th></th>
									
								</tr>
							</thead>
							<c:forEach var="item" items="${Bill}">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<%-- <td>${item.login_name}</td> --%>
									<td>${item.full_name}</td>
									<td>${item.phone}</td>
									<td>${item.email}</td>
									<td>${item.address}</td>
									<td>${item.create_at}</td>
									<td>${item.update_at}</td>
									<td>${item.quantity}</td>
									<td class="item_price">${item.total}</td>
									<td>${item.status}</td>
									<td>${item.is_delete}</td>
									<td><a href="<c:url value="/admin/load-bill_detail/${item.id}"/>">Chi tiết</a></td>
									<c:if test="${userAdmin != null}">
									<td><a class="btn btn-danger btn-sm" href="<c:url value="/admin/DeleteBill/${item.id}"/>"><i class="fa fa-trash-o"></i></a></td>
									</c:if>
								</tr>
							</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
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