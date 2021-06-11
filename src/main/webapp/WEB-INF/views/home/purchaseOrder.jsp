<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../../common/taglib.jsp"%>
<style>
#main-image>div>div {
	overflow: visible;
}

#main-image ul {
	height: 250px;
	overflow: auto !important;
}
</style>
<div class="team-profile team-padding"
	style="padding-top: 50px; padding-bottom: 50px;">
	<div class="container">
		<div class="row" style="margin-top: 10px;">

			<div class="col-xl-2 col-lg-2"></div>

			<div class="col-xl-8 col-lg-8">
				<h2 class="card-title" style="color: blue;">>Đơn mua</h2>
				<ul>
					<c:forEach var="productInCartDto" items="${productInCartDtos}">
						<li>

							<div class="row">
								<div class="col-xl-4 col-lg-4">
									<a class="small" href="<c:url value='/detail'/>">
										<div class="single-profile mb-30"
											style="background-color: white; border-radius: 0px 0px 10px 10px; border: 1px solid #BDBDBD;">
											<!-- Front -->
											<div class="single-profile-front" style="height: 350px;">
												<div class="profile-img">
													<img style="height: 300px;"
														src="${productInCartDto.avatar}" alt=""
														style="border-radius: 10px;">

												</div>

											</div>
										</div>


									</a>
								</div>
								<div class="col-xl-8 col-lg-8">

									<div class="row" style="margin-bottom: 5px;">
										<h3 style="color: blue;">${productInCartDto.name}</h3>
									</div>

									<div class="row" style="background-color: #fafafa;">
										<h5 style="color: red; margin-right: 50px;">
											<fmt:formatNumber value = "${productInCartDto.price}" type = "currency" currencyCode="VND" maxFractionDigits="0"/>
										</h5>
										
									</div>
									<div class="row"
										style="background-color: #fafafa; margin-top: 10px;">
										<p>${productInCartDto.described}</p>
									</div>
									<div class="row" style="margin-top: 10px;">
										<label class="col-sm-3 col-form-label">Số lượng: ${productInCartDto.amount}</label>
										
										<div class=" col-xl-6 col-lg-6 col-md-6"
											style="text-align: right;">
											<p>
												Trạng thái: <span style="color: red;">Đang giao</span>
											</p>

										</div>
									</div>
									<div style="margin-top: 10px; text-align: right;">
										<h5 style="color: blue;">Tổng : <fmt:formatNumber value = "${productInCartDto.prices}" type = "currency" currencyCode="VND" maxFractionDigits="0"/> </h5>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>

			</div>
			


			<div class="col-xl-2 col-lg-2"></div>

		</div>
	</div>
</div>
