package com.spring.moon.dto;

public class ReplyPager {
	// ?˜?´ì§??‹¹ ê²Œì‹œë¬? ?ˆ˜
	public static final int PAGE_SCALE = 5;
	// ?™”ë©´ë‹¹ ?˜?´ì§? ?ˆ˜
	public static final int BLOCK_SCALE = 5;
	private int curPage; // ?˜„?¬ ?˜?´?ˆ˜
	private int prevPage; // ?´? „ ?˜?´ì§?
	private int nextPage; // ?‹¤?Œ ?˜?´ì§?
	private int totPage; // ? „ì²? ?˜?´ì§? ê°??ˆ˜
	private int totBlock; // ? „ì²? ?˜?´ì§? ë¸”ë¡ ê°??ˆ˜
	private int curBlock; // ?˜„?¬ ?˜?´ì§? ë¸”ë¡ 
	private int prevBlock; // ?´? „ ?˜?´ì§? ë¸”ë¡
	private int nextBlock; // ?‹¤?Œ ?˜?´ì§? ë¸”ë¡
	// WHERE rn BETWEEN #{start} AND #{end}
	private int pageBegin; // #{start}
	private int pageEnd; // #{end}
	// [?´? „] blockBegin -> 41 42 43 44 45 46 47 48 49 50 [?‹¤?Œ]
	private int blockBegin; // ?˜„?¬ ?˜?´ì§? ë¸”ë¡?˜ ?‹œ?‘ë²ˆí˜¸
	// [?´? „] 41 42 43 44 45 46 47 48 49 50 <- blockEnd [?‹¤?Œ]
	private int blockEnd; // ?˜„?¬ ?˜?´ì§? ë¸”ë¡?˜ ?ë²ˆí˜¸
	
	// ?ƒ?„±?
	// BoardPager(? ˆì½”ë“œ ê°??ˆ˜, ?˜„?¬ ?˜?´ì§? ë²ˆí˜¸)
	public ReplyPager(int count, int curPage){
		curBlock = 1; // ?˜„?¬ ?˜?´ì§? ë¸”ë¡ ë²ˆí˜¸
		this.curPage = curPage; // ?˜„?¬ ?˜?´ì§? ?„¤? •
		setTotPage(count); // ? „ì²? ?˜?´ì§? ê°??ˆ˜ ê³„ì‚°
		setPageRange(); // 
		setTotBlock(); // ? „ì²? ?˜?´ì§? ë¸”ë¡ ê°??ˆ˜ ê³„ì‚°
		setBlockRange(); // ?˜?´ì§? ë¸”ë¡?˜ ?‹œ?‘, ? ë²ˆí˜¸ ê³„ì‚°
	}
	
	public void setBlockRange(){
		// *?˜„?¬ ?˜?´ì§?ê°? ëª‡ë²ˆì§? ?˜?´ì§? ë¸”ë¡?— ?†?•˜?Š”ì§? ê³„ì‚°
		// (?˜„?¬?˜?´ì§?-1)/?˜?´ì§? ë¸”ë¡?‹¨?œ„+1
		// 1?˜?´ì§? => 1ë¸”ë¡ (1-1)/10 + 1 => 1
		// 9?˜?´ì§? => 	1ë¸”ë¡ (9-1)/10 + 1 => 1
		// 11?˜?´ì§? => 2ë¸”ë¡ (11-1)/10 + 1 => 2
		// 57?˜?´ì§? => 6ë¸”ë¡ (57-1)/10 + 1 => 6 
		curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
		// *?˜„?¬ ?˜?´ì§? ë¸”ë¡?˜ ?‹œ?‘, ? ë²ˆí˜¸ ê³„ì‚°
		// ?˜?´ì§? ë¸”ë¡?˜ ?‹œ?‘ë²ˆí˜¸
		// (?˜„?¬ë¸”ë¡-1)*ë¸”ë¡?‹¨?œ„+1
		// 1ë¸”ë¡ => (1-1)*10 + 1 => 1
		// 2ë¸”ë¡ => (2-1)*10 + 1 => 11
		// 6ë¸”ë¡ => (6-1)*10 + 1 => 51
		blockBegin = (curBlock-1)*BLOCK_SCALE+1;
		// ?˜?´ì§? ë¸”ë¡?˜ ?ë²ˆí˜¸
		// ë¸”ë¡?‹œ?‘ë²ˆí˜¸+ë¸”ë¡?‹¨?œ„-1;
		// 1ë¸”ë¡ => 1+10-1 => 10
		// 2ë¸”ë¡ => 11+10-1 => 20
		// 6ë¸”ë¡ => 51+10-1 => 60 	
		blockEnd = blockBegin+BLOCK_SCALE-1;
		// *ë§ˆì?ë§? ë¸”ë¡?´ ë²”ìœ„ë¥? ì´ˆê³¼?•˜ì§? ?•Š?„ë¡? ê³„ì‚°
		// [?´? „] 61 62 => ?´?Ÿ¬?•œ ê²½ìš° 70ë²ˆê¹Œì§? ?‚˜?˜¤ì§? ?•Š?„ë¡í•˜ê¸? ?œ„?•´?„œ
		if(blockEnd > totPage) blockEnd = totPage;
		// *?´? „?„ ?ˆŒ???„ ?•Œ ?´?™?•  ?˜?´ì§? ë²ˆí˜¸
		prevPage = (curPage == 1)? 1:(curBlock-1)*BLOCK_SCALE;
		// *?‹¤?Œ?„ ?ˆŒ???„ ?•Œ ?´?™?•  ?˜?´ì§? ë²ˆí˜¸
		nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
		// ë§ˆì?ë§? ?˜?´ì§?ê°? ë²”ìœ„ë¥? ì´ˆê³¼?•˜ì§? ?•Š?„ë¡? ì²˜ë¦¬
		if(nextPage >= totPage) nextPage = totPage;
	}
	
	public void setPageRange(){
	// WHERE rn BETWEEN #{start} AND #{end}
		// ?‹œ?‘ë²ˆí˜¸ = (?˜„?¬?˜?´ì§?-1)*?˜?´ì§??‹¹ ê²Œì‹œë¬¼ìˆ˜ +1
		pageBegin = (curPage-1)*PAGE_SCALE+1;
		// ?ë²ˆí˜¸ = ?‹œ?‘ë²ˆí˜¸+?˜?´ì§??‹¹ ê²Œì‹œë¬¼ìˆ˜ -1
		pageEnd = pageBegin+PAGE_SCALE-1;
	}
	
	// Getter/Setter
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int count) {
		// 91ê°œì˜ ê²Œì‹œë¬¼ì„ 10ê°œì”© 9?˜?´ì§?ë¥? ì²˜ë¦¬?•˜ê³? ?‚¨?? 1ê°œì˜ ê²Œì‹œë¬¼ë„ ?˜?´ì§??— ì¶œë ¥?•˜ê¸? ?œ„?•´?„œ?Š”
		// ?•­?ƒ ?˜¬ë¦¼ìœ¼ë¡? ì²˜ë¦¬?•´?•¼?•œ?‹¤.
		// Math.ceil(?‹¤?ˆ˜) ?˜¬ë¦? ì²˜ë¦¬
		// ëª¨ë“  ?˜?´ì§??Š” ?˜¬ë¦¼ì²˜ë¦?
		totPage = (int) Math.ceil(count*1.0 / PAGE_SCALE);
	}
	public int getTotBlock() {
		return totBlock;
	}
	
	// ?˜?´ì§? ë¸”ë¡?˜ ê°??ˆ˜ ê³„ì‚°(ì´? 100?˜?´ì§??¼ë©? 10ê°œì˜ ë¸”ë¡)
	public void setTotBlock() {
		// ? „ì²? ?˜?´ì§? ê°??ˆ˜ / 10
		// 91 / 10 => 9.1 => 10ê°?
		totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
	}
	
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
	
}
