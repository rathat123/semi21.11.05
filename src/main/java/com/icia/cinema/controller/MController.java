package com.icia.cinema.controller;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.cinema.dto.Member;
import com.icia.cinema.service.MService;

@Controller
public class MController {

	@Autowired
	MService msvc = new MService();

	@Autowired
	JavaMailSender mailsender;

	@Autowired
	private HttpSession session;

	ModelAndView mav = new ModelAndView();

	// 프로젝트 실행 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	// M_joinForm : 회원가입 홈페이지로
	@RequestMapping(value = "/M_joinForm", method = RequestMethod.GET)
	public String mJoinForm() {

		return "M_Join";
	}

	// M_join : 회원가입
	@RequestMapping(value = "/M_join", method = RequestMethod.POST)
	public ModelAndView M_join(@ModelAttribute Member member) {

		mav = msvc.mJoin(member);
		return mav;
	}

	// A_idoverlap : 아이디 중복 검사
	@RequestMapping(value = "/A_idoverlap", method = RequestMethod.POST)
	public @ResponseBody String idoverlap(@RequestParam("MId") String MId) {
		System.out.println("[1]controller : MId->" + MId);
		String result = msvc.idoverlap(MId);
		System.out.println("[5]controller : result->" + result);
		return result;
	}

	// A_emailConfirm : 이메일 인증번호 발송
	@RequestMapping(value = "/A_emailConfirm", method = RequestMethod.GET)
	public @ResponseBody String emailConfirm(@RequestParam("MEmail") String MEmail) {
		String emailKey = emailKey(false, 7);

		MimeMessage mail = mailsender.createMimeMessage();

		String massage = "<h2>안녕하세요. 인천일보 아카데미 입니다.</h2>" + "<br/><p>인증번호는 " + emailKey + "입니다.</p>"
				+ "<p>인증번호를 인증번호 입력란에 입력해주세요</p>" + "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다.)";

		try {
			mail.setSubject("[본인인증]인천일보 아카데미 인증메일입니다.", "utf-8");
			mail.setText(massage, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(MEmail));
			mailsender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return emailKey;
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String emailKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;

		return init();
	}

	// 실제 난수를 만드는 메소드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();

		int num = 0;

		do {
			// 0 부터 74.9999사이의 값이 랜덤하게 + 48
			num = ran.nextInt(75) + 48;
			// 숫자 대문자 소문자
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);

		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}

		return sb.toString();
	}

	// M_loginForm : 로그인 페이지로 이동
	@RequestMapping(value = "/M_loginForm", method = RequestMethod.GET)
	public String M_loginForm() {
		return "M_Login";
	}

	// M_login : 로그인
	@RequestMapping(value = "/M_login", method = RequestMethod.POST)
	public ModelAndView mLogin(@ModelAttribute Member member) {

		mav = msvc.mLogin(member);

		return mav;
	}

	// M_logout : 로그아웃
	@RequestMapping(value = "/M_logout", method = RequestMethod.GET)
	public String mLogout() {
		session.invalidate();
		return "index";
	}

	// M_myinfoForm : 내정보 페이지로 이동
	@RequestMapping(value = "/M_myinfoForm", method = RequestMethod.GET)
	public String M_myinfoForm() {

		return "M_MyinfoCheck";
	}

	// M_myinfo : 내정보 비밀번호 확인 여부
	@RequestMapping(value = "/M_myinfo", method = RequestMethod.POST)
	public ModelAndView mMyinfo(@ModelAttribute Member member) {

		mav = msvc.mMyinfo(member);

		return mav;
	}

	// M_modify : 회원수정
	@RequestMapping(value = "/M_modify", method = RequestMethod.POST)
	public ModelAndView mModify(@ModelAttribute Member member) {

		mav = msvc.mModify(member);

		return mav;
	}

	// M_delete : 회원탈퇴
	@RequestMapping(value = "/M_delete", method = RequestMethod.GET)
	public ModelAndView mDelete(@RequestParam("MId") String MId) {

		mav = msvc.mDelete(MId);

		return mav;
	}
	
	

}
