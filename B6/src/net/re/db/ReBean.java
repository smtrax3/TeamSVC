package net.re.db;

import java.sql.Timestamp;

public class ReBean {
	
	private int itemno; //글번호
	private int re_num; //댓글 번호
	private int re_ref; //부모글 번호(그룹번호)
	private int re_lev; //댓글 들여쓰기
	private int re_seq; //댓글 순서번호
	private Timestamp re_date; //작성일
	private String re_name; //작성자
	private String re_img; //파일업로드 이미지명
	private String re_info; //댓글 내용
	private int re_price; //댓글에 작성한 가격
	private int re_up; //추천
	private int re_down; //비추천

	
	public int getItemno() {
		return itemno;
	}
	public void setItemno(int itemno) {
		this.itemno = itemno;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getRe_ref() {
		return re_ref;
	}
	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRe_img() {
		return re_img;
	}
	public void setRe_img(String re_img) {
		this.re_img = re_img;
	}
	public String getRe_info() {
		return re_info;
	}
	public void setRe_info(String re_info) {
		this.re_info = re_info;
	}
	public int getRe_price() {
		return re_price;
	}
	public void setRe_price(int re_price) {
		this.re_price = re_price;
	}
	public int getRe_up() {
		return re_up;
	}
	public void setRe_up(int re_up) {
		this.re_up = re_up;
	}
	public int getRe_down() {
		return re_down;
	}
	public void setRe_down(int re_down) {
		this.re_down = re_down;
	}
	
	
}
