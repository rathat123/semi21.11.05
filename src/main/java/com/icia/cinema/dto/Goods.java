package com.icia.cinema.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Goods {

	private int GNo;
	private String GName;
	private String GExplain;
	private int GPrice;
	private MultipartFile GPhotoName;
	private String GPhoto;
	
}
