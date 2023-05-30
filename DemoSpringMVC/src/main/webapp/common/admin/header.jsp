<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${(Role != null) or (userAdmin != null) or (userShipper != null) or (userEmp != null)}">

<header class="topbar" data-navbarbg="skin5">
	<nav class="navbar top-navbar navbar-expand-md navbar-dark">
		<div class="navbar-header" data-logobg="skin5">
			<!-- Logo -->
			<a class="navbar-brand" href="<c:url value="/admin/home" />"> <!-- Logo icon --> <b
				class="logo-icon ps-2"> <!-- Dark Logo icon --> <img
					src="<c:url value='/template/admin/images/logo-icon.png'/>" alt="homepage"
					class="light-logo" width="25" />
			</b> <!--End Logo icon --> <!-- Logo text --> <span
				class="logo-text ms-2"> <!-- dark Logo text --> <img
					src="<c:url value='/template/admin/images/logo-admin.png'/>" alt="homepage"
					class="light-logo" />
			</span>
			</a>
			<!-- End Logo -->

			<!-- Toggle which is visible on mobile only -->
			<a class="nav-toggler waves-effect waves-light d-block d-md-none"
				href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
		</div>
		<!-- End Logo -->
		<div class="navbar-collapse collapse" id="navbarSupportedContent"
			data-navbarbg="skin5">
			<!-- toggle and nav items -->
			<ul class="navbar-nav float-start me-auto">
				<li class="nav-item d-none d-lg-block"><a
					class="nav-link sidebartoggler waves-effect waves-light"
					href="javascript:void(0)" data-sidebartype="mini-sidebar"><i
						class="mdi mdi-menu font-24"></i></a></li>
				<!-- create new -->
				<!-- <li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<span class="d-none d-md-block">Create New <i
							class="fa fa-angle-down"></i>
					</span> <span class="d-block d-md-none"><i class="fa fa-plus"></i></span>
				</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#">Something else here</a>
						</li>
					</ul></li> -->
				<!-- Search -->
				<!-- <li class="nav-item search-box"><a
					class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i
						class="mdi mdi-magnify fs-4"></i></a>
					<form class="app-search position-absolute">
						<input type="text" class="form-control"
							placeholder="Search &amp; enter" /> <a class="srh-btn"><i
							class="mdi mdi-window-close"></i></a>
					</form></li> -->
			</ul>

			<!-- Right side toggle and nav items -->
			<ul class="navbar-nav float-end">

				<!-- Comment -->
				<!-- <li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="mdi mdi-bell font-24"></i>
				</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#">Action</a></li>
						<li><a class="dropdown-item" href="#">Another action</a></li>
						<li><hr class="dropdown-divider" /></li>
						<li><a class="dropdown-item" href="#">Something else here</a>
						</li>
					</ul></li> -->
				<!-- End Comment -->

				<!-- Messages -->
				<!-- <li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle waves-effect waves-dark" href="#"
					id="2" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> <i
						class="font-24 mdi mdi-comment-processing"></i>
				</a>
					<ul
						class="
                    dropdown-menu dropdown-menu-end
                    mailbox
                    animated
                    bounceInDown
                  "
						aria-labelledby="2">
						<ul class="list-style-none">
							<li>
								<div class="">
									Message
									<a href="javascript:void(0)" class="link border-top">
										<div class="d-flex no-block align-items-center p-10">
											<span
												class="
                                btn btn-success btn-circle
                                d-flex
                                align-items-center
                                justify-content-center
                              "><i
												class="mdi mdi-calendar text-white fs-4"></i></span>
											<div class="ms-2">
												<h5 class="mb-0">Event today</h5>
												<span class="mail-desc">Just a reminder that event</span>
											</div>
										</div>
									</a>
									Message
									<a href="javascript:void(0)" class="link border-top">
										<div class="d-flex no-block align-items-center p-10">
											<span
												class="
                                btn btn-info btn-circle
                                d-flex
                                align-items-center
                                justify-content-center
                              "><i
												class="mdi mdi-settings fs-4"></i></span>
											<div class="ms-2">
												<h5 class="mb-0">Settings</h5>
												<span class="mail-desc">You can customize this
													template</span>
											</div>
										</div>
									</a>
									Message
									<a href="javascript:void(0)" class="link border-top">
										<div class="d-flex no-block align-items-center p-10">
											<span
												class="
                                btn btn-primary btn-circle
                                d-flex
                                align-items-center
                                justify-content-center
                              "><i
												class="mdi mdi-account fs-4"></i></span>
											<div class="ms-2">
												<h5 class="mb-0">Pavan kumar</h5>
												<span class="mail-desc">Just see the my admin!</span>
											</div>
										</div>
									</a>
									Message
									<a href="javascript:void(0)" class="link border-top">
										<div class="d-flex no-block align-items-center p-10">
											<span
												class="
                                btn btn-danger btn-circle
                                d-flex
                                align-items-center
                                justify-content-center
                              "><i
												class="mdi mdi-link fs-4"></i></span>
											<div class="ms-2">
												<h5 class="mb-0">Luanch Admin</h5>
												<span class="mail-desc">Just see the my new admin!</span>
											</div>
										</div>
									</a>
								</div>
							</li>
						</ul>
					</ul></li> -->
				<!-- End Messages -->

				<!-- User profile and search -->
				<li class="nav-item dropdown"><a
					class="
                    nav-link
                    dropdown-toggle
                    text-muted
                    waves-effect waves-dark
                    pro-pic
                  "
					href="#" id="navbarDropdown" role="button"
					data-bs-toggle="dropdown" aria-expanded="false"> <img
						src="<c:url value='/template/admin/images/users/1.jpg'/>" alt="user"
						class="rounded-circle" width="31" />
				</a>
					<ul class="dropdown-menu dropdown-menu-end user-dd animated"
						aria-labelledby="navbarDropdown">
						<!-- <a class="dropdown-item" href="javascript:void(0)"><i
							class="mdi mdi-account me-1 ms-1"></i> My Profile</a>
						
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="javascript:void(0)"><i
							class="mdi mdi-settings me-1 ms-1"></i> Account Setting</a>
						<div class="dropdown-divider"></div> -->
						<a class="dropdown-item" href="<c:url value="/logoutAdmin"/>"><i
							class="fa fa-power-off me-1 ms-1"></i> Logout</a>
						<div class="dropdown-divider"></div>
						<div class="ps-4 p-10">
							<!-- <a href="javascript:void(0)"
								class="btn btn-sm btn-success btn-rounded text-white">View
								Profile</a> -->
						</div>
					</ul></li>
				<!-- User profile and search -->
			</ul>
		</div>
	</nav>
</header>
<aside class="left-sidebar" data-sidebarbg="skin5">
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar">
		<!-- Sidebar navigation-->
		<nav class="sidebar-nav">
			<ul id="sidebarnav" class="pt-4">
			<c:if test="${userAdmin != null}">
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="true"><i
						class="mdi mdi-chart-areaspline"></i><span class="hide-menu">Thống kê
					</span></a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item"><a href="<c:url value='/admin/report-income'/>"
							class="sidebar-link"><i class="mdi mdi-chart-bar"></i><span
								class="hide-menu"> Thống kê doanh thu sản phẩm </span></a></li>
					</ul></li>
			</c:if>
			<c:if test="${userAdmin != null}">
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="true"><i
						class="mdi mdi-account-key"></i><span class="hide-menu">Tài khoản
					</span></a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item"><a href="<c:url value='/admin/load-account'/>"
							class="sidebar-link"><i class="mdi mdi-all-inclusive"></i><span
								class="hide-menu"> Danh sách tài khoản </span></a></li>
					</ul></li>
			</c:if>
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="true"><i
						class="mdi mdi-receipt"></i><span class="hide-menu">Đơn hàng
					</span></a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item"><a
							href="<c:url value='/admin/load-bill'/>" class="sidebar-link"><i
								class="mdi mdi-note-plus"></i><span class="hide-menu">
									Danh sách đơn hàng </span></a></li>
					</ul></li>
				<c:if test="${userAdmin != null}">	
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="true"><i
						class="mdi mdi-receipt"></i><span class="hide-menu">Sản phẩm </span></a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item"><a href="<c:url value='/admin/load-product'/>"
							class="sidebar-link"><i class="mdi mdi-note-plus"></i><span
								class="hide-menu"> Danh sách sản phẩm </span></a></li>
					</ul></li>
				</c:if>
				<c:if test="${userAdmin != null}">	
				<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="true"><i
						class="mdi mdi-receipt"></i><span class="hide-menu">Danh mục </span></a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item"><a href="<c:url value='/admin/load-category'/>"
							class="sidebar-link"><i class="mdi mdi-note-outline"></i><span
								class="hide-menu"> Danh sách danh mục </span></a></li>
				
					</ul></li>
					<li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="true"><i
						class="mdi mdi-receipt"></i><span class="hide-menu"> Kho Hàng </span></a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item"><a href="<c:url value='/admin/load-inventory'/>"
							class="sidebar-link"><i class="mdi mdi-note-plus"></i><span
								class="hide-menu"> Danh Sách Kho hàng </span></a></li>
					</ul></li>
				</c:if>	
				<!-- <li class="sidebar-item"><a
					class="sidebar-link has-arrow waves-effect waves-dark"
					href="javascript:void(0)" aria-expanded="false"><i
						class="mdi mdi-alert"></i><span class="hide-menu">Errors </span></a>
					<ul aria-expanded="false" class="collapse first-level">
						<li class="sidebar-item"><a href="error-403.html"
							class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span
								class="hide-menu"> Error 403 </span></a></li>
						<li class="sidebar-item"><a href="error-404.html"
							class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span
								class="hide-menu"> Error 404 </span></a></li>
						<li class="sidebar-item"><a href="error-405.html"
							class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span
								class="hide-menu"> Error 405 </span></a></li>
						<li class="sidebar-item"><a href="error-500.html"
							class="sidebar-link"><i class="mdi mdi-alert-octagon"></i><span
								class="hide-menu"> Error 500 </span></a></li>
					</ul></li> -->
			</ul>
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->
</aside>

</c:if>