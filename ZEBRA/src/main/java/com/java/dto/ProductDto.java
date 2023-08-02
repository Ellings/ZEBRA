package com.java.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductDto {

	private int pno;
	private String pname;
	private int pcode;
	private String pdescript;
	private Integer pprice;
	private int pstock;
	private int psoldcount;
	private int phit;
	private String pmainimg;
	private String pdetailimg1,pdetailimg2, pdetailimg3;
	private String pcolor;            
	private String psize;            
	
	 
	
}
