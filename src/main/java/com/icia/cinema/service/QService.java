package com.icia.cinema.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dao.QDAO;
import com.icia.cinema.dto.Page;
import com.icia.cinema.dto.QNA;
import com.icia.cinema.dto.Comment;

@Service
public class QService {
	
	@Autowired
	private QDAO dao;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav = new ModelAndView();

	
	// QNA작성
	public ModelAndView qWrite(QNA qna) throws IllegalStateException, IOException {

		int result = dao.qWrite(qna);

		if (result > 0) {
			mav.setViewName("redirect:/Q_list");
		} else {
			mav.setViewName("index");
		}

		return mav;
	}


	private static final int PAGE_LIMIT = 5;
	private static final int BLOCK_LIMIT = 5; 
	
	// 게시글 목록보기(페이징 처리)
	public ModelAndView qList(int page) {
		//System.out.println("[2-1] service : page -> " + page);
			Page paging = new Page();

			// 전체 게시글 갯수 조회
			int listCount = dao.qListCount();
			//System.out.println("[2-2] service : listCount-> " + listCount);
			
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

			///////////////////////////// 여기까지 페이지 처리

			List<QNA> qnaList = dao.qList(paging);
			//System.out.println("[4] service : qnalist ->" + qnaList);
			
			mav.addObject("qnaList", qnaList);
			mav.addObject("paging", paging);
			mav.setViewName("Q_List");

			return mav;
		}

	// 게시글 상세보기
	public ModelAndView qView(int page, int qNo) {

		QNA qna = dao.qView(qNo);

		mav.addObject("view", qna);
		mav.addObject("page", page);
		mav.setViewName("Q_View");

		return mav;
	}
	
	List<Comment> commentList = new ArrayList<Comment>();

	// 댓글리스트
	public List<Comment> cList(int CBNo) {

		commentList = dao.cList(CBNo);

		return commentList;
	}

	// 댓글작성
	public List<Comment> cWrite(Comment comment) {
		commentList = null;

		int result = dao.cWrite(comment);

		if (result > 0) {
			commentList = dao.cList(comment.getCBNo());
		} else {
			commentList = null;
		}

		return commentList;
	}

}
