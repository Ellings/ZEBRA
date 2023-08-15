package com.java.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor // 전체 생성자
@NoArgsConstructor // 기본 생성자
@Data // 게터&세터
public class MemberDto {

	private int MCODE;
	private String MID ;
	private String MPASSWORD;
	private String MNAME ;
	private String MGENDER;
	private String MBIRTH;
	private String MPHONE ;
	private String MEMAIL ;
	private String MZIP;
	private Date MJOINDAY ;
	private int MTOTAL_PAY ;
	private int MTOTAL_ORDER ;
	private int MAGREE;
	private String MADDR; //주소
	
	private String MPHONE1 ;
	private String MPHONE2 ;
	private String MPHONE3 ;
	private String MBIRTH1;
	private String MBIRTH2;
	private String MBIRTH3;
	private String MEMAIL1 ;
	private String MEMAIL2 ;
	private String MEMAIL3 ;
	private String MADDR1; //기본주소
	private String MADDR2; //상세주소
	
	public String getFormattedJoinDay() {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    return sdf.format(MJOINDAY);	    
	}
	
	public void setMJOINDAY(String MJOINDAY) throws ParseException {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    this.MJOINDAY = sdf.parse(MJOINDAY);
	    
	}
}
