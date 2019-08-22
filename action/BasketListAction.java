package net.basket.action;

import java.util.List;
import java.util.Vector;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.basket.db.BasketDAO;

public class BasketListAction
  implements Action
{
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    HttpSession session = request.getSession();
    String id = (String)session.getAttribute("id");
    
    ActionForward forward = new ActionForward();
    if (id == null)
    {
      forward.setRedirect(true);
      forward.setPath("./MemberLogin.me");
      return forward;
    }
    BasketDAO basketdao = new BasketDAO();
    
    Vector vector = basketdao.getBasketList(id);
    
    List basketList = (List)vector.get(0);
    
    List goodsList = (List)vector.get(1);
    
    request.setAttribute("basketList", basketList);
    request.setAttribute("goodsList", goodsList);
    
    forward.setRedirect(false);
    forward.setPath("./goods_order/goods_basket.jsp");
    return forward;
  }
}
