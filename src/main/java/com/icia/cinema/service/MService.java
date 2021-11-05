package com.icia.cinema.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dao.MDAO;
import com.icia.cinema.dto.Member;

@Service
public class MService {

	@Autowired
	MDAO dao = new MDAO();

	@Autowired
	BCryptPasswordEncoder pwEnc;

	@Autowired
	private HttpSession session;

	ModelAndView mav = new ModelAndView();

	// 회원가입
	public ModelAndView mJoin(Member member) {
		// 입력받은 패스워드 -> 암호화 -> db로 전달
		member.setMPw(pwEnc.encode(member.getMPw()));
		// 주소합치기
		member.setMAddr("(" + member.getAddr1() + ")" + member.getAddr2() + ", " + member.getAddr3());

		int result = dao.mJoin(member);

		if (result > 0) {
			mav.setViewName("M_Login");
		} else {
			mav.setViewName("index");
		}
		return mav;
	}

	// 아이디 중복검사
	public String idoverlap(String MId) {
		String idCheck = dao.idoverlap(MId);
		String result = null;

		if (idCheck == null) {
			result = "OK"; // 중복x
		} else {
			result = "NO"; // 중복o
		}
		return result;
	}

	// 로그인
	public ModelAndView mLogin(Member member) {

		// [1] 입력한 ID로 암호화 된 password를 검색
		Member encPw = dao.mView(member.getMId());

		
		if(encPw==null) {
			System.out.println("encPw -> " + encPw);
			mav.setViewName("M_Login");
		} else {
			if (pwEnc.matches(member.getMPw(), encPw.getMPw())) {
				session.setAttribute("loginId", encPw.getMId());

				mav.setViewName("index");
			} else {
				mav.setViewName("M_Login");
			}
		}		

		return mav;
	}

	// 수정을 위한 비밀번호 확인
	public ModelAndView mMyinfo(Member member) {

		// member = 받아온 id,pw
		// mem = 회원수정 페이지에 가져갈 MEMBER 테이블 정보

		Member mem = dao.mView(member.getMId());

		if (pwEnc.matches(member.getMPw(), mem.getMPw())) {

			mav.addObject("member", mem);
			mav.setViewName("M_Myinfo");
		} else {
			mav.setViewName("M_Login");
		}

		return mav;
	}

	// 회원수정
	public ModelAndView mModify(Member member) {

		member.setMPw(pwEnc.encode(member.getMPw()));

		member.setMAddr("(" + member.getAddr1() + ")" + member.getAddr2() + ", " + member.getAddr3());

		int result = dao.mModify(member);

		if (result > 0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("index");
		}

		return mav;
	}

	// 회원 탈퇴
	public ModelAndView mDelete(String MId) {

		int result = dao.mDelete(MId);

		if (result > 0) {

			mav.setViewName("redirect:/M_logout");

		} else {
			mav.setViewName("index");
		}

		return mav;
	}

}
