package com.icia.cinema.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dao.CDAO;
import com.icia.cinema.dto.Cinema;
import com.icia.cinema.dto.Page;
import com.icia.cinema.dto.Review;


@Service
public class CService {

	@Autowired
	private CDAO dao;
	
	private ModelAndView mav = new ModelAndView();

	public ModelAndView ccWrite(Cinema cinema) throws IllegalStateException, IOException {
		//System.out.println("[2]service : board -> " + board);
		
		// 파일 이름 불러오기
		MultipartFile CPoster = cinema.getCPoster();
		String CPosterName = CPoster.getOriginalFilename();
		
		// 파일 저장경로 설정하기 : [1]마지막에 '/' 꼭 써주기! [2] +bFileName 해주기!
		String savePath = "F:/work/springtools/CENEMA/src/main/webapp/resources/cinema/"
				+ CPosterName; 
		
		if(!CPoster.isEmpty()) {
			cinema.setCPosterName(CPosterName);
			CPoster.transferTo(new File(savePath));
		}
		
		int result = dao.ccWrite(cinema);
		
		if(result>0) {
			mav.setViewName("redirect:/CC_list");
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}

	// 메소드 밖, BoardService클래스 안에서 지정
			private static final int PAGE_LIMIT = 5;	// 한 페이지에 보여줄 글 갯수
			private static final int BLOCK_LIMIT = 5;	// 한 페이지에 보여줄 페이지 번호 갯수
			
			public ModelAndView ccList(int page) {
				// BoardService.out.println("[2-1]service : page -> " + page);
				Page paging = new Page();
				
				// 전체 게시글 갯수 조회
				int listCount = dao.ccListCount();
				// System.out.println("[2-2]service : listCount -> " + listCount);
				
				int startRow = (page - 1) * PAGE_LIMIT + 1;
				int endRow = page * PAGE_LIMIT;
				
				
				// Math.ceil()  : 올림
				// Math.floor() : 버림
				// Math.round() : 반올림
				int maxPage = (int) (Math.ceil((double)listCount / PAGE_LIMIT ));
				int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) -1 ) * BLOCK_LIMIT + 1;
				int endPage = startPage + BLOCK_LIMIT - 1;
				
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				paging.setPage(page);
				paging.setStartRow(startRow);
				paging.setEndRow(endRow);
				paging.setMaxPage(maxPage);
				paging.setStartPage(startPage);
				paging.setEndPage(endPage);
				
				/////////////////////////////////////////////////////////////////////////////////////////////
				
				List<Cinema> cinemaList = dao.ccList(paging);
				// System.out.println("[4]service : boardList -> " + boardList);
				
				mav.addObject("cinemaList", cinemaList);
				mav.addObject("paging", paging);
				mav.setViewName("CC_List");
				
				return mav;
			}

			public ModelAndView ccsSearch(String selectVal, String keyword) {
				List<Cinema> ccsList = dao.ccsSearch(selectVal, keyword);
				
				mav.addObject("ccsList", ccsList);
				mav.setViewName("CCS_List");
				
				return mav;
			}

			public ModelAndView ccView(int page, int cNo) {
				Cinema cinema = dao.ccView(cNo);
				
				mav.addObject("view", cinema);
				mav.addObject("page", page);
				mav.setViewName("CC_View");
				
				return mav;
			}

			public List<Review> rList(int CCBNo) {
				System.out.println("[2] service --> review: " + CCBNo);
				List<Review> reviewtList = dao.rList(CCBNo);
				System.out.println("[2] service --> reviewtList: " + reviewtList);
				return reviewtList;
			}

			public List<Review> rWrite(Review review) {
				List<Review> reviewtList = null;
				System.out.println("[2] service --> review: " + review);
				int result = dao.rWrite(review);
				System.out.println("[4] service --> result: " + result);
				
				if(result>0) {
					reviewtList = dao.rList(review.getCCBNo());
				} else {
					reviewtList = null;
				}
				System.out.println("[5] service --> reviewtList: " + reviewtList);
				
				return reviewtList;
			}

}
