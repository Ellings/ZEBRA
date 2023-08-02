package com.java.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDto {

	private int ONO; //주문번호
	private String MID;
	private int PNO;
	private int OAMOUNT; //주문수량
	private int OTOPRICE; //총금액
	private String ONAME; //주문자 이름
	
	private String OHP;// 휴대폰번호 OHP1+OHP2+OHP3 테이블엔 없어도됨
	private String OHP1;
	private String OHP2;
	private String OHP3;
	
	private String OZIP; //우편번호
	
	private String OADDR; //주소 OADDR1+OADDR2 테이블엔 없어도됨
	private String OADDR1; //기본주소
	private String OADDR2; //상세주소
	
	private String ORHP;//유선번호 ORHP1+ORHP2+ORHP3 테이블엔 없어도됨
	private String ORHP1;
	private String ORHP2;
	private String ORHP3;
	
	private String OSTATUS; //배송상태
	private String OWANT; //배송요청사항
	private String OPAYMENT; //결제수단
	private String OCOMPLETE; //결제완료여부
	private Date ODATE; //주문날짜

	
	
	 public void setOno(int ONO) {
	        this.ONO = ONO;
	    }
}
