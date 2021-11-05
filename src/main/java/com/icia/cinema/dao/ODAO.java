package com.icia.cinema.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.cinema.dto.Order;

@Repository
public class ODAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public int oCart(Order order) {
		return sql.insert("Order.oCart",order);
	}

	public List<Order> oView() {
		return sql.selectList("Order.oView");
	}

	public String oSum() {
		return sql.selectOne("Order.oSum");
	}
	public int oCheckOut() {
		return sql.delete("Order.oCheckOut");
	}

	public int oDelete(int GNo) {
		return sql.delete("Order.oDelete",GNo);
	}

}
