package dev.domain;

public class Page {
	//-------------Paging
		private int startPage;
		private int endPage;
		private boolean prev;
		private boolean next;
		//--전체건수 위한 필드
		private int total;
		private Criteria cri;
		private int lastPage;
		
		
	//--------생성자
		public Page(Criteria cri, int total) {
			this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0))*10;
			this.startPage = this.endPage-9;
			this.total = total;
			this.cri = cri;
			this.lastPage = (int) (Math.ceil(total*1.0/cri.getPostNum())); //마지막페이지
		
			if(this.endPage > lastPage)
				this.endPage = lastPage;
				
				this.prev = this.startPage > 1;
				this.next = this.endPage < lastPage;
		}


		public int getStartPage() {
			return startPage;
		}

		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}

		public int getEndPage() {
			return endPage;
		}

		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}

		public boolean isPrev() {
			return prev;
		}

		public void setPrev(boolean prev) {
			this.prev = prev;
		}

		public boolean isNext() {
			return next;
		}

		public void setNext(boolean next) {
			this.next = next;
		}

		public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}
		public Criteria getCri() {
			return cri;
		}


		public void setCri(Criteria cri) {
			this.cri = cri;
		}


		public int getLastPage() {
			return lastPage;
		}


		public void setLastPage(int lastPage) {
			this.lastPage = lastPage;
		}
}
