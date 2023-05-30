<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div class="page-breadcrumb">
	<div class="row">
		<div class="col-12 align-items-center">
			<div class="card">
				<div class="card-body">
					<h4 class="page-title">Thống kê doanh thu</h4>
					<form action="./report-income" method="post">
						<div class="form-group mt-2">
							<label for="begin_date">Từ ngày</label> <input
								value="${begin_date}" class="form-control" type="date"
								name="begin_date" id="begin_date">
						</div>
						<div class="form-group mt-2">
							<label for="end_date">Đến ngày</label> <input value="${end_date}"
								class="form-control" type="date" name="end_date" id="end_date">
						</div>
						<div class="form-group mt-2">
							<label for="end_date">Thống kê theo</label> <select name="time_option"
								class="form-select" aria-label="Default select example">
								<option <c:if test="${time_option == 'DATE'}">selected</c:if> value="DATE">Ngày</option>
								<option <c:if test="${time_option == 'MONTH'}">selected</c:if> value="MONTH">Tháng</option>
								<option <c:if test="${time_option == 'YEAR'}">selected</c:if> value="YEAR">Năm</option>
							</select>
						</div>
						<button type="submit" class="btn btn-primary mt-2">Kiểm
							tra doanh thu</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<!-- Start Page Content -->
	<div class="row">
		<div class="col-md-8">
			<div class="card">
				<div class="card-body">
					<div style="min-height: 530px">
						<canvas id="barChart"></canvas>
					</div>

				</div>
			</div>
		</div>

		<div class="col-md-4">
			<div class="card">
				<div class="card-body">
					<div style="min-height: 530px">
						<canvas id="pieChart"></canvas>
					</div>
				</div>
			</div>
		</div>

		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh sách đơn hàng đã giao</h5>
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
									<th></th>
								</tr>
							</thead>
							<c:forEach var="item" items="${SuccessBill}">
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
										<td><a
											href="<c:url value="/admin/report/detail/${item.id}"/>">Chi
												tiết</a></td>
										<c:if test="${userEmp != null} "></c:if>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh sách đơn hàng đang chờ giao</h5>
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
									<th></th>
								</tr>
							</thead>
							<c:forEach var="item" items="${WaitingBill}">
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
										<td><a
											href="<c:url value="/admin/report/detail/${item.id}"/>">Chi
												tiết</a></td>
										<c:if test="${userEmp != null} "></c:if>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh sách đơn hàng đang giao</h5>
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
									<th></th>
								</tr>
							</thead>
							<c:forEach var="item" items="${ProcessBill}">
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
										<td><a
											href="<c:url value="/admin/report/detail/${item.id}"/>">Chi
												tiết</a></td>
										<c:if test="${userEmp != null} "></c:if>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh sách đơn hàng chờ xác nhận</h5>
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
									<th></th>
								</tr>
							</thead>
							<c:forEach var="item" items="${WaitConfirmBill}">
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
										<td><a
											href="<c:url value="/admin/report/detail/${item.id}"/>">Chi
												tiết</a></td>
										<c:if test="${userEmp != null} "></c:if>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh sách đơn hàng đã xác nhận</h5>
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
									<th></th>
								</tr>
							</thead>
							<c:forEach var="item" items="${ConfirmedBill}">
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
										<td><a
											href="<c:url value="/admin/report/detail/${item.id}"/>">Chi
												tiết</a></td>
										<c:if test="${userEmp != null} "></c:if>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">Danh sách đơn hàng đã hủy</h5>
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
									<th></th>
								</tr>
							</thead>
							<c:forEach var="item" items="${CancelBill}">
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
										<td><a
											href="<c:url value="/admin/report/detail/${item.id}"/>">Chi
												tiết</a></td>
										<c:if test="${userEmp != null} "></c:if>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  const bar = document.getElementById('barChart');
 
  const pie = document.getElementById('pieChart');
  
  new Chart(pie, {
	    type: 'pie',
	    data: {
	    	  labels: [<c:forEach var="catereport" items="${CateReport}">'${catereport.name}',</c:forEach>],
	    		  datasets: [{
	    		    label: 'Doanh thu theo danh mục',
	    		    data: [<c:forEach var="catereport" items="${CateReport}">${catereport.total},</c:forEach>],
	    		    
	    		    hoverOffset: 4
	    		  }]
	    		},
	    options: {
	        responsive: true,
	        legend: {
	            position: 'top',
	        },
	        plugins:{
	        	title: {
	            	display: true,
	            	text: 'Doanh thu theo danh mục'
	        	}
	        },
	        animation: {
	            animateScale: true,
	            animateRotate: true
	        }
	    }
	});

  
  new Chart(bar, {
    type: 'bar',
    data: {
      labels: [<c:forEach var="billreport" items="${BillReport}">'${billreport.date}',</c:forEach>],
      datasets: [{
        label: 'Doanh thu theo ngày tháng năm',
        data: [<c:forEach var="billreport" items="${BillReport}">${billreport.total},</c:forEach>],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  
  
 
  
</script>