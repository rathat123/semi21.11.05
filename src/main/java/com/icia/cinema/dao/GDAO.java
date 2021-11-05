package com.icia.cinema.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.cinema.dto.Goods;
import com.icia.cinema.dto.Page;
import com.icia.cinema.dto.QNA;

@Repository
public class GDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	
	public int gUpload(Goods goods) {
		return sql.insert("GOODS.gUpload", goods);
	}

	// 전체 상품 개수 조회
	public int gListCount() {
		return sql.selectOne("GOODS.gListCount");
	}

	// 상품 리스트 가져오기
	public List<Goods> gList(Page paging) {
		return sql.selectList("GOODS.gList", paging);
	}

	//상품 상세정보
	public Goods gView(int GNo) {

		return sql.selectOne("GOODS.gView" , GNo);
	}
	//상품 검색
	public List<Goods> gSearch(String selectVal, String keyword) {
		
			return sql.selectList("GOODS.gSearch", keyword);
	}

	//상품 삭제
	public int gDelete(int GNo) {
		return sql.delete("GOODS.gDelete",GNo);
	}

}
