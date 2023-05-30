<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
              <a href="<c:url value="/admin/load-product"/>" class="page-title"><p style="font-size:larger">Go back</p></a>
            </div>
          </div>
        </div>

        <div class="container-fluid">
          <!-- Start Page Content -->
          <div class="row">
            <div class="col-md-7">
              <div class="card">
                <form:form action="" method="POST" modelAttribute="product" class="form-horizontal">
                  <div class="card-body">
                    <h4 class="card-title">Chỉnh sửa</h4>
                    
                    <div class="form-group row">
                      <label for="fname" class="col-sm-3 control-label col-form-label">Mã sản phẩm</label>
                       <div class="col-sm-9">
                        <form:input path="id"
                          readonly="true"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Mã sản phẩm"
                        />
                       </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Thuộc danh mục</label>
                      <div class="col-sm-9">
                       <form:select path="id_category" class="select2 form-select shadow-none" style="width: 100%; height: 36px"><option>Select</option>
                         <c:forEach var="item" items="${category}">
                          <option value="${item.id_category}" >${item.id_category}</option>
                         </c:forEach>
                       </form:select>
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Tên sản phẩm</label>
                      <div class="col-sm-9">
                        <form:input path="name_product"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên danh mục"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Giá sản phẩm</label>
                      <div class="col-sm-9">
                        <form:input path="purchase_price"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên danh mục"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Giá khuyến mãi</label>
                      <div class="col-sm-9">
                        <form:input path="promotional_price"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên danh mục"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Mô tả</label>
                      <div class="col-sm-9">
                        <form:input path="desc_product"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên danh mục"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Màu sắc</label>
                      <div class="col-sm-9">
                        <form:input path="color"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên màu"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Kích thước</label>
                      <div class="col-sm-9">
                        <form:input path="size"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên danh mục"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
					 <label class="col-sm-3 control-label col-form-label">Sản phẩm mới</label>
                      <div class="col-sm-9">
                       <form:select path="new_product" class="select2 form-select shadow-none" style="width: 100%; height: 36px">
                          <option value="false">false</option>
                          <option value="true" >true</option>
                       </form:select>
                      </div>
                    </div>
                    
                    <div class="form-group row">
					 <label class="col-sm-3 control-label col-form-label">Sản phẩm nổi bật</label>
                      <div class="col-sm-9">
                       <form:select path="new_product" class="select2 form-select shadow-none" style="width: 100%; height: 36px">
                          <option value="false">false</option>
                          <option value="true" >true</option>
                       </form:select>
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="image" class="col-sm-3 control-label col-form-label">Ảnh</label>
                      <div class="col-md-9">
                       <div class="custom-file" >
                        <form:input path="image" type="file" name="img" class="custom-file-input" id="validatedCustomFile"/>
                       </div>
                  	  </div>
                  	 </div>
                  	
                  <div class="border-top">
                    <div class="card-body">
                      <button type="submit" class="btn btn-primary">
                        Submit
                      </button>
                    </div>
                  </div>
                 </div>
                </form:form>
              </div>
                        
            </div>            
          </div>
        </div>