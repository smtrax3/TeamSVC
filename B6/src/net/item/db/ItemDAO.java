package net.item.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ItemDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	/* DB연결 메소드 */
	public void getCon() {
		try {
			// 1.WAS서버와 연결된 DBApp웹프로젝트의 모든 정보를 가지고 있는 컨텍스트객체 생성
			Context init = new InitialContext();
			// 2.연결된 WAS서버에서 DataSource(커넥션풀) 검색해서 가져오기
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
			// DataSource(커넥션풀)에서 DB연동객체 (커넥션) 가져오기
			con = ds.getConnection(); // DB연결

		} catch (Exception err) {
			err.printStackTrace();
		}

	}// getCon()메소드 끝
	

	public Vector<ItemBean> getAllItemList() {
		// 리턴할 Vector객체를 선언
		Vector<ItemBean> v = new Vector<ItemBean>();
		// 하나의 레코드를 저장할 객체 선언
		ItemBean bean = null;
		
		try {
			// 커넥션 메소드 호출 하여 DB연결객체 하나 얻기
			getCon();// DB연결
			// 쿼리준비 : 전체 상품 레코드 검색
			String sql = "select * from itemlist";
			// 쿼리를 실행할수있는 객체 선언
			pstmt = con.prepareStatement(sql);
			// 쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();
			// 반복문을 돌면서 빈클래스에 컬럼데이터를 저장
			while (rs.next()) {// Resultset에 레코드가 존재할때까지 반복
				bean = new ItemBean();
				bean.setNum(rs.getInt("num")); // 상품 글번호
				bean.setSubject(rs.getString("nickname")); //작성자 닉네임
				bean.setPwd(rs.getString("pwd")); //패스워드
				bean.setDate(rs.getTimestamp("date")); //작성일
				bean.setReadcount(rs.getInt("readcount")); //조회수
				bean.setItemcategory(rs.getString("itemcategory")); //카테고리 분류
				bean.setItemname(rs.getString("itemname")); //상품명
				bean.setItemprice(rs.getInt("itemprice")); //희망가격
				bean.setIteminfo(rs.getString("iteminfo"));
				bean.setItemimg(rs.getString("itemimg"));
				
				// 다 저장된 빈객체를 백터에 저장
				v.add(bean);
			}
			// DB연결객체 커넥션 풀에 반납
			con.close();
		} catch (Exception e) {
			System.out.println("getAllItemList()에서 에러");
		}
		return v; // 백터 리턴
	}// getAllCarlist()메소드 끝

	/* 카테고리별 자동차레코드 데이터 검색메소드 */
	public Vector<ItemBean> getCategoryItemList(String carcategory) {
		// 리턴할 Vector객체를 선언
		Vector<ItemBean> v = new Vector<ItemBean>();
		// 하나의 레코드를 저장할 객체 선언
		ItemBean bean = null;

		try {
			// 커넥션 메소드 호출 하여 DB연결객체 하나 얻기
			getCon();// DB연결
			// 쿼리준비 : 카테고리별 차량 레코드 검색
			String sql = "select * from itemlist where itemcategory=?";
			// 쿼리를 실행할수있는 객체 선언
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, carcategory);
			// 쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();

			// 반복문을 돌면서 빈클래스에 컬럼데이터를 저장
			while (rs.next()) {// Resultset에 레코드가 존재할때까지 반복
				bean = new ItemBean();
				bean.setNum(rs.getInt("num")); // 상품 글번호
				bean.setSubject(rs.getString("nickname")); //작성자 닉네임
				bean.setPwd(rs.getString("pwd")); //패스워드
				bean.setDate(rs.getTimestamp("date")); //작성일
				bean.setReadcount(rs.getInt("readcount")); //조회수
				bean.setItemcategory(rs.getString("itemcategory")); //카테고리 분류
				bean.setItemname(rs.getString("itemname")); //상품명
				bean.setItemprice(rs.getInt("itemprice")); //희망가격
				bean.setIteminfo(rs.getString("iteminfo"));
				bean.setItemimg(rs.getString("itemimg"));
				v.add(bean);
			}
			// DB연결객체 커넥션 풀에 반납
			con.close();
		} catch (Exception e) {
			System.out.println("getCategoryItemList()에서 에러");
		}
		return v; // 백터 리턴
	}// getCategoryItemList메소드 끝


	public ItemBean getOneItem(int itemno) {
		// 리턴할 하나의 레코드를 저장할 객체 선언
		ItemBean bean = null;
		try {
			// 커넥션 메소드 호출 하여 DB연결객체 하나 얻기
			getCon();// DB연결
			// 쿼리준비 : 매개변수로 전달받은 차넘버에 해당하는 차량 레코드 검색
			String sql = "select * from itemlist where num=?";
			// 쿼리를 실행할수있는 객체 선언
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemno);
			// 쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();

			// 반복문을 돌면서 빈클래스에 컬럼데이터를 저장
			while (rs.next()) {// Resultset에 레코드가 존재할때까지 반복
				bean = new ItemBean();
				bean.setNum(rs.getInt("num")); // 상품 글번호
				bean.setSubject(rs.getString("nickname")); //작성자 닉네임
				bean.setPwd(rs.getString("pwd")); //패스워드
				bean.setDate(rs.getTimestamp("date")); //작성일
				bean.setReadcount(rs.getInt("readcount")); //조회수
				bean.setItemcategory(rs.getString("itemcategory")); //카테고리 분류
				bean.setItemname(rs.getString("itemname")); //상품명
				bean.setItemprice(rs.getInt("itemprice")); //희망가격
				bean.setIteminfo(rs.getString("iteminfo"));
				bean.setItemimg(rs.getString("itemimg"));
			}
					
			// DB연결객체 커넥션 풀에 반납
			con.close();
		} catch (Exception e) {
			System.out.println("getOneItem()에서 에러");
		}
		return bean; // 빈 리턴
	}
	
	
	
	
	
	
	
	
}
