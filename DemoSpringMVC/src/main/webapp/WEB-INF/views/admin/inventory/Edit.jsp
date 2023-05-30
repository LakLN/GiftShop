<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
              <a href="<c:url value="/admin/load-inventory"/>" class="page-title">Go back</a>
            </div>
          </div>
        </div>
		
        <div class="container-fluid">
          <!-- Start Page Content -->
          <div class="row">
            <div class="col-md-7">
              <div class="card">
                <form:form action="" method="POST" modelAttribute="inventory" class="form-horizontal">
                  <div class="card-body">
                    <h4 class="card-title">Chỉnh sửa</h4>
                    
                     <div class="form-group row">
                      <label for="fname" class="col-sm-3 control-label col-form-label">Mã tồn kho</label>
                       <div class="col-sm-9">
                        <form:input path="id"
                          readonly="true"
                          type="text"
                          class="form-control"
                          id="fname"
                        />
                       </div>
                    </div>
                    
                    <div class="form-group row">
                      <label
                        for="fname" class="col-sm-3 control-label col-form-label">Mã sản phẩm</label>
                      <div class="col-sm-9">
                        <form:input path="id_product"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên sản phẩm"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="lname" class="col-sm-3 control-label col-form-label">Giá Bán</label>
                      <div class="col-sm-9">
                        <form:input path="sale_price"
                          type="text"
                          class="form-control"
                          id="lname"
                          placeholder="Đồng"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="lname" class="col-sm-3 control-label col-form-label">Tồn Kho</label>
                      <div class="col-sm-9">
                        <form:input path="quantity"
                          type="text"
                          class="form-control"
                          id="lname"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="lname" class="col-sm-3 control-label col-form-label">Đã Bán</label>
                      <div class="col-sm-9">
                        <form:input path="sold"
                          type="text"
                          class="form-control"
                          id="lname"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="lname" class="col-sm-3 control-label col-form-label">Ngày tạo</label>
                      <div class="col-sm-9">
                        <form:input path="create_at"
                          readonly="true"
                          type="text"
                          class="form-control"
                          id="lname"
                          placeholder="yyyy-mm-dd"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label for="lname" class="col-sm-3 control-label col-form-label">Ngày cập nhật</label>
                       <div class="col-sm-9">
                        <form:input path="update_at"
                          readonly="true"
                          type="text"
                          class="form-control"
                          id="lname"
                          placeholder="yyyy-mm-dd"
                        />
                       </div>
                    </div>
                    
                    
                  
                  <div class="border-top">
                    <div class="card-body">
                      <button type="submit" class="btn btn-primary">
                        Submit
                      </button>
                    </div>
                  </div>
               </form:form>
              </div>
            </div>            
          </div>
        </div>
        