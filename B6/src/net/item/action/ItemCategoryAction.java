package net.item.action;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.item.db.ItemBean;
import net.item.db.ItemDAO;

public class ItemCategoryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("ItemCategoryAction execute()");

		//ItemList.jsp 또는 CarReservation에서 사용자가 선택한 카테고리값을 먼저 읽어드림
		String carcategory = request.getParameter("carcategory");
		
		//데이터 베이스 작업 객체 생성
		ItemDAO itemdao = new ItemDAO();
		//카테고리별 상품검색 메소드를 호출하여  검색한 레코드를 담고 있는 백터객체 리턴 받기.
		//단 호출시! 카테고리값 메소드의 매개변수로 전달 ! 
		Vector<ItemBean> v = itemdao.getCategoryItemList(carcategory);
		
		//ItemList.jsp로 데이터를 넘기기위해서 request객체에 저장
		request.setAttribute("v", v);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("ItemList.jsp");
		return forward;
	}

}
