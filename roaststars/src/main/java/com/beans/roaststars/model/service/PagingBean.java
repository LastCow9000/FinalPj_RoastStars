package com.beans.roaststars.model.service;

/**
 * 페이징 처리를 위한 비즈니스 계층의 클래스 PagingBean method 구현순서
 * getStartRowNumber()
 * getEndRowNumber() getTotalPage() getTotalPageGroup() getNowPageGroup()
 * getStartPageOfPageGroup() getEndPageOfPageGroup() isPreviousPageGroup()
 * isNextPageGroup()
 * 
 * @author kosta
 *
 */
public class PagingBean {
	/**
	 * 현재 페이지
	 */
	private int nowPage = 1;
	/**
	 * 페이지당 게시물수
	 */
	private int contentNumberPerPage;
	/**
	 * 페이지 그룹당 페이지수
	 */
	private int pageNumberPerPageGroup;

	/**
	 * database에 저장된 총게시물수
	 */
	private int totalContents;
	
	/**
	 * 생성자
	 */
	public PagingBean() {
	}

	public PagingBean(int totalContents) {
		this.totalContents = totalContents;
	}

	public PagingBean(int totalContents, int nowPage) {
		this.totalContents = totalContents;
		this.nowPage = nowPage;
	}
	
	
	public int getNowPage() {
		return nowPage;
	}
	
	/** 
	 * 페이지 당 게시물 수 & 페이지 그룹 당 페이지 수
	 * - 인스턴스 변수 설정 후, set,get으로 입력하기
	 */
	public int getContentNumberPerPage() {
		return contentNumberPerPage;
	}

	public void setContentNumberPerPage(int contentNumberPerPage) {
		this.contentNumberPerPage = contentNumberPerPage;
	}

	public int getPageNumberPerPageGroup() {
		return pageNumberPerPageGroup;
	}

	public void setPageNumberPerPageGroup(int pageNumberPerPageGroup) {
		this.pageNumberPerPageGroup = pageNumberPerPageGroup;
	}


	/**
	 * 현재 페이지번호에 해당하는 시작 게시물의 row number를 반환 hint : 이전페이지의 마지막 번호 + 1 ((현재페이지-1)
	 * * 페이지당 게시물수) +1
	 * 
	 * @return
	 */
	public int getStartRowNumber() {
		return ((nowPage - 1) * contentNumberPerPage) + 1;
	}

	/**
	 * 현재 페이지에서 보여줄 게시물 행(row)의 마지막 번호
	 * 현재페이지*contentNumberPerPage 만약 총게시물수보다<br>
	 * 연산결과의 번호가 클 경우 총게시물수가 마지막 번호가 되어야 한다 ex) 총게시물수 7 개 총페이지는 2페이지 : 1 2 3 4 5<br>
	 * | 6 7 | 1page 2page 현재페이지는 2페이지이고 2*5(페이지당 게시물수) 는 10 이고 실제 마지막 번호 7이다 -><br>
	 * 연산결과가 총게시물수보다 클 경우 총게시물수가 마지막번호가 되어야 함
	 * 
	 * @return
	 */
	public int getEndRowNumber() {
		int endRowNumber = nowPage * contentNumberPerPage;
		if (totalContents < endRowNumber)
			endRowNumber = totalContents;
		return endRowNumber;
	}

	/**
	 * 총 페이지 수를 return한다.<br>
	 * 1. 전체 데이터(게시물) % 한 페이지에 보여줄 데이터 개수 <br>
	 * => 0 이면 둘을 / 값이 총 페이지 수<br>
	 * 2. 전체 데이터(게시물) % 한 페이지에 보여줄 데이터 개수 <br>
	 * => 0보다 크면 둘을 / 값에 +1을 한 값이 총 페이지 수<br>
	 * 게시물수 1 2 3 4 5 6 7 8 9 10 11 12<br>
	 * 1페이지 1~5<br>
	 * 2페이지 6~10<br>
	 * 3페이지 11 <br>
	 * ex) 게시물 32 개 , 페이지당 게시물수 5개-> 7 페이지
	 * 
	 * @return
	 */
	public int getTotalPage() {
		int num = this.totalContents % this.contentNumberPerPage;
		int totalPage = 0;
		if (num == 0) {
			totalPage = this.totalContents / this.contentNumberPerPage;
		} else {
			totalPage = this.totalContents / this.contentNumberPerPage + 1;
		}
		return totalPage;
	}

	/**
	 * 총 페이지 그룹의 수를 return한다.<br>
	 * 1. 총 페이지수 % Page Group 내 Page 수. <br>
	 * => 0 이면 둘을 / 값이 총 페이지 수<br>
	 * 2. 총 페이지수 % Page Group 내 Page 수. <br>
	 * => 0보다 크면 둘을 / 값에 +1을 한 값이 총 페이지 수<br>
	 * ex) 총 게시물 수 23 개 <br>
	 * 총 페이지 ? 총 페이지 그룹수 ? <br>
	 * 페이지 1 2 3 4 5<br>
	 * 페이지그룹 1234(1그룹) 5(2그룹)<br>
	 * 
	 */
	public int getTotalPageGroup() {
		int num = this.getTotalPage() % this.pageNumberPerPageGroup;
		int totalPageGroup = 0;
		if (num == 0) {
			totalPageGroup = this.getTotalPage() / this.pageNumberPerPageGroup;
		} else {
			totalPageGroup = this.getTotalPage() / this.pageNumberPerPageGroup + 1;
		}
		return totalPageGroup;
	}

	/**
	 * 현재 페이지가 속한 페이지 그룹 번호(몇 번째 페이지 그룹인지) 을 return 하는 메소드 <br>
	 * 1. 현재 페이지 % Page Group 내 Page 수 => 0 이면 <br>
	 * 둘을 / 값이 현재 페이지 그룹. <br>
	 * 2. 현재 페이지 % Page Group 내 Page 수 => 0 크면 <br>
	 * 둘을 / 값에 +1을 한 값이 현재 페이지 그룹<br>
	 * 페이지 1 2 3 4 /5 6 7 8/ 9 10 1그룹 2그룹 3그룹
	 * 
	 * @return
	 */
	public int getNowPageGroup() {
		int num = this.nowPage % this.pageNumberPerPageGroup;
		int nowPageGroup = 0;
		if (num == 0) {
			nowPageGroup = this.nowPage / this.pageNumberPerPageGroup;
		} else {
			nowPageGroup = this.nowPage / this.pageNumberPerPageGroup + 1;
		}
		return nowPageGroup;
	}

	/**
	 * 현재 페이지가 속한 페이지 그룹의 시작 페이지 번호를 return 한다.<br>
	 * Page Group 내 Page 수*(현재 페이지 그룹 -1) + 1을 한 값이 첫 페이지이다.<br>
	 * (페이지 그룹*페이지 그룹 개수, 그룹의 마지막 번호이므로) <br>
	 * 페이지 그룹 <br>
	 * 1 2 3 4 -> 5 6 7 8 -> 9 10 <br>
	 * 
	 * @return
	 */
	public int getStartPageOfPageGroup() {
		int num = this.pageNumberPerPageGroup * (this.getNowPageGroup() - 1) + 1;
		return num;
	}

	/**
	 * 현재 페이지가 속한 페이지 그룹의 마지막 페이지 번호를 return 한다.<br>
	 * 1. 현재 페이지 그룹 * 페이지 그룹 개수 가 마지막 번호이다. <br>
	 * 2. 그 그룹의 마지막 페이지 번호가 전체 페이지의 마지막 페이지 번호보다 <br>
	 * 큰 경우는 전체 페이지의 마지막 번호를 return 한다.<br>
	 * 1 2 3 4 -> 5 6 7 8 -> 9 10
	 * 
	 * @return
	 */
	public int getEndPageOfPageGroup() {
		int num = this.getNowPageGroup() * this.pageNumberPerPageGroup;
		if (this.getTotalPage() < num) {
			num = this.getTotalPage();
		}
		return num;
	}

	/**
	 * 이전 페이지 그룹이 있는지 체크하는 메서드 <br>
	 * 현재 페이지가 속한 페이지 그룹이 1보다 크면 true<br>
	 * ex ) 페이지 1 2 3 4 / 5 6 7 8 / 9 10 <br>
	 * 1 2 3 group
	 * 
	 * @return
	 */
	public boolean isPreviousPageGroup() {
		boolean flag = false;
		if (this.getNowPageGroup() > 1) {
			flag = true;
		}
		return flag;
	}

	/**
	 * 다음 페이지 그룹이 있는지 체크하는 메서드 <br>
	 * 현재 페이지 그룹이 마지막 페이지 그룹(<br>
	 * 마지막 페이지 그룹 == 총 페이지 그룹 수) 보다 작으면 true<br>
	 * * ex ) 페이지 <br>
	 * 1 2 3 4 / 5 6 7 8 / 9 10 <br>
	 * 1 2 3 group
	 * 
	 * @return
	 */
	public boolean isNextPageGroup() {
		boolean flag = false;
		if (this.getNowPageGroup() < this.getTotalPageGroup()) {
			flag = true;
		}
		return flag;
	}

	public static void main(String args[]) {
		PagingBean p = new PagingBean(13, 2);
		p.setContentNumberPerPage(4);
		p.setPageNumberPerPageGroup(3);
		// 현페이지의 시작 row number 를 조회 5
		System.out.println("getBeginRowNumber:" + p.getStartRowNumber());
		// 현페이지의 마지막 row number 를 조회 8
		System.out.println("getEndRowNumber:" + p.getEndRowNumber());
		// 전체 페이지 수 : 4
		System.out.println("getTotalPage:" + p.getTotalPage());
		// 전체 페이지 그룹 수 : 2
		System.out.println("getTotalPageGroup:" + p.getTotalPageGroup());
		System.out.println("////////////////////////////");
		
		// 게시물수 31 -> 총페이지수 7 -> 총페이지그룹->2
		// 현재 페이지 그룹 : 2
		System.out.println("getNowPageGroup:" + p.getNowPageGroup());
		// 페이지 그룹의 시작 페이지 : 5
		System.out.println("getStartPageOfPageGroup:" + p.getStartPageOfPageGroup());
		// 페이지 그룹의 마지막 페이지 : 7
		System.out.println("getEndPageOfPageGroup:" + p.getEndPageOfPageGroup());
		// 이전 페이지 그룹이 있는 지 : true
		System.out.println("isPreviousPageGroup:" + p.isPreviousPageGroup());
		// 다음 페이지 그룹이 있는 지 : false
		System.out.println("isNextPageGroup:" + p.isNextPageGroup());

	}

}

