package com.java.dto;

import java.util.ArrayList;

public class OrderPageDTO {

	private ArrayList<OrderPageItemDTO> orders;
	
	public ArrayList<OrderPageItemDTO> getOrders() {
		return orders;
	}

	public void setOrders(ArrayList<OrderPageItemDTO> orders) {
		this.orders = orders;
	}
	
	@Override
	public String toString() {
		return "OrderPageDTO [orders=" + orders + "]";
	}
	
}
