<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../common/taglib.jsp"%>
<main>

<style>
	#main-image>div>div {
		overflow: visible;
	}
	
	#main-image ul {
		height: 250px;
		overflow: auto !important;
	}
</style>


	<!-- slider Area End-->
	<!-- Team-profile Start -->
	<div class="team-profile team-padding"
		style="padding-top: 50px; padding-bottom: 50px;">
		<div class="container">

			<h2 class="card-title" style="color: blue">>Kết quả tìm kiếm</h2>
			<h3 style="color: blue;"></h3>
			<div class="row">
				<c:forEach var="product" items="${products}">
					<div class="col-xl-3 col-lg-3 col-md-6">
						<a class="small" href="<c:url value='/product-detail/${product.productId}'/>">
							<div class="single-profile mb-30"
								style="background-color: white; border-radius: 10px 10px 10px 10px;">
								<!-- Front -->
								<div class="single-profile-front" style="height: 350px;">
									<div class="profile-img">
										<img style="height: 250px;"
											src="${product.avatar}" alt=""
											style="border-radius: 10px 10px 10px 10px;">

									</div>
									<div class="profile-caption"
										style="margin-left: 5px; margin-right: 5px;">
										<h6 class="title" style="color: black;">${product.name}</h6>
										<h5 style="color: blue;">
											<fmt:formatNumber value = "${product.price}" type = "currency" currencyCode="VND" maxFractionDigits="0"/>
										</h5>
									</div>
								</div>
							</div>

						</a>
					</div>
				</c:forEach>
				
			</div>

		</div>
	</div>
</main>