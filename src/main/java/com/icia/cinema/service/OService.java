package com.icia.cinema.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dao.ODAO;
import com.icia.cinema.dto.Order;

@Service
public class OService {
	
	@Autowired
	ODAO dao = new ODAO();
	
	ModelAndView mav = new ModelAndView();
	public ModelAndView oCart(int page, Order order) {
		int result = dao.oCart(order);
		
		if(result>0) {
			mav.setViewName("redirect:/G_list");
		}
		
		return mav;
	}
	public ModelAndView oView(int page) {
		List<Order> orderList = dao.oView();
		String sum = dao.oSum();
		mav.addObject("sum",sum);
		mav.addObject("order",orderList);
		mav.setViewName("O_View");
		
		return mav;
	}
	public ModelAndView oCheckOut() {
		int result = dao.oCheckOut();
		if (result>0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("redirect:/G_list");
		}
		return mav;
	}
	public ModelAndView oDelete(int GNo) {
		int result = dao.oDelete(GNo);
		if (result>0) {
			mav.setViewName("redirect:/O_view");
		} else {
			mav.setViewName("index");
		}
		return mav;
	}

}
