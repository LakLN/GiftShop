<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">Danh sách tài khoản (${Account.size()})</h4>
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
									<th>Mã tài khoản</th>
									<th>Tên đăng nhập</th>
									<th>Mật khẩu</th>
									<th>Họ tên</th>
									<th>Số điện thoại</th>
									<th>Email</th>
									<th>Đã xóa</th>
									<th></th>
								</tr>
							</thead>
							<c:forEach var="item" items="${Account}">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<td>${item.login_name}</td>
									<td>*********</td>
									<td>${item.full_name}</td>
									<td>${item.phone}</td>
									<td>${item.email}</td>
									<td>${item.is_delete }</td>
									<td><a class="btn btn-info btn-sm update-cart" href="<c:url value="/admin/EditAccount/${item.id}"/>"><i
										class="fa fa-refresh"></i></a></td>
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