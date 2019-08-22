package net.basket.action;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BasketFrontController
  extends HttpServlet
{
  protected void doProcess(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String requestURI = request.getRequestURI();
    
    String contextPath = request.getContextPath();
    
    String command = requestURI.substring(contextPath.length());
    
    Action action = null;
    ActionForward forward = null;

    if (command.equals("/BasketAdd.ba"))//장바구니 추가
    {
      action = new BasketAddAction();
      try
      {
        forward = action.execute(request, response);
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }
    }
    else if (command.equals("/BasketList.ba")) //장바구니 출력
    {
      action = new BasketListAction();
      try
      {
        forward = action.execute(request, response);
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }
    }
    else if (command.equals("/BasketDelete.ba"))	//장바구니 삭제
    {
      action = new BasketDeleteAction();
      try
      {
        forward = action.execute(request, response);
      }
      catch (Exception e)
      {
        e.printStackTrace();
      }
    }
    if (forward != null) {
      if (forward.isRedirect())
      {
        response.sendRedirect(forward.getPath());
      }
      else
      {
        RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
        dispatcher.forward(request, response);
      }
    }
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    doProcess(request, response);
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    doProcess(request, response);
  }
}
