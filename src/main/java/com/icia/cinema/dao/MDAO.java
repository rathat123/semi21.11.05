package com.icia.cinema.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.cinema.dto.Member;

@Repository
public class MDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	// 회원가입
	public int mJoin(Member member) {
		return sql.insert("Member.mJoin", member);
	}
	
	// 아이디 중복검사
	public String idoverlap(String MId) {
		return sql.selectOne("Member.idOverlap", MId);
	}

	// 로그인
	public Member mLogin(Member member) {
		return sql.selectOne("Member.mLogin", member);
	}
	
	// 회원정보보기
	public Member mView(String mId) {
		return sql.selectOne("Member.mView", mId);
	}

	// 회원 수정
	public int mModify(Member member) {
		return sql.update("Member.mModify", member);
	}

	// 회원 탈퇴
	public int mDelete(String MId) {
		return sql.delete("Member.mDelete", MId);
	}
	
	

}
