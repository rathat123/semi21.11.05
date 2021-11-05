package com.icia.cinema.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.cinema.dto.Cinema;
import com.icia.cinema.dto.Page;
import com.icia.cinema.dto.Review;

@Repository
public class CDAO {

	@Autowired
	private SqlSessionTemplate sql;

	// poster 작성
	public int ccWrite(Cinema cinema) {
		return sql.insert("Cinema.ccWrite", cinema);
	}

	public int ccListCount() {
		return sql.selectOne("Cinema.ccListCount");
	}
	
	public List<Cinema> ccList(Page paging) {
		return sql.selectList("Cinema.ccList", paging);
	}

	public List<Cinema> ccsSearch(String selectVal, String keyword) {
		
		if(selectVal.equals("CTitle")) {
			return sql.selectList("Cinema.ccsTitle", keyword);
		} else if(selectVal.equals("CContent")) {
			return sql.selectList("Cinema.ccsContent", keyword);
		} else {
			return sql.selectList("Cinema.ccsGenre", keyword);
		}
	}

	public Cinema ccView(int cNo) {
		sql.update("Cinema.ccHit", cNo);
		return sql.selectOne("Cinema.ccView", cNo);
	}
	
	public List<Review> rList(int CCBNo) {
		System.out.println("[3] dao. review : " + CCBNo);
		return sql.selectList("Cinema.rList", CCBNo);
	}

	   public int rWrite(Review review) {
		   System.out.println("[3] dao. review : " + review);
		      return sql.insert("Cinema.MId", review);
		   }
	}

