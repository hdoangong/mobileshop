<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<div>
	
	<div style="text-align: center;" >
		<h3 style="color: blue;">
			<strong>
				QUẢN LÝ ĐƠN HÀNG		
			</strong>
		</h3>
	</div>
	
	<hr>
	
	<div class="form-group row">

		<form class="input-group col col-sm-8" action="<c:url value="/admin/books"/>" method="get">
			<input type="text" class="form-control"
				placeholder="Tìm kiếm... " aria-label="Tìm kiếm"
				aria-describedby="basic-addon2" name=search>
			<div class="input-group-append">
				<button class="btn btn-primary" type="submit">Tìm</button>
			</div>
		 </form>
		
		<!-- <div style="text-align: right;" class="col col-sm-4">
			<button type="button" class="btn btn-primary add-user"
				data-toggle="modal" data-target="#add-book-modal"
				style="margin-bottom: 2px;">Thêm</button>
	
		</div> -->
	</div>

	<table class="table table-hover table-bordered table-striped"
		style="text-align: center; background-color: white;">
		<thead>
			<tr>

				<th scope="col">Mã SP</th>
				<th scope="col">Tên SP</th>
				<th scope="col">Khách hàng</th>
				<th scope="col">Số điện thoại</th>
				<th scope="col">Đ/c giao hàng</th>
				<th scope="col">Số lượng</th>
				<th scope="col">Giá</th>
				
				<th scope="col">Thời gian </th>
				<th scope="col">Thành tiền </th>
				<th scope="col">Phương thức thanh toán</th>
				<th scope="col">Ghi chú </th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${bookTable}">
			

				<tr style="font-size: 13px; font-family: thin">
					<th scope="col">${book.productId}</th>
					<th scope="col">${book.name}</th>
					<th scope="col">${book.username}</th>
					
					<th scope="col">${book.phone}</th>
					<th scope="col">${book.address}</th>
					<th scope="col">${book.amount}</th>
					<th scope="col">
						<fmt:formatNumber value = "${book.price}" type = "currency" currencyCode="VND" maxFractionDigits="0"/>
					</th>
					
					<th scope="col">${book.time}</th>

					<th scope="col">
						<fmt:formatNumber value = "${book.total}" type = "currency" currencyCode="VND" maxFractionDigits="0"/>
					</th>
					<th scope="col">${book.paymentMethods}</th>
					<th scope="col">${book.note}</th>

					<th>
						<div style="display: inline-flex;">
							<svg data-toggle="modal" data-target="#add-book-modal"
								class="btn-update-book" data="${book.productId}~${book.userId}~${book.time}"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
								<path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"></path>
							</svg> 
							<svg class="btn-hover btn-delete-book"
								data="${book.productId}~${book.userId}~${book.time}" xmlns="http://www.w3.org/2000/svg"
								width="16" height="16" fill="currentColor"
								class="bi bi-trash-fill" viewBox="0 0 16 16">
								<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
							</svg>
						</div>

					</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- Modal -->
<div class="modal" tabindex="-1" role="dialog" id="add-book-modal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Thêm/Sửa đơn hàng</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="<c:url value="/admin/book"/>" method="post">
				<div class="modal-body">
					<div class="form-group row">
						<input name ="time" id="time" type="hidden" />
						<label for="courses-name" class="col-sm-3 col-form-label">Mã SP:</label>
							<div class="col-sm-9">
							<select class="form-control" name="productId" id="productId" style="margin-bottom: 0px; float: right;"><!--  position: absolute; float: 0 -->
	                             <!-- quyền -->
	                             <c:forEach var="product" items="${products}">
	                                 <option value="${product.productId}" >${product.productId} - ${product.name}</option>
	                             </c:forEach>
	                        
	                         </select>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Người đặt hàng:</label>
						<div class="col-sm-9">
							<select class="form-control" name="userId" id="userId" style="margin-bottom: 0px; float: right;"><!--  position: absolute; float: 0 -->
	                             <!-- quyền -->
	                             <c:forEach var="user" items="${users}">
	                                 <option value="${user.userId}" >${user.userId} - ${user.name}</option>
	                             </c:forEach>
	                        
	                         </select>
						</div>
					</div>
					<!-- <div class="form-group row">
						<label class="col-sm-3 col-form-label">Thời gian đặt hàng:</label> // lấy từ hệ thống
						<div class="col-sm-9">
							<input class="form-control form-control-user" id="time" type="text" name="time" />
						</div>
					</div> -->
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Số lượng</label>
						<div class="col-sm-9">
							<input type="number"  min="1"class="form-control" id="amount"
								name="amount">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Đ/C giao hàng</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="address"
								name="address">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Phương thức thanh toán</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="paymentMethods"
								name="paymentMethods">
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

