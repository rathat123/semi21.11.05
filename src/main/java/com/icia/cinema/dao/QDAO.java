package com.icia.cinema.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.cinema.dto.Page;
import com.icia.cinema.dto.QNA;
import com.icia.cinema.dto.Comment;

@Repository
public class QDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// qna
	public int qWrite(QNA qna) {
		return sql.insert("QNA.qWrite", qna);
	}

	// 전체 게시글 갯수 조회
	public int qListCount() {
		return sql.selectOne("QNA.qListCount");
	}

	// 게시글 리스트 가져오기
	public List<QNA> qList(Page paging) {
		// System.out.println("[3]dao : paging-> " + paging);
		return sql.selectList("QNA.qList", paging);
	}

	//리뷰 자세히 보기
	public QNA qView(int qNo) {
		sql.update("QNA.qHit", qNo);
		return sql.selectOne("QNA.qView", qNo);
	}

	// 댓글 리스트
	public List<Comment> cList(int CBNo) {
		return sql.selectList("QNA.cList", CBNo);
	}

	// 댓글 작성
	public int cWrite(Comment comment) {
		System.out.println("[3] dao. comment : " + comment);
		return sql.insert("QNA.cWrite", comment);
	}

}
