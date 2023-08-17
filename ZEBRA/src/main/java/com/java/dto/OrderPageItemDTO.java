package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderPageItemDTO {

	/* 뷰로부터 전달받을 값 */
    private int pno;    
    private int pstock;
    
	/* DB로부터 꺼내올 값 */
    private String pname;    
    private int pprice;    
    
	/* 만들어 낼 값 */
    private int salePrice;    
    private int totalPrice; 
    
    public void initSaleTotal() {
		this.salePrice = (int) (this.pprice);
		this.totalPrice = this.salePrice*this.pstock;
	}
    
    @Override
	public String toString() {
		return "OrderPageItemDTO [pno=" + pno + ", pstock=" + pstock + ", pname=" + pname
				+ ", pprice=" + pprice + ",  salePrice=" + salePrice + ", totalPrice=" + totalPrice + "]";
		
	}	
}
