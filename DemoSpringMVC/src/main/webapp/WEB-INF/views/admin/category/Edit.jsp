<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
              <a href="<c:url value="/admin/load-category"/>" class="page-title"><p style="font-size:larger">Go back</p></a>
            </div>
          </div>
        </div>
		
        <div class="container-fluid">
          <!-- Start Page Content -->
          <div class="row">
            <div class="col-md-7">
              <div class="card">
                <form:form action="" method="POST" modelAttribute="category" class="form-horizontal">
                  <div class="card-body">
                    <h4 class="card-title">Chỉnh sửa</h4>
                    
                     <div class="form-group row">
                      <label for="fname" class="col-sm-3 control-label col-form-label">Mã danh mục</label>
                       <div class="col-sm-9">
                        <form:input path="id"
                          readonly="true"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên sản phẩm"
                        />
                       </div>
                    </div>
                    
                    <div class="form-group row">
                      <label
                        for="fname" class="col-sm-3 control-label col-form-label">Tên danh mục</label>
                      <div class="col-sm-9">
                        <form:input path="cate_name"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên sản phẩm"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="lname" class="col-sm-3 control-label col-form-label">Mô tả</label>
                      <div class="col-sm-9">
                        <form:input path="cate_desc"
                          type="text"
                          class="form-control"
                          id="lname"
                          placeholder="Mô tả"
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
                          placeholder="Mô tả"
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
                          placeholder="Mô tả"
                        />
                       </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="lname" class="col-sm-3 control-label col-form-label">Thuộc danh mục</label>
                      <div class="col-sm-9">
                        <form:input path="id_category"
                          type="text"
                          class="form-control"
                          placeholder="id danh mục"
                        />
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
               </form:form>
              </div>
            </div>            
          </div>
        </div>
        