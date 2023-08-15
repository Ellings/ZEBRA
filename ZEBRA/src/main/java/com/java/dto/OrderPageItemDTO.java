package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderPageItemDTO {

	/* 뷰로부터 전달받을 값 */
    private int MID;
    private int cartCount; 
    private String oaddr1;
    private String oaddr2;
    
	/* DB로부터 꺼내올 값 */
    private int pno;
    private int pprice;    
    
	/* 만들어 낼 값 */
    private int totalPrice;
    
    @Override
	public String toString() {
		return "OrderPageItemDTO [MID=" + MID + ", cartCount=" + cartCount + ", pno=" + pno
				+ ", pprice=" + pprice + ", totalPrice=" + totalPrice + "]";
	}
	
}
