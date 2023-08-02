package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.OrderDto;
import com.java.dto.OrderPageItemDTO;
import com.java.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public void insertOne(OrderDto odto) {
		// 수령자 1명 저장
		orderMapper.insertOne(odto);
		
	}
	
	
	@Override
	public ArrayList<OrderPageItemDTO> getGoodsInfo(ArrayList<OrderPageItemDTO> orders) {
		
		ArrayList<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();				
		for(OrderPageItemDTO ord : orders) {			
			OrderPageItemDTO goodsInfo = orderMapper.getGoodsInfo(ord.getPno());	
			goodsInfo.setCartCount(ord.getCartCount());				
			result.add(goodsInfo);			
		}		
		
		return result;
	}
	
	//수령자 정보 1개가져오기
		@Override 
		public OrderDto selectOne(int ONO) {
			OrderDto odto = orderMapper.selectOne(ONO);
			
			return odto;
		}

}
