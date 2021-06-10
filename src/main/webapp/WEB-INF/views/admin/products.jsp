<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<div>
	<div style="text-align: center;" >
		<h3 style="color: blue;">
			<strong>
				QUẢN LÝ SẢN PHẨM		
			</strong>
		</h3>
	</div>
	
	<hr>
	
	<div class="form-group row">

		<form class="input-group col col-sm-8" action="<c:url value="/admin/products"/>" method="get">
			<input type="text" class="form-control"
				placeholder="Tìm kiếm... " aria-label="Tìm kiếm"
				aria-describedby="basic-addon2" name=search>
			<div class="input-group-append">
				<button class="btn btn-primary" type="submit">Tìm</button>
			</div>
		 </form>
		
		<div style="text-align: right;" class="col col-sm-4">
			<button type="button" class="btn btn-primary add-user"
				data-toggle="modal" data-target="#add-product-modal"
				style="margin-bottom: 2px;">Thêm</button>
	
		</div>
	</div>
	<table class="table table-hover table-bordered table-striped"
		style="text-align: center; background-color: white;">
		<thead>
			<tr>

				<th scope="col">mã hàng</th>
				<th scope="col">tên hàng</th>
				<th scope="col">loại hàng</th>
				<th scope="col">hãng sản xuất</th>
				<th scope="col">thời gian bảo hành</th>
				<th scope="col">số lượng tồn kho</th>
				<th scope="col">Mô tả</th>
				<th scope="col">giá</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="product" items="${products}">
				<tr style="font-size: 13px; font-family: thin">
					<th scope="col">${product.productId}</th>
					<th scope="col">${product.name}</th>
					<th scope="col">${product.type}</th>
					<th scope="col">${product.manufacturer}</th>

					<th scope="col">${product.warrantyPeriod}</th>
					<th scope="col">${product.inventory}</th>
					<th scope="col">${product.described}</th>
					<th scope="col">
						<fmt:formatNumber value = "${product.price}" type = "currency" currencyCode="VND" maxFractionDigits="0"/>
					</th>

					<th>
						<div style="display: inline-flex;">
							<svg data-toggle="modal" data-target="#add-product-modal"
								class="btn-update-product" data="${product.productId}"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
								<path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"></path>
							</svg> 
							<svg class="btn-hover btn-delete-product"
								data="${product.productId}" xmlns="http://www.w3.org/2000/svg"
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
<div class="modal" tabindex="-1" role="dialog" id="add-product-modal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Thêm sản phẩm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form id="form-product-save" action="<c:url value="/admin/product"/>" method="post">
				<div class="modal-body">
					<div class="form-group row">
						<label for="courses-name" class="col-sm-3 col-form-label">Mã hàng:</label>
							<div class="col-sm-9">
							<input type="text" class="form-control" id="productId" name="productId">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Tên hàng:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Loại hàng:</label>
						<div class="col-sm-9">
							<input class="form-control form-control-user" id="type" type="text" name="type" />
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Hãng sản xuất</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="manufacturer"
								name="manufacturer">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Thời gian bảo hành</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="warrantyPeriod"
								name="warrantyPeriod">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Số lượng hàng tồn</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="inventory"
								name="inventory">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Mô tả</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="described"
								name="described">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Giá</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="price"
								name="price">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label">Hình ảnh</label>
						<div class="col-sm-9">
							<input type="file" class="form-control" id="imgs" multiple>
						</div>
					</div>
					<input id="imgs-save" hidden="true" name="urlImg"/>
				</div>
				<div class="modal-footer">
					<button id="btn-save-product" type="submit" class="btn btn-primary">Lưu</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Hủy</button>
				</div>
			</form>

		</div>
	</div>
</div>
