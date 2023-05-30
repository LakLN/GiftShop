<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<h4 class="page-title">Danh sách sản phẩm (${ProductPage.size()})<br><br><a href="<c:url value='/admin/create-product'/>">Thêm mới</a></h4>
		</div>
	</div>
</div>
<div class="container-fluid">
	<!-- Start Page Content -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Sản phẩm</h5>
					<div class="table-responsive">
						<table id="zero_config" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Mã sản phẩm</th>
									<th >Ảnh</th>
									<!-- <th>Thuộc danh mục</th> -->
									<th>Tên sản phẩm</th>
									<th>Giá sản phẩm</th>
									<!-- <th>Giá khuyến mãi</th> -->
									<th>Mô tả</th>
									<!-- <th>Sản phẩm mới</th> -->
									<!-- <th>Sản phẩm nổi bật</th> -->
									<th>Ngày tạo</th>
									<th>Ngày cập nhật</th>
									<th>Màu sắc</th>
									<th>kích thước</th>
									<th></th>
									<th></th>
									
								</tr>
							</thead>
							<c:forEach var="item" items="${ProductPage }">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<td ><img style="width:100%" src="<c:url value='/template/user/images/${item.image}'/> " class="img-responsive" alt="" /></td>
									<%-- <td>${item.id_category}</td> --%>
									<td>${item.name_product}</td>
									<td>${item.purchase_price}</td>
									<%-- <td>${item.promotional_price}</td> --%>
									<td>${item.desc_product}</td>
									<%-- <td>${item.new_product}</td> --%>
									<%-- <td>${item.featured_product}</td> --%>
									<td>${item.create_at}</td>
									<td>${item.update_at}</td>
									<td>${item.color}</td>
									<td>${item.size}</td>
									<td><a class="btn btn-info btn-sm update-cart" href="<c:url value="/admin/EditProduct/${item.id}"/>"><i
										class="fa fa-refresh"></i></a></td>
									<td><a class="btn btn-danger btn-sm" href="<c:url value="/admin/DeleteProduct/${item.id}"/>"><i class="fa fa-trash-o"></i></a></td>								
								</tr>
							</tbody>						
							</c:forEach>
						</table>
						  <div class="card" >
			                <div class="card-body" >
			                  <div class="row">
			                    <div class="col-md-4">
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
										      aria-controls="zero_config" href="<c:url value='/admin/load-product/${loop.index}'/> ">${loop.index}</a>
										  </li>
										 </c:if>
										 <c:if test="${ (loop.index) != PageInfo.currentPage}">
										  <li class=""><a class="page-link"
										      href="<c:url value='/admin/load-product/${loop.index}'/> ">${loop.index}</a>
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
