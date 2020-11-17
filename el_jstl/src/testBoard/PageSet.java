package testBoard;

public class PageSet {

	
	private int startNum;
	private int endNum;	  //dao에 넘겨줄 번호
	private int totalNum; //총 페이지(1,2,3,4)
	private final int PAGE_NUM =3;

	
	public void pageSet(int start) {
		if(start==0) {
			start = 1;
		}
		
		
		
		BoardDAO dao = new BoardDAO();
		int allBoard = dao.getTotalPage(); //총 게시물 갯수
		
		if(allBoard%PAGE_NUM==0) {
			totalNum = allBoard/PAGE_NUM;
		} else totalNum = (allBoard/PAGE_NUM)+1;
		
		
			
		startNum = (start-1) * PAGE_NUM+1;
		endNum = PAGE_NUM * start;
				

	}
	
	
	
	
	
	
	
	
	
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	
	
	
	
	
	
	
	
}
