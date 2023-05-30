<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">Danh sách sản phẩm có trong kho hàng (${Inventory.size()})<br><br><a href="<c:url value='/admin/create-inventory'/>">Thêm mới</a></h4>
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
									<th>Mã sản phẩm</th>
									<th>Tên sản phẩm</th>
									<th>Giá bán</th>
									<th>Số lượng tồn kho</th>
									<th>Đã bán</th>
									<th>Ngày tạo</th>
									<th>Ngày cập nhật</th>
								</tr>
							</thead>
							<c:forEach var="item" items="${Inventory }">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<c:forEach var="item1" items="${Product }">
									<c:if test="${item.id_product == item1.id}" >
									<td>${item1.name_product}</td>
									</c:if>
									</c:forEach>
									<td>${item.sale_price}</td>
									<td>${item.quantity}</td>
									<td>${item.sold}</td>
									<td>${item.create_at}</td>
									<td>${item.update_at}</td>
									<td><a class="btn btn-info btn-sm update-cart" href="<c:url value="/admin/EditInventory/${item.id}"/>"><i
										class="fa fa-refresh"></i></a></td>
									<td><a class="btn btn-danger btn-sm" href="<c:url value="/admin/DeleteInventory/${item.id}"/>"><i class="fa fa-trash-o"></i></a></td>
									
								</tr>
							</tbody>
							</c:forEach>
						</table>
						<div class="card" >
			                <div class="card-body" >
			                  <div class="row">
			                    <div class="col-xs-2 col-center-block">
			                      <!-- <h5 class="card-title">Default Pagination</h5> -->
			                      <div class="table-responsive" >
			                       <div id="zero_config_wrapper" class="dataTables_paginate paging_simple_numbers">
			                        <ul class="pagination" >
<%-- 			                          <li class="page-item">
			                            <a class="page-link" href="<c:url value='/admin/load-product/${loop.index - 1}'/> ">Previous</a>
			                          </li> --%>
									  <c:forEach var="item" begin="1" end="${ PageInfo.totalPage }" varStatus="loop">
										 <c:if test="${ (loop.index) == PageInfo.currentPage}">
										  <li class="paginate_button page-item active" id="zero_config_previous"><a class="page-link"
										      aria-controls="zero_config" href="<c:url value='/admin/load-inventory/${loop.index}'/> ">${loop.index}</a>
										  </li>
										 </c:if>
										 <c:if test="${ (loop.index) != PageInfo.currentPage}">
										  <li class=""><a class="page-link"
										      href="<c:url value='/admin/load-inventory/${loop.index}'/> ">${loop.index}</a>
										  </li>
										 </c:if>
									  </c:forEach>
									 <!--  <li class="page-item">
			                            <a class="page-link" href="#">Next</a>
			                          </li> -->
			                        </ul>
			                      </div>
			                     </div>
			                    </div>
			                  </div>
			                </div>
			              </div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>