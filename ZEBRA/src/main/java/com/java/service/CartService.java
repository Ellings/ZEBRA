package com.java.service;

import java.util.ArrayList;

import com.java.dto.CartDTO;

public interface CartService {
	
	/* 장바구니 추가 */
	public int addCart(CartDTO cart);
	
	/* 카트 삭제 */
	void deleteCart(int cartId);

	/* 카트 수량 수정 */
	public int modifyCount(CartDTO cart);

	/* 장바구니 정보 리스트 */
	public ArrayList<CartDTO> getCartList(String MID);

	void checkCart();

	void modifyCart();
	
	//업데이트
	public void updateONO(CartDTO cdto);

	
	
	
}
