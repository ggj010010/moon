package com.spring.moon.dto;

public class BoardPager {
	public static final int PAGE_SCALE = 10;
	// �솕硫대떦 �럹�씠吏� �닔
	public static final int BLOCK_SCALE = 10;
	private int curPage; // �쁽�옱 �럹�씠�닔
	private int prevPage; // �씠�쟾 �럹�씠吏�
	private int nextPage; // �떎�쓬 �럹�씠吏�
	private int totPage; // �쟾泥� �럹�씠吏� 媛��닔
	private int totBlock; // �쟾泥� �럹�씠吏� 釉붾줉 媛��닔
	private int curBlock; // �쁽�옱 �럹�씠吏� 釉붾줉 
	private int prevBlock; // �씠�쟾 �럹�씠吏� 釉붾줉
	private int nextBlock; // �떎�쓬 �럹�씠吏� 釉붾줉
	// WHERE rn BETWEEN #{start} AND #{end}
	private int pageBegin; // #{start}
	private int pageEnd; // #{end}
	// [�씠�쟾] blockBegin -> 41 42 43 44 45 46 47 48 49 50 [�떎�쓬]
	private int blockBegin; // �쁽�옱 �럹�씠吏� 釉붾줉�쓽 �떆�옉踰덊샇
	// [�씠�쟾] 41 42 43 44 45 46 47 48 49 50 <- blockEnd [�떎�쓬]
	private int blockEnd; // �쁽�옱 �럹�씠吏� 釉붾줉�쓽 �걹踰덊샇
	
	// �깮�꽦�옄
	// BoardPager(�젅肄붾뱶 媛��닔, �쁽�옱 �럹�씠吏� 踰덊샇)
	public BoardPager(int count, int curPage){
		curBlock = 1; // �쁽�옱 �럹�씠吏� 釉붾줉 踰덊샇
		this.curPage = curPage; // �쁽�옱 �럹�씠吏� �꽕�젙
		setTotPage(count); // �쟾泥� �럹�씠吏� 媛��닔 怨꾩궛
		setPageRange(); // 
		setTotBlock(); // �쟾泥� �럹�씠吏� 釉붾줉 媛��닔 怨꾩궛
		setBlockRange(); // �럹�씠吏� 釉붾줉�쓽 �떆�옉, �걹 踰덊샇 怨꾩궛
	}
	
	public void setBlockRange(){
		// *�쁽�옱 �럹�씠吏�媛� 紐뉖쾲吏� �럹�씠吏� 釉붾줉�뿉 �냽�븯�뒗吏� 怨꾩궛
		// (�쁽�옱�럹�씠吏�-1)/�럹�씠吏� 釉붾줉�떒�쐞+1
		// 1�럹�씠吏� => 1釉붾줉 (1-1)/10 + 1 => 1
		// 9�럹�씠吏� => 	1釉붾줉 (9-1)/10 + 1 => 1
		// 11�럹�씠吏� => 2釉붾줉 (11-1)/10 + 1 => 2
		// 57�럹�씠吏� => 6釉붾줉 (57-1)/10 + 1 => 6 
		curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
		// *�쁽�옱 �럹�씠吏� 釉붾줉�쓽 �떆�옉, �걹 踰덊샇 怨꾩궛
		// �럹�씠吏� 釉붾줉�쓽 �떆�옉踰덊샇
		// (�쁽�옱釉붾줉-1)*釉붾줉�떒�쐞+1
		// 1釉붾줉 => (1-1)*10 + 1 => 1
		// 2釉붾줉 => (2-1)*10 + 1 => 11
		// 6釉붾줉 => (6-1)*10 + 1 => 51
		blockBegin = (curBlock-1)*BLOCK_SCALE+1;
		// �럹�씠吏� 釉붾줉�쓽 �걹踰덊샇
		// 釉붾줉�떆�옉踰덊샇+釉붾줉�떒�쐞-1;
		// 1釉붾줉 => 1+10-1 => 10
		// 2釉붾줉 => 11+10-1 => 20
		// 6釉붾줉 => 51+10-1 => 60 	
		blockEnd = blockBegin+BLOCK_SCALE-1;
		// *留덉�留� 釉붾줉�씠 踰붿쐞瑜� 珥덇낵�븯吏� �븡�룄濡� 怨꾩궛
		// [�씠�쟾] 61 62 => �씠�윭�븳 寃쎌슦 70踰덇퉴吏� �굹�삤吏� �븡�룄濡앺븯湲� �쐞�빐�꽌
		if(blockEnd > totPage) blockEnd = totPage;
		// *�씠�쟾�쓣 �닃���쓣 �븣 �씠�룞�븷 �럹�씠吏� 踰덊샇
		prevPage = (curPage == 1)? 1:(curBlock-1)*BLOCK_SCALE;
		// *�떎�쓬�쓣 �닃���쓣 �븣 �씠�룞�븷 �럹�씠吏� 踰덊샇
		nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
		// 留덉�留� �럹�씠吏�媛� 踰붿쐞瑜� 珥덇낵�븯吏� �븡�룄濡� 泥섎━
		if(nextPage >= totPage) nextPage = totPage;
	}
	
	public void setPageRange(){
	// WHERE rn BETWEEN #{start} AND #{end}
		// �떆�옉踰덊샇 = (�쁽�옱�럹�씠吏�-1)*�럹�씠吏��떦 寃뚯떆臾쇱닔 +1
		pageBegin = (curPage-1)*PAGE_SCALE+1;
		// �걹踰덊샇 = �떆�옉踰덊샇+�럹�씠吏��떦 寃뚯떆臾쇱닔 -1
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
		// 91媛쒖쓽 寃뚯떆臾쇱쓣 10媛쒖뵫 9�럹�씠吏�瑜� 泥섎━�븯怨� �궓�� 1媛쒖쓽 寃뚯떆臾쇰룄 �럹�씠吏��뿉 異쒕젰�븯湲� �쐞�빐�꽌�뒗
		// �빆�긽 �삱由쇱쑝濡� 泥섎━�빐�빞�븳�떎.
		// Math.ceil(�떎�닔) �삱由� 泥섎━
		// 紐⑤뱺 �럹�씠吏��뒗 �삱由쇱쿂由�
		totPage = (int) Math.ceil(count*1.0 / PAGE_SCALE);
	}
	public int getTotBlock() {
		return totBlock;
	}
	
	// �럹�씠吏� 釉붾줉�쓽 媛��닔 怨꾩궛(珥� 100�럹�씠吏��씪硫� 10媛쒖쓽 釉붾줉)
	public void setTotBlock() {
		// �쟾泥� �럹�씠吏� 媛��닔 / 10
		// 91 / 10 => 9.1 => 10媛�
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
