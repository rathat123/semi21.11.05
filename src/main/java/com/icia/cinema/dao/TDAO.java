package com.icia.cinema.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.cinema.dto.Cinema;
import com.icia.cinema.dto.Ticket;

@Repository
public class TDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public Cinema tBuy(int cNo) {
		return sql.selectOne("Ticket.tBuy", cNo);
	}

	public int tBuy2(Ticket ticket) {
		System.out.println("3. dao -> ticket : " + ticket);
		return sql.insert("Ticket.tBuy2", ticket);
	}

	public Ticket tView(String mId) {
		return sql.selectOne("Ticket.tView", mId);
	}

	public String tTotal(String mId) {
		return sql.selectOne("Ticket.tTotal", mId);
	}

	public int tCheckOut() {
		return sql.delete("Ticket.tCheckOut");
	}


	
	
}
