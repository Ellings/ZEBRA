package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.OrderDto;
import com.java.dto.OrderPageItemDTO;

public interface OrderService {

	/* 주문 정보 */
	public ArrayList<OrderPageItemDTO> getGoodsInfo(ArrayList<OrderPageItemDTO> orders);
	
	//수령자 정보 1개 저장
	void insertOne(OrderDto orderDto);
	
	//수령자 정보 1개가져오기
	OrderDto selectOne(int ONO);
}
