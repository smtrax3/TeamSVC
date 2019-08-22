package net.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.basket.db.BasketBean;
import net.basket.db.BasketDAO;

public class BasketAddAction
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
    request.setCharacterEncoding("utf-8");
    
    BasketBean basketbean = new BasketBean();
    
    basketbean.setB_g_num(Integer.parseInt(request.getParameter("num")));
    basketbean.setB_g_amount(Integer.parseInt(request.getParameter("amount")));
    basketbean.setB_g_color(request.getParameter("color"));
    basketbean.setB_g_size(request.getParameter("size"));
    basketbean.setB_m_id(id);
    
    BasketDAO basketdao = new BasketDAO();
    
    int check = basketdao.checkGoods(basketbean);
    if (check != 1) {
      basketdao.basketAdd(basketbean);
    }
    forward.setRedirect(true);
    forward.setPath("./BasketList.ba");
    return forward;
  }
}
