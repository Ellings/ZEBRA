package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartDTO {

	// DB에 있는 변수
	private int cartId;
	private String MID;
	private int pno;
	private int ONO;
	private int cartCount;
	
	// Product
	private String pname;
	private int pprice;
	private String pmainimg;
	
	// 추가 변수
	private int totalPrice; 
	
	@Override
	public String toString() {
		return "CartDTO [cartid=" + cartId + ", MID=" + MID + ", pno=" + pno + ", cartCount="
				+ cartCount + ",pname=" + pname + ",ONO=" + ONO + ", pprice=" + pprice + ", pmainimg=" + pmainimg + ", totalPrice=" + totalPrice + "]";
	}    
	   
	public void initSaleTotal() {
		this.totalPrice = this.pprice*this.cartCount;
		
	}
}
