package net.re.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReDAO {
	
	
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

	public ArrayList<ReBean> getAllReList(int itemno) {

		System.out.println("getAllReList() 호출");
		//댓글 레코드 셋들을 저장할 컬렉션 객체 선언(리턴할 값)
		ArrayList<ReBean> list = new ArrayList<ReBean>();
		//하나의 댓글 레코드를 저장할 bean 객체 선언
		ReBean bean = null;
		
		try {
			getCon();
			//sql = "select * from board order by re_ref desc,re_seq asc limit ?,?";
			String sql = "select * from re where itemno=? order by re_ref desc, re_seq asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, itemno);
			rs = pstmt.executeQuery();

			while(rs.next()){
				bean = new ReBean();
				
				bean.setItemno(rs.getInt("itemno"));
				bean.setRe_num(rs.getInt("re_num"));
				bean.setRe_ref(rs.getInt("re_ref"));
				bean.setRe_lev(rs.getInt("re_lev"));
				bean.setRe_seq(rs.getInt("re_seq"));
				bean.setRe_date(rs.getTimestamp("re_date"));
				bean.setRe_name(rs.getString("re_name"));	
				bean.setRe_img(rs.getString("re_img"));
				bean.setRe_info(rs.getString("re_info"));
				bean.setRe_price(rs.getInt("re_price"));
				bean.setRe_up(rs.getInt("re_up"));
				bean.setRe_down(rs.getInt("re_down"));

				list.add(bean);
			}
			
			
		} catch (Exception e) {
			System.out.println("getAllReList()에서 에러");
		}
		
		return list;
	}//getAllReList(int itemno) 메소드 끝
}
