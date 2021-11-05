package com.icia.cinema.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dto.Cinema;
import com.icia.cinema.dto.Member;
import com.icia.cinema.dto.Review;
import com.icia.cinema.service.CService;

@Controller
public class CController {

	@Autowired
	private CService csvc;

	private ModelAndView mav = new ModelAndView();
	
	// C_writeForm : 영화등록 페이지로 이동
	@RequestMapping(value = "/CC_writeForm", method = RequestMethod.GET)
	public String ccWriteForm() {
		return "CC_Write";
	}

	// CC_write : 영화 등록
	@RequestMapping(value = "/CC_write", method = RequestMethod.POST)
	public ModelAndView ccWrite(@ModelAttribute Cinema cinema) throws IllegalStateException, IOException {

		mav = csvc.ccWrite(cinema);

		return mav;
	}
	
	// CC_list : 영화 목록보기(페이징처리)
		@RequestMapping(value = "/CC_list", method = RequestMethod.GET)
		public ModelAndView ccList(@RequestParam(value="page", required=false, defaultValue="1") int page) {
			
			if(page <= 0 ) {
				page = 1;
			}
			// System.out.println("[1]controll : page -> " + page);
			mav = csvc.ccList(page);
			// System.out.println("[5]controll : mav -> " + mav);
			return mav;
		}
		
		// CCS_search : 게시글 검색
		@RequestMapping(value = "CCS_search", method = RequestMethod.GET)
		public ModelAndView ccsSearch(@RequestParam("selectVal") String selectVal, @RequestParam("keyword") String keyword) {
			System.out.println("selectVal : " + selectVal);
			System.out.println("keyword : " + keyword);
			
			mav = csvc.ccsSearch(selectVal, keyword);
			return mav;
		}
		
		// CC_view : 게시글 상세보기
		@RequestMapping(value = "CC_view", method = RequestMethod.GET)
		public ModelAndView ccView(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam("cNo") int cNo) {
			mav = csvc.ccView(page, cNo);
			return mav;
		}
		
		//ajax 부분
			
		// CCR_list : 리뷰 리스트 불러오기
		@RequestMapping(value = "CCR_list", method = RequestMethod.POST)
		public @ResponseBody List<Review> rList(@RequestParam("CCBNo") int CCBNo){
			System.out.println("[1] controller --> CCBNo: " + CCBNo);
			List<Review> reviewList = csvc.rList(CCBNo);
			System.out.println("[1] controller --> reviewList: " + reviewList);
			return reviewList;	
		}
		
		 // CCR_write : 리뷰 입력
		   @RequestMapping(value = "CCR_write", method = RequestMethod.POST)
		   public @ResponseBody List<Review> rWrite(@ModelAttribute Review review) {
			  System.out.println("[1] controller --> review: " + review);
		      List<Review> reviewList = csvc.rWrite(review);
		      System.out.println("[6] controller --> review: " + reviewList);
		      return reviewList;
		   }
		   
		// CC_cMainForm : 영화 메인
			@RequestMapping(value = "/CC_cMainForm", method = RequestMethod.GET)
			public String cMainForm() {
				return "index";
			}
		   
		
		
}
