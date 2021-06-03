<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>

<div>
	<div style="text-align: right;">
		<button type="button" class="btn btn-primary add-user"
			data-toggle="modal" data-target="#add-user-modal"
			style="margin-bottom: 2px;">Thêm</button>

	</div>


	<table class="table table-hover table-bordered table-striped"
		style="text-align: center; background-color: white;">
		<thead>
			<tr>

				<th scope="col">Chức vụ</th>
				<th scope="col">Mã NV</th>
				<th scope="col">Ngày sinh</th>
				<th scope="col">Giới tính</th>
				<th scope="col">Địa chỉ</th>
				<th scope="col">SĐT</th>
				<th scope="col">Email</th>
				<th scope="col">Ghi chú</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="user" items="${users}">
				<tr style="font-size: 13px; font-family: thin">
					<th scope="col">${user.position}</th>
					<th scope="col">${user.userId}</th>
					<th scope="col"><fmt:formatDate pattern="dd-MM-yyyy"
							value="${user.dob}" /></th>
					<th scope="col">
						<c:choose>
					         <c:when test = "${user.gender == true}">
					           Nam
					         </c:when>
					         <c:otherwise>
					           Nữ
					         </c:otherwise>
					      </c:choose>
					</th>

					<th scope="col">${user.address}</th>
					<th scope="col">${user.phoneNumber}</th>
					<th scope="col">${user.email}</th>
					<th scope="col">${user.note}</th>
					<th> <svg data-toggle="modal" data-target="#add-user-modal" class="btn-update-user" data="${user.userId}" xmlns="http://www.w3.org/2000/svg" width="16"
							height="16" fill="currentColor" class="bi bi-pencil-fill"
							viewBox="0 0 16 16">
												  <path
								d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"></path>
												</svg> 
						<svg class="btn-hover btn-delete-user" data="${user.userId}" xmlns="http://www.w3.org/2000/svg" width="16"
							height="16" fill="currentColor" class="bi bi-trash-fill"
							viewBox="0 0 16 16">
												  <path
								d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
												</svg>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


<!-- Modal -->
<div class="modal" tabindex="-1" role="dialog" id="add-user-modal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Thêm nhân viên</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="<c:url value="/admin/user"/>" method="post">
				<div class="modal-body">
					<div class="form-group row">
						<label for="courses-name" class="col-sm-3 col-form-label">Chức vụ:</label>
						<div class="col-sm-9">
							<select class="form-control" name="roleId" id="roleId" style="margin-bottom: 0px; float: right;"><!--  position: absolute; float: 0 -->
	                             <!-- quyền -->
	                             <c:forEach var="role" items="${roles}">
	                                 <option value="${role.roleId}" >${role.roleName}</option>
	                             </c:forEach>
	                        
	                         </select>
                         </div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Mã nhân viên:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="userId" name="userId">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Ngày sinh:</label>
						<div class="col-sm-9">
							<input class="form-control form-control-user" id="dob" type="date" name="dob"
								style="width: 200px; height: 30px; border: 1px solid #999;" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Giới tính</label>
						<div class="col-sm-9">
							<select class="form-control" name="gender" id="gender" style="margin-bottom: 0px; float: right;">
	                            <option value="1" >Nam</option>
	                            <option value="0" >Nữ</option>
	                         </select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Địa chỉ</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="address"
								name="address">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Số điện thoại</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phoneNumber"
								name="phoneNumber">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Email</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="email"
								name="email">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Chú thích</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="note"
								name="note">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Lưu</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
				</div>
			</form>

		</div>
	</div>
</div>