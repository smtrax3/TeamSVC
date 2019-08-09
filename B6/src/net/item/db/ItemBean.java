package net.item.db;

import java.sql.Timestamp;

public class ItemBean {
	
	private int num; //글번호
	private String nickname; //작성자 닉네임
	private String subject; //글 제목
	private String pwd; //글 비밀번호
	private Timestamp date; //작성일
	private int readcount; //조회수
	private String itemcategory; //카테고리 분류
	private String itemname; //상품명
	private int itemprice; //희망가격
	private String iteminfo; //상품정보
	private String itemimg; //상품이미지
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getItemcategory() {
		return itemcategory;
	}
	public void setItemcategory(String itemcategory) {
		this.itemcategory = itemcategory;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public int getItemprice() {
		return itemprice;
	}
	public void setItemprice(int itemprice) {
		this.itemprice = itemprice;
	}
	public String getIteminfo() {
		return iteminfo;
	}
	public void setIteminfo(String iteminfo) {
		this.iteminfo = iteminfo;
	}
	public String getItemimg() {
		return itemimg;
	}
	public void setItemimg(String itemimg) {
		this.itemimg = itemimg;
	}

	
}
