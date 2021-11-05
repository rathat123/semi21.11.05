package com.icia.cinema.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dao.GDAO;
import com.icia.cinema.dto.Goods;
import com.icia.cinema.dto.Page;
import com.icia.cinema.dto.QNA;

@Service
public class GService {

	@Autowired
	GDAO dao = new GDAO();
	
	ModelAndView mav = new ModelAndView();
	
	
	public ModelAndView gUpload(Goods goods) throws IllegalStateException, IOException {


		MultipartFile GPhoto = goods.getGPhotoName();
		String GPhotoName = GPhoto.getOriginalFilename();
		
		// 파일 저장위치
		String savePath = "F:/work/springtools/CENEMA/src/main/webapp/resources/gphoto/"
						+ GPhotoName;

				// 파일이 선택됐다면
				if (!GPhoto.isEmpty()) {
					
					GPhoto.transferTo(new File(savePath));
				}
		goods.setGPhoto(GPhotoName);
		int result = dao.gUpload(goods);
		
		if(result>0) {
			mav.setViewName("index");
		}
		
		return mav;
	}


	private static final int PAGE_LIMIT = 8;
	private static final int BLOCK_LIMIT = 5; 
	
	
	
	
	
	public ModelAndView gList(int page) {
		Page paging = new Page();

		// 전체 상품 개수 조회
		int listCount = dao.gListCount();
		
		int startRow = (page - 1) * PAGE_LIMIT + 1;
		int endRow = page * PAGE_LIMIT;
		
		int maxPage = (int) (Math.ceil((double) listCount / PAGE_LIMIT));
		int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
		int endPage = startPage + BLOCK_LIMIT - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);

		///////////////////////////// 여기까지 페이징 처리

		List<Goods> goodsList = dao.gList(paging);
		
		
		mav.addObject("goodsList", goodsList);
		mav.addObject("paging", paging);
		mav.setViewName("G_List");

		return mav;
	}




	//상품 상세정보
	public ModelAndView gView(int page, int GNo) {

		Goods goods = dao.gView(GNo);

		mav.addObject("goods", goods);
		mav.addObject("page", page);
		mav.setViewName("G_View");

		return mav;
	}

	//상품 검색
	public ModelAndView gSearch(String selectVal, String keyword) {
		List<Goods> goods = dao.gSearch(selectVal, keyword);
		
		mav.addObject("goodsList", goods);
		mav.setViewName("G_List");
		
		return mav;
	}




	public ModelAndView gDelete(int page, int GNo) {
		int result = dao.gDelete(GNo);
		
		if(result>0) {
			mav.addObject("page" ,page);
			mav.setViewName("redirect:/G_list");
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}
}
