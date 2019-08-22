package net.basket.action;

import java.io.PrintStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.basket.db.BasketDAO;

public class BasketDeleteAction
  implements Action
{
  public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    System.out.println("BasketDeleteAction");
    
    HttpSession session = request.getSession();
    String id = (String)session.getAttribute("id");
    
    ActionForward forward = new ActionForward();
    if (id == null)
    {
      forward.setRedirect(true);
      forward.setPath("./MemberLogin.me");
      return forward;
    }
    int b_num = Integer.parseInt(request.getParameter("b_num"));
    
    BasketDAO basketdao = new BasketDAO();
    
    basketdao.basketDelete(b_num);
    
    forward.setRedirect(true);
    forward.setPath("./BasketList.ba");
    return forward;
  }
}
