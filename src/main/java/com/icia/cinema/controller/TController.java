package com.icia.cinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dto.Cinema;
import com.icia.cinema.dto.Ticket;
import com.icia.cinema.service.TService;

@Controller
public class TController {

	@Autowired
	private TService tsvc;
	
	private ModelAndView mav = new ModelAndView();
	
	// T_buyForm
	@RequestMapping(value = "/T_buyForm", method = RequestMethod.GET)
	public ModelAndView T_buyForm(@RequestParam("CNo")int CNo){
		
		mav = tsvc.tBuy(CNo);
		return mav;
		
	}
	
	// T_buy
	@RequestMapping(value = "/T_buy", method = RequestMethod.POST)
	public ModelAndView T_buy(@ModelAttribute Ticket ticket){
		
		System.out.println("1. controller -> ticket : " + ticket);
		mav = tsvc.tBuy2(ticket);
		System.out.println("5. controller -> mav : " + mav);
		return mav;
	}
	
	//T_view
	@RequestMapping(value = "/T_view", method = RequestMethod.GET)
	public ModelAndView T_view(@RequestParam("MId") String MId){
		mav = tsvc.tview(MId);
		return mav;
	}
	
	// T_checkOut : 결제 후 테이블 리셋
	@RequestMapping(value = "/T_checkOut", method = RequestMethod.GET)
	public ModelAndView tCheckOut() {
		mav=tsvc.tCheckOut();
		return mav;
	}
	
}
