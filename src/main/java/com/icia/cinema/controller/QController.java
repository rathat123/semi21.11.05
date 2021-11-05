package com.icia.cinema.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dto.QNA;
import com.icia.cinema.dto.Comment;
import com.icia.cinema.service.QService;

@Controller
public class QController {

	@Autowired
	private QService qsvc;

	private ModelAndView mav = new ModelAndView();


	// Q_writeForm : Q&A 작성 페이지로 이동
	@RequestMapping(value = "/Q_writeForm", method = RequestMethod.GET)
	public String qWriteForm() {
		return "Q_Write";
	}

	// Q_write : Q&A 작성
	@RequestMapping(value = "/Q_write", method = RequestMethod.POST)
	public ModelAndView qWrite(@ModelAttribute QNA qna) throws IllegalStateException, IOException {

		mav = qsvc.qWrite(qna);

		return mav;
	}

	// Q_list : 게시글 목록
	@RequestMapping(value = "/Q_list", method = RequestMethod.GET)
	public ModelAndView qList(@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		// 오류방지용
		if (page <= 0) {
			page = 1;
		}

		//System.out.println("[1]controller : page -> " + page);
		mav = qsvc.qList(page);
		//System.out.println("[5] controller : mav -> " + mav);
		return mav;

	}

	// Q_view : 게시글 상세보기
	@RequestMapping(value = "/Q_view", method = RequestMethod.GET)
	public ModelAndView qView(@RequestParam(value = "page", required = false, defaultValue = "1") int page, @RequestParam("QNo") int qNo) {

		mav = qsvc.qView(page, qNo);

		return mav;

	}
	
	
	List<Comment> commentList = new ArrayList<Comment>();

	// C_list : 댓글 리스트 불러오기
	@RequestMapping(value = "/C_list", method = RequestMethod.POST)
	public @ResponseBody List<Comment> cList(@RequestParam("CBNo") int CBNo) {

		List<Comment> commentList = qsvc.cList(CBNo);

		return commentList;
	}

	// C_write : 댓글 입력
	@RequestMapping(value = "/C_write", method = RequestMethod.POST)
	public @ResponseBody List<Comment> cWrite(@ModelAttribute Comment comment) {

		List<Comment> commentList = qsvc.cWrite(comment);
		return commentList;
	}

}
