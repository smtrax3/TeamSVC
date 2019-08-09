package net.item.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.item.db.ItemBean;
import net.item.db.ItemDAO;
import net.item.action.Action;

public class ItemListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ItemListAction execute()");
		/* 전체차량 보기 검색 */
		// 데이터 베이스에 접근하기위한 Model객체 생성(CarDao)
		ItemDAO itemdao = new ItemDAO();
		
		// 실제 데이터 베이스에 접근하여 상품 정보를 모두 읽어서 백터에 저장
		Vector<ItemBean> v = itemdao.getAllItemList();

		// ItemList.jsp화면에 보여질 뷰페이지로 이동시킬때.. request객체에 담아서 보내 줍니다.
		request.setAttribute("v", v); // request객체영역에 담기
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("ItemList.jsp");
		return forward;

	}

	

}

