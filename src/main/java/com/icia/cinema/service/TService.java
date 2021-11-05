package com.icia.cinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dao.TDAO;
import com.icia.cinema.dto.Cinema;
import com.icia.cinema.dto.Ticket;

@Service
public class TService {

	@Autowired
	private TDAO dao;
	
	private ModelAndView mav = new ModelAndView();
	
	// ticket form
	public ModelAndView tBuy(int cNo) {
		Cinema cinema = dao.tBuy(cNo);
		mav.addObject("Ticket", cinema);
		mav.setViewName("T_Buy");
		return mav;
	}

	// ticket 구매
	public ModelAndView tBuy2(Ticket ticket) {
		System.out.println("2. service -> ticket : " + ticket);
		
		int result = dao.tBuy2(ticket);
		
		System.out.println("4. service -> result : " + result);
		if (result >0) {
			mav.setViewName("redirect:/T_view?MId=" +ticket.getMId());
		} else {
			mav.setViewName("redirect:/CC_list");
		}
		return mav;
	}

	
	public ModelAndView tview(String mId) {
		
		String Sum = dao.tTotal(mId);
		Ticket ticket = dao.tView(mId);
		
		mav.addObject("view",ticket);
		mav.addObject("Sum",Sum);
		mav.setViewName("T_View");
		return mav;
	}

	public ModelAndView tCheckOut() {
		int result = dao.tCheckOut();
		if (result>0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("redirect:/G_list");
		}
		return mav;
	}

	
	
}
