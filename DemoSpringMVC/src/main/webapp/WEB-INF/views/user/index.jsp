<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="banner">
	<div class="container">
		<div class="banner-bottom">
			<div class="callbacks_container">
				<ul class="rslides" id="slider4">
					<li>
						<div class="banner-info">
							<h3>Chào mừng bạn!</h3>
							<p>Mua sắm tại MeowMeowShop</p>
						</div>
					</li>
				</ul>
			</div>
			<div class="banner-bottom-right">

				<!--banner-->
				<script
					src="<c:url value='/template/user/js/responsiveslides.min.js'/> "></script>
				<script>
					// You can also use "$(window).load(function() {"
					$(function() {
						// Slideshow 4
						$("#slider4")
								.responsiveSlides(
										{
											auto : true,
											pager : true,
											nav : false,
											speed : 500,
											namespace : "callbacks",
											before : function() {
												$('.events')
														.append(
																"<li>before event fired.</li>");
											},
											after : function() {
												$('.events')
														.append(
																"<li>after event fired.</li>");
											}
										});

					});
				</script>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<!-- content-section-starts-here -->
<div class="container">
	<div class="products-grid">
		<header>
			<h3 class="head text-center">Sản Phẩm Nổi Bật</h3>
		</header>

		<c:forEach var="item" items="${ FeaturedProducts }" varStatus="loop">

			<div class="col-md-3 product simpleCart_shelfItem text-center">
				<a href="<c:url value='/product-details/${item.id }' />"><img
					src="<c:url value='/template/user/images/${item.image }'/> " alt="" /></a>
				<div class="mask" style="left: 25%">
					<a href="<c:url value='/product-details/${item.id }' />">Xem nhanh</a>
				</div>
				<a class="product_name" href="single.html">${item.name_product}</a>
				<p>
					<a class="item_add" href="<c:url value='/AddCart/${item.id}'/>"><i></i>
						<span class="item_price">${item.purchase_price}</span></a>
				</p>
			</div>
		</c:forEach>

		<div class="clearfix"></div>
	</div>
</div>
<div class="other-products">
	<div class="container">
		<h3 class="head text-center">Sản Phẩm Mới</h3>

		<ul id="flexiselDemo3">
			<c:forEach var="item" items="${ NewProducts }" varStatus="loop">
				<li><a href="<c:url value='/product-details/${item.id }' />"><img
						src="<c:url value='/template/user/images/${item.image }'/> "
						class="img-responsive" alt="" /></a>
					<div class="product liked-product simpleCart_shelfItem">
						<a class="like_name"
							href="<c:url value='/product-details/${item.id }' />">${ item.name_product }</a>
						<p>
							<a class="item_add" href="#"><i></i> <span
								class=" item_price">${ item.purchase_price }</span></a>
						</p>
					</div></li>
			</c:forEach>
		</ul>


		<script type="text/javascript">
			$(window).load(function() {
				$("#flexiselDemo3").flexisel({
					visibleItems : 4,
					animationSpeed : 1000,
					autoPlay : true,
					autoPlaySpeed : 3000,
					pauseOnHover : true,
					enableResponsiveBreakpoints : true,
					responsiveBreakpoints : {
						portrait : {
							changePoint : 480,
							visibleItems : 1
						},
						landscape : {
							changePoint : 640,
							visibleItems : 2
						},
						tablet : {
							changePoint : 768,
							visibleItems : 3
						}
					}
				});

			});
		</script>
		<script type="text/javascript"
			src="<c:url value='/template/user/js/jquery.flexisel.js'/> "></script>
	</div>
</div>

<script>
	function formatCash() {
		var item_price = document.getElementsByClassName("item_price");
		for (var i = 0; item_price.length; i++) {
			item_price[i].textContent = item_price[i].innerText.slice(0,-2).replace(
					/\B(?=(\d{3})+(?!\d))/g, ',') + " VNĐ";
		}
	}
	window.addEventListener("load", formatCash());
</script>
<!-- content-section-ends-here -->
