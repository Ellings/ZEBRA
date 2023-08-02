package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CommentDto {
	
	private int cno;
	private int pno;
	private String mid;
	private String cpw;
	private String ccontent;
	private Timestamp cdate;

}