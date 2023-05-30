<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- content-section-starts -->
<div class="container">
	<div class="products-page">
		<div class="products">
			<div class="product-listy">
				<h2>our Products</h2>
				<ul class="product-list">
					<c:forEach var="item" items="${CategoryFull }">
						<li><a href="<c:url value='/product/${item.id}'/>"><span
								class="">${ item.cate_name }</span></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="latest-bis">
				<img src="<c:url value='/template/user/images/${Product.image}'/>"
					class="img-responsive" alt="" />

			</div>


		</div>
		<div class="new-product">
			<div class="col-md-5 zoom-grid">
				<div class="flexslider">
					<ul class="slides">
						<li
							data-thumb="<c:url value='/template/user/images/${Product.image}'/>">
							<div class="thumb-image">
								<img
									src="<c:url value='/template/user/images/${Product.image}'/>"
									data-imagezoom="true" class="img-responsive" alt="" />
							</div>
						</li>
						<c:forEach var="item" items="${Image_Product }">
							<li
								data-thumb="<c:url value='/template/user/images/${item.image}'/>">
								<div class="thumb-image">
									<img src="<c:url value='/template/user/images/${item.image}'/>"
										data-imagezoom="true" class="img-responsive" alt="" />
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<!-- /.modal -->
			<form method="get" action="<c:url value='/AddCart/${Product.id}'/>">
				<div class="col-md-7 dress-info">
					<div class="dress-name">
						<h3>${Product.name_product }</h3>
						<span class="item_price">${Product.purchase_price}</span>
						<div class="clearfix"></div>
						<p>${Product.desc_product}</p>
					</div>
					<div class="span span1">
						<p class="left">Tình trạng:</p>
						<c:set var="soluong" value="${Quantity}" />
						<c:if test="${soluong > 0 }">
							<p class="right">Còn ${soluong} sản phẩm</p>
						</c:if>
						<c:if test="${soluong <= 0 } ">
							<p class="right">Hết hàng</p>
						</c:if>
						<div class="clearfix"></div>
					</div>

					<div class="span span2">
						<p class="left">COLOR</p>
						<p class="right">${Product.color}</p>
						<div class="clearfix"></div>
					</div>
					<div class="span span3">

						<p class="left">Size</p>
						<p class="right">${Product.size }</p>
						<div class="clearfix"></div>
					</div>
					<div class="span span4">
						<p class="left">Số lượng</p>
						<p class="right">
							<input name="Soluong" type="number" min="1" max="100"
								id="quantity-${Product.id}" class="form-control text-center"
								value="1">
						</p>
						<div class="clearfix"></div>
					</div>
					<!-- <input onclick="display()" class="cbp-vm-icon cbp-vm-add  update-cart" type="submit"
						value="Thêm vào giỏ hàng"> -->
					<a onclick="display()" data-id="${Product.id}"
						class="cbp-vm-icon cbp-vm-add update-cart"><i
						class="fa fa-refresh">Thêm vào giỏ hàng</i></a>
					
					<script src="<c:url value='/template/user/js/imagezoom.js'/>"></script>
					<!-- FlexSlider -->
					<script defer
						src="<c:url value='/template/user/js/jquery.flexslider.js'/>"></script>
					<script>
						// Can also be used with $(document).ready()
						$(window).load(function() {
							$('.flexslider').flexslider({
								animation : "slide",
								controlNav : "thumbnails"
							});
						});
					</script>
				</div>
			</form>

			<div class="clearfix"></div>
			<div class="reviews-tabs">
				<!-- Main component for a primary marketing message or call to action -->
				<ul class="nav nav-tabs responsive hidden-xs hidden-sm" id="myTab">
					<li class="test-class active"><a class="deco-none misc-class"
						href="#how-to">Thông tin sản phẩm</a></li>

				</ul>

				<div class="tab-content responsive hidden-xs hidden-sm">
					<div class="tab-pane active" id="how-to">
						<p class="tab-text">${Product.desc_product }</p>

					</div>


				</div>
			</div>

		</div>
		<div class="clearfix"></div>
	</div>
</div>

<div class="other-products products-grid">
	<div class="container">
		<header>
			<h3 class="like text-center">Sản Phẩm Liên Quan</h3>
		</header>
		<c:forEach var="item" items="${ProductCategory }" varStatus="loop">
			<div class="col-md-4 product simpleCart_shelfItem text-center">
				<a href="<c:url value='/product-details/${item.id }' />"><img
					src="<c:url value='/template/user/images/${item.image }'/>" alt="" /></a>
				<div class="mask">
					<a href="<c:url value='/product-details/${item.id }' />">Xem nhanh</a>
				</div>
				<a class="product_name" href="single.html">${item.name_product }</a>
				<p>
					<a class="item_add" href="#"><i></i> <span class="item_price">${item.purchase_price }</span></a>
				</p>
			</div>
		</c:forEach>

		<div class="clearfix"></div>
	</div>
</div>


<!-- <script type="text/javascript">
	function display() {
		var quantity = $("#quantity-" + id).val();
		if (quantity > ${soluong})
			document.getElementById("success").style.display = "none";
		else
			document.getElementById("success").style.display = "block";
	}
</script> -->

<!-- <div class="popup" id="success">
	<div class="popup-content">
		<div class="imgbox">
			<img src=<c:url value='/template/user/images/iconSS.png'/> alt=""
				class="img-popup">
		</div>
		<div class="popup-title">
			<h3>Đã thêm sản phẩm vào giỏ hàng!</h3>
		</div>
	</div>
</div> -->

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


<div class="popup" id="success1">
	<div class="popup-content">
		<div class="imgbox">
			<img src=<c:url value='/template/user/images/warning.png'/> alt=""
				class="img-popup">
		</div>
		<div class="popup-title">
			<h3>Số lượng trong kho không đủ!</h3>
		</div>
		<button onclick="display1()">Ok</button>
	</div>
</div>

<div class="popup" id="success1">
	<div class="popup-content">
		<div class="imgbox">
			<img src=<c:url value='/template/user/images/iconSS.png'/> alt=""
				class="img-popup">
		</div>
		<div class="popup-title">
			<h3>Đã thêm sản phẩm vào giỏ hàng!</h3>
		</div>
		<button onclick="display1()">Ok</button>
	</div>
</div>

<!-- <script>
	let popup = document.getElementById("popup");
function openPopup(){
	popup.classList.add("open-popup");
}
function closePopup(){
	popup.classList.remove("open-popup");
}
</script> -->


<content tag="script"> <script>
	$(".update-cart")
			.on(
					"click",
					//const myTimeout = setTimeout(display, 5000);
					
					function display() {
						var id = $(this).data("id");
						var quantity = $("#quantity-" + id).val();
						if (quantity > ${soluong} )
							document.getElementById("success1").style.display = "block";
						
							/* alert("Không đủ hàng để mua"); */
						else
							window.location = "${pageContext.request.contextPath}/AddCartBySoLuong/"
								+ id + "/" + quantity;
							//alert("Đã thêm sản phẩm vào giỏ hàng");
							
							
					});
	function display1() {
		document.getElementById("success1").style.display = "none";
	}
</script> </content>
<!-- <script type="text/javascript">
				window.onload = display();
			</script> -->


<!-- content-section-ends -->