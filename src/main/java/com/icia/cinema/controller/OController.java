package com.icia.cinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dto.Order;
import com.icia.cinema.service.OService;


@Controller
public class OController {
	
	@Autowired
	OService osvc = new OService();
	
	ModelAndView mav= new ModelAndView();
	
	// O_Cart : 장바구니 담기
	@RequestMapping(value = "/O_cart", method = RequestMethod.GET)
	public ModelAndView oCart(@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
	@ModelAttribute Order order) {
		mav = osvc.oCart(page, order);
		return mav;
	}
	
	// O_view : 장바구니 페이지로 이동
		@RequestMapping(value = "/O_view", method = RequestMethod.GET)
		public ModelAndView oView(@RequestParam(value = "page", required = false, defaultValue = "1") int page 
		) {
			mav=osvc.oView(page);
			return mav;
		}
	// O_checkOut : 결제 후 테이블 리셋
	@RequestMapping(value = "/O_checkOut", method = RequestMethod.GET)
	public ModelAndView oCheckOut() {
		mav=osvc.oCheckOut();
		return mav;
	}
	// O_delete : 특정제거
	@RequestMapping(value = "/O_delete", method = RequestMethod.GET)
	public ModelAndView oDelete(@RequestParam(value = "GNo") int GNo) {
		mav=osvc.oDelete(GNo);
		return mav;
	}
}
