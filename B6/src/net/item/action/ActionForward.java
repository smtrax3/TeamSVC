package net.item.action;

/*
ActionForward클래스는 Action인터페이스에서 명령을 수행하고.....
결과 값을 가지고 페이지를 포워딩(이동)할때 사용되는 클래스 임.
하는일1. 페이지 이동 방식 여부 값 저장후 리턴 해주는 역할.
		 페이지 이동 방식 여부 값  true 일때-> sendRedirect()방식
          페이지 이동 방식 여부 값  false 일때-> forward() 방식
하는일2. 이동페이지 경로 값 저장 하여 리턴 해주는 역할
*/
public class ActionForward {
	//페이지 이동 방식 여부 값 저장 변수
	private boolean isRedirect=false; 
	//true sendRedirect() <-이방식은 이동할 페이지 주소 경로 노출 함.
	//false  forward() <- 이방식은 이동할 페이지 주소 경로 노출 안함.
	
	//이동페이지 경로 주소값 저장 변수
	private String path=null;
	
	//페이지 이동 방식 여부 값 리턴
	public boolean isRedirect() {
		return isRedirect;
	}
	//페이지 이동 방식 여부 값 저장 메소드 
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	//이동페이지 경로 주소값 리턴 메소드 
	public String getPath() {
		return path;
	}
	//이동할 페이지 경로 주소값 저장
	public void setPath(String path) {
		this.path = path;
	}	
}
