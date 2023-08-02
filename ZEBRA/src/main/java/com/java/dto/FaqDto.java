package com.java.dto;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FaqDto {

		private int fno;
		private int fqa; // 1:문의 0:답변 완료
		private String fcategory;
		private String ftitle;
		private String fcontent;
		private String mid;
		private Timestamp fdate;
		private String ffile;	
		
		
				
}
