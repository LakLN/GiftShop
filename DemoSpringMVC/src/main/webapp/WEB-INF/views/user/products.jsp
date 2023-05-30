<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- content-section-starts -->
<div class="container">
	<div class="products-page">
		<div class="products">
			<div class="product-listy">
				<h2>Our Products</h2>
				<ul class="product-list">
					<c:forEach var="item" items="${CategoryFull }">
						<li><a href="<c:url value='/product/${item.id}'/>"><span
								class="">${ item.cate_name }</span></a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="latest-bis">
				<%-- <img src="<c:url value='/template/user/images/l4.jpg'/> " class="img-responsive" alt="" /> --%>
				<!-- <div class="offer">
						 <p>40%</p> 
						<small>Top Offer</small>
					</div> -->
			</div>
			

		</div>
		<c:if test="${key_word != null }">
			<h1>Kết quả tìm kiếm của : ${key_word}</h1>
		</c:if>
		<div class="new-product">
			<div class="new-product-top">
				<ul class="product-top-list">
					<li><a href="<c:url value='/trang-chu'/> ">Home</a>&nbsp;<span>&gt;</span></li>
					<li><span class="act">Sản Phẩm</span>&nbsp;</li>
				</ul>
				<p class="back">
					<!-- <a href="index.html">Back to Previous</a> -->
					<button onclick="backButton()">Trở về trang trước</button>
					<script>
						function backButton() {
							window.history.back();
						}
					</script>
				</p>
				<div class="clearfix"></div>
			</div>

			<div class="mens-toolbar">
				<div class="sort">
					<div class="sort-by">
						<c:if test="${idCategory != null}">
							<form:form
								action="${pageContext.request.contextPath}/sort/${idCategory}"
								method="POST">
								<button type="submit">Sort by</button>
								<select name="word">
									<!-- <option value="Position">Position</option> -->
									<option value="Name">Name</option>
									<option value="Price">Price</option>
								</select>
							</form:form>
						</c:if>
						<%--  <c:if test ="${ idCategory = null or empty idCategory }" >
			          <form:form action="${pageContext.request.contextPath}/sort/${key_word}" method="POST">
			            <button type="submit">Sort by</button>
			            <select name="word">
			            	<!-- <option value="Position">Position</option> -->
			            	<option value="Name">Name</option>
			                <option value="Price">Price</option>
			            </select>
			            </form:form> 
			         </c:if> --%>
						<%--     <c:if test ="${empty idCategory }" >
			          <form:form action="${pageContext.request.contextPath}/sort/${key_word}" method="POST">
			            <button type="submit">Sort by</button>
			            <select name="word">
			            	<option value="Position">Position</option>
			            	<option value="Name">Name</option>
			                <option value="Price">Price</option>
			            </select>
			            </form:form> 
			        </c:if>  --%>
					</div>
				</div>

				<ul class="women_pagenation">

					<li>Page:</li>
					<c:forEach var="item" begin="1" end="${ PageInfo.totalPage }"
						varStatus="loop">
						<c:if test="${ (loop.index) == PageInfo.currentPage}">
							<li class="active"><a
								href="<c:url value='/product/${idCategory}/${loop.index}'/> ">${loop.index}</a></li>
						</c:if>
						<c:if test="${ (loop.index) != PageInfo.currentPage}">
							<li><a
								href="<c:url value='/product/${idCategory}/${loop.index}'/> ">${loop.index}</a></li>
						</c:if>
					</c:forEach>

				</ul>

				<div class="clearfix"></div>
			</div>
			<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
				<div class="cbp-vm-options">
					<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected"
						data-view="cbp-vm-view-grid" title="grid">Grid View</a> <a
						href="#" class="cbp-vm-icon cbp-vm-list"
						data-view="cbp-vm-view-list" title="list">List View</a>
				</div>
				<!-- <div class="pages">
					<div class="limiter visible-desktop">
						<label>Show</label> <select>
							<option value="" selected="selected">9</option>
							<option value="">15</option>
							<option value="">30</option>
						</select> per page
					</div>
				</div> -->
				<div class="clearfix"></div>
				<ul>
					<c:forEach var="item" items="${ProductPage}" varStatus="loop">

						<li><a class="cbp-vm-image"
							href="<c:url value='/product-details/${item.id}'/> ">
								<div class="simpleCart_shelfItem">
									<div class="view view-first">
										<div class="inner_content clearfix">
											<div class="product_image">
												<img
													src="<c:url value='/template/user/images/${ item.image}'/> "
													class="img-responsive" alt="" />
												<div class="mask">
													<div class="info">Xem nhanh</div>
												</div>
												<div class="product_container">
													<div class="cart-left">
														<p class="title">${ item.name_product }</p>
													</div>
													<br>
													<div class="pricey">
														<span class="item_price">${ item.purchase_price }</span>
													</div>
													<div class="clearfix"></div>
												</div>
											</div>
										</div>
									</div>
						</a> <!-- <div class="cbp-vm-details">
								Silver beet shallot wakame tomatillo salsify mung bean beetroot groundnut.
							</div> --> <a class="cbp-vm-icon cbp-vm-add item_add"
							href="<c:url value='/AddCart/${item.id}'/>"> Thêm vào giỏ
								hàng</a> <!-- <button class="cbp-vm-icon cbp-vm-add item_add" type="submit" >Thêm vào giỏ hàng</button> -->
			</div>
			</li>

			</c:forEach>
			</ul>
		</div>
		<script src="<c:url value='/template/user/js/cbpViewModeSwitch.js'/> "
			type="text/javascript"></script>
		<script src="<c:url value='/template/user/js/classie.js'/> "
			type="text/javascript"></script>
	</div>
	<div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<!-- content-section-ends -->
<div class="other-products">
	<div class="container">
		<h3 class="like text-center">Sản Phẩm Mới</h3>

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
			item_price[i].textContent = item_price[i].innerText.slice(0, -2)
					.replace(/\B(?=(\d{3})+(?!\d))/g, ',')
					+ " VNĐ";
		}
	}
	window.addEventListener("load", formatCash());
</script>
