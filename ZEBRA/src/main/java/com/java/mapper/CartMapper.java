package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.CartDTO;

@Mapper
public interface CartMapper {

	/* 카트 추가 */
	public int addCart(CartDTO cart) throws Exception;
		
	/* 카트 삭제 */
	int deleteCart(int cartId);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartDTO cart);
	
	/* 카트 목록 */
	public ArrayList<CartDTO> getCart(String MID);
	
	/* 카트 확인 */
	public CartDTO checkCart(CartDTO cart);
	
	//ono 업데이트
	public void updateONO(CartDTO cdto);

	
	
}
