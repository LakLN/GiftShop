<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 d-flex no-block align-items-center">
			<a href="<c:url value="/admin/load-bill"/>" class="page-title"><p style="font-size:larger" >Go back</p></a>
		</div>
	</div>
</div>

<div class="container-fluid">
	<!-- Start Page Content -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
				
				  <form:form action="" method="POST" modelAttribute="bills" class="form-horizontal">
				  <c:if test="${userShipper != null }" >
				   <div class="form-group row">
					 <!-- <label class="col-sm-1 control-label col-form-label">Xác nhận</label> -->
					 <button class="col-sm-auto control-label col-form-label btn btn-primary" type="submit" class="">
                        Xác nhận
                      </button>
                      <div class="col-sm-3">
                       <form:select path="status" class="select2 form-select shadow-none" style="width: 100%; height: 36px">
                          <option>Chờ giao hàng</option>
                          <option value="Đang giao hàng">Đang giao hàng</option>
                          <option value="Đã giao hàng">Đã giao hàng</option>
                          <!-- <option value="Hủy đơn hàng">Hủy đơn hàng</option> -->
                       </form:select>
				
                      </div>
                    </div>
                    </c:if>
                    <c:if test="${userEmp != null }" >
				   <div class="form-group row">
					 <!-- <label class="col-sm-1 control-label col-form-label">Xác nhận</label> -->
					 <button class="col-sm-auto control-label col-form-label btn btn-primary" type="submit" class="">
                        Xác nhận
                      </button>
                      <div class="col-sm-3">
                       <form:select path="status" class="select2 form-select shadow-none" style="width: 100%; height: 36px">
                          <option>Chờ xác nhận</option>
                          <option value="Xác nhận">Xác nhận</option>
                          <option value="Hủy">Hủy</option>
                          <!-- <option value="Hủy đơn hàng">Hủy đơn hàng</option> -->
                       </form:select>
				
                      </div>
                    </div>
                    </c:if>

                  	
                  <!-- <div class="border-top">
                    <div class="card-body">
                      <button type="submit" class="btn btn-primary">
                        Submit
                      </button>
                    </div>
                  </div> -->
				  
					<h5 class="card-title">Danh mục</h5>

                  
					<div class="table-responsive">
						<table id="zero_config" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Id</th>
									<th>Ảnh</th>
									<th>Tên sản phẩm</th>
									<th>Số lượng</th>
									<th>Tổng tiền</th>

								</tr>
							</thead>
							<c:forEach var="item" items="${BillDetail}">
							<tbody>
								<tr>
									<td>${item.id}</td>
									<td ><img style="width:20%" src="<c:url value='/template/user/images/${item.image}'/> " class="img-responsive" alt="" /></td>
									<td>${item.name_product}</td>
									<td>${item.quantity}</td>
									<td class="item_price">${item.total}</td>
									
								</tr>
							</tbody>
							</c:forEach>
						</table>
					</div>
				  </form:form>
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
