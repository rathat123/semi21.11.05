package com.icia.cinema.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dto.Goods;
import com.icia.cinema.service.GService;

@Controller
public class GController {

	@Autowired
	GService gsvc = new GService();
	
	ModelAndView mav= new ModelAndView();
	
	//G_uploadForm : 상품등록 페이지로
	@RequestMapping(value = "/G_uploadForm", method = RequestMethod.GET)
	public String gUploadForm() {

		return "G_Upload";
	}

	//G_upload상품 등록
	@RequestMapping(value = "/G_upload", method = RequestMethod.POST)
	public ModelAndView gUpload(@ModelAttribute Goods goods) throws IllegalStateException, IOException {

		
		mav = gsvc.gUpload(goods);

		return mav;
	}
	
	//G_list 상품 리스트
	@RequestMapping(value = "/G_list", method = RequestMethod.GET)
	public ModelAndView gList(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		// 오류방지용
		if (page <= 0) {
			page = 1;
		}

		mav = gsvc.gList(page);
		return mav;

	}
	// G_view : 상품 상세정보
			@RequestMapping(value = "/G_view", method = RequestMethod.GET)
			public ModelAndView gView(@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
					@RequestParam("GNo") int GNo) {

				mav = gsvc.gView(page, GNo);

				return mav;

			}
			//G_search : 상품 검색
			@RequestMapping(value = "G_search", method = RequestMethod.GET)
			public ModelAndView bSearch(@RequestParam("selectVal") String selectVal, @RequestParam("keyword") String keyword) {
				
				mav = gsvc.gSearch(selectVal, keyword);
				return mav;
			}
			
			// G_delete : 상품 삭제(admin계정으로만 삭제가능)
			@RequestMapping(value = "G_delete", method = RequestMethod.GET)
			public ModelAndView bDelete(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam("GNo") int GNo) {
				mav = gsvc.gDelete(page,GNo);
				return mav;
			}
			
	}
