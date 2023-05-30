<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 d-flex no-block align-items-center">
              <a href="<c:url value="/admin/load-account"/>" class="page-title"><p style="font-size:larger" >Go back</p></a>
            </div>
          </div>
        </div>

        <div class="container-fluid">
          <!-- Start Page Content -->
          <div class="row">
            <div class="col-md-7">
              <div class="card">
                <form:form action="" method="POST" modelAttribute="account" class="form-horizontal">
                  <div class="card-body">
                    <h4 class="card-title">Chỉnh sửa</h4>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Mã tài khoản</label>
                      <div class="col-sm-9">
                        <form:input path="id"
                          readonly="true"
                          type="text"
                          class="form-control"
                          id="fname"
                          placeholder="Tên danh mục"
                        />
                      </div>
                    </div>
                    
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Tên đăng nhập</label>
                      <div class="col-sm-9">
                        <form:input path="login_name"
                          readonly="true"
                          type="text"
                          class="form-control"
                          id="fname"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Mật Khẩu</label>
                      <div class="col-sm-9">
                        <form:input path="hashed_passwd"
                        readonly="true"
                          type="password"
                          class="form-control"
                          id="fname"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="fname" class="col-sm-3 control-label col-form-label">Họ tên đầy đủ</label>
                      <div class="col-sm-9">
                        <form:input path="full_name"
                        readonly="true"
                          type="text"
                          class="form-control"
                          id="fname"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                     <label for="lname" class="col-sm-3 control-label col-form-label">Số điện thoại</label>
                      <div class="col-sm-9">
                        <form:input path="phone"
                          readonly="true"
                          type="text"
                          class="form-control"
                          id="lname"
                        />
                      </div>
                    </div>
                    
                    <div class="form-group row">
                      <label for="lname" class="col-sm-3 control-label col-form-label">Email</label>
                       <div class="col-sm-9">
                        <form:input path="email"
                          readonly="true"
                          type="text"
                          class="form-control"
                          id="lname"
                        />
                       </div>
                    </div>
                    
                    <div class="form-group row">
					 <label class="col-sm-3 control-label col-form-label">Đã xóa</label>
                      <div class="col-sm-9">
                       <form:select path="is_delete" class="select2 form-select shadow-none" style="width: 100%; height: 36px">
                          <option value="false">false</option>
                          <option value="true" >true</option>
                       </form:select>
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