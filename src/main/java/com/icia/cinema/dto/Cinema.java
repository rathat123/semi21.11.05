package com.icia.cinema.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Cinema {

	public int CNo;
	public String CTitle;
	public String CDate;
	public MultipartFile CPoster;
	public String CPosterName;
	public String CContent;
	public int CHit;	
	public String CDirector;
	public String CActor;
	public String CGenre;
	public String CAge;
}