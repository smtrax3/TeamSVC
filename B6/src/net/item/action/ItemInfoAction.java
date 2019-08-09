package net.item.action;

import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.item.db.ItemBean;
import net.item.db.ItemDAO;
import net.re.db.ReBean;
import net.re.db.ReDAO;


public class ItemInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//ItemList.jsp에서 사용자가 선택한 상품 번호 전달 받기
		int itemno = Integer.parseInt(request.getParameter("itemno"));
		
		
		/*상세보기(상당) : 상품정보 부분*/
		//데이터베이스에 연결하여 하나의 자동차 정보를 읽어 드림
		ItemDAO itemdao = new ItemDAO();
		
		//실제 데이터 베이스에 접근하여 하나의 상품 정보를 모두 읽어서.... 
		//하나의 컬럼정보를 저장해주는 빈객체 리턴
		//단 호출시! 상품번호를 메소드의 매개변수로 전달 ! 
		ItemBean bean = itemdao.getOneItem(itemno);
		
		/*쿠키 작업*/
		
		Cookie cookie = null; //

		//기존 쿠기 불러오기
		Cookie[] cookies = request.getCookies();
		System.out.println("쿠키 길이 : "+cookies.length);
		
		
		cookie = new Cookie("name"+cookies.length,URLEncoder.encode(bean.getItemname(),"UTF-8"));
		cookie.setMaxAge(60); //유효시간 60초 
		//cookie.setMaxAge(0); //쿠키 삭제
		response.addCookie(cookie);
		
		//리퀘스트 객체를 이용하여 데이터를 저장
		request.setAttribute("bean", bean);
		
		/*상세보기(하단) : 댓글 부분*/
		ReDAO redao = new ReDAO();
		ArrayList<ReBean> rebean = redao.getAllReList(itemno);

		//리퀘스트 객체를 이용하여 데이터를 저장
		request.setAttribute("rebean", rebean);		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("ItemInfo.jsp");
		return forward;
	}

}
