package com.java.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.OrderDto;
import com.java.dto.OrderPageItemDTO;

@Mapper
public interface OrderMapper {

	/* 주문 상품 정보 */	
	public OrderPageItemDTO getGoodsInfo(int pno);
	
	// 수령자 정보 1개 저장하기
	void insertOne(OrderDto odto);
	
	//수령자 정보 1개 가져오기
	OrderDto selectOne(int ONO);

	//주문 관리에 주문 판매 개수 증가하기
<<<<<<< HEAD
	public void updatePsoldcount(int ONO);
=======
	public void updatePsoldcount(int oNO);
>>>>>>> branch 'master' of https://github.com/Ellings/ZEBRA.git
	
}
