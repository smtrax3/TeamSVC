package net.item.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 클레스를 만들기위한 틀
	// 객체 생성 할수없음  인터페이스 상속받은 클래스   객체생성
	// 다중상속 가능 
	// 상수변수 객체 생성없이 바로 사용
	//static final int A=10;
	// 메서드틀 => 추상메서드 => 상속받은 클래스 무조건 메서드 오버라이딩
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
