package com.mobileshop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductModel {

	private String productId;
	private String name;
	private String type;
	private int manufacturer;
	private String manufacturerName;
	private int unit;
	private String warrantyPeriod;
	private int inventory;
	private String described;
	private long price;
	private String urlImg;
	private String avatar;
}
