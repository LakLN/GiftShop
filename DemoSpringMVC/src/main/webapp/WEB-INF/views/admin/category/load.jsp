<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">Danh sách danh mục (${Category.size()})<br><br><a href="<c:url value='/admin/create-category'/>">Thêm mới</a></h4>
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
									<th>Mã danh mục</th>
									<th>Tên danh mục</th>
									<th>Mô tả</th>
									<th>Ngày tạo</th>
									<th>Ngày cập nhật</th>
									<th>Thuộc danh mục</th>
									<th></th>
									<td></td>
								</tr>
							</thead>
							<c:forEach var="item" items="${Category }">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<td>${item.cate_name}</td>
									<td>${item.cate_desc}</td>
									<td>${item.create_at}</td>
									<td>${item.update_at}</td>
									<td>${item.id_category}</td>
									<td><a class="btn btn-info btn-sm update-cart" href="<c:url value="/admin/Edit/${item.id}"/>"><i
										class="fa fa-refresh"></i></a></td>
									<td><a class="btn btn-danger btn-sm" href="<c:url value="/admin/Delete/${item.id}"/>"><i class="fa fa-trash-o"></i></a></td>
									
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