package util;
/*
        nowPage:현재페이지
        rowTotal:전체데이터갯수
        blockList:한페이지당 게시물수
        blockPage:한화면에 나타낼 페이지 메뉴 수
 */
public class NoticePaging {
	public static String NoticegetPaging(String pageURL, int nowPage, int rowTotal, int blockList, int blockPage){
	    int totalPage, startPage, endPage;
	    boolean isPrevPage, isNextPage;
	    StringBuffer sb;

	    isPrevPage=isNextPage=false;
	    totalPage = (int)(rowTotal/blockList);
	    if(rowTotal%blockList!=0)totalPage++;

	    if(nowPage > totalPage)nowPage = totalPage;

	    startPage = (int)(((nowPage-1)/blockPage)*blockPage+1);
		endPage = startPage + blockPage - 1; //

		if(endPage > totalPage)endPage = totalPage;
	    if(endPage < totalPage) isNextPage = true;
	    if(startPage > 1) isPrevPage = true;

	    sb = new StringBuffer();

	    if(isPrevPage){
			sb.append("<a href ='"+pageURL+"?page=");
			//sb.append(nowPage - blockPage);
			sb.append( startPage-1 );
			sb.append("'>◀</a>");
		}	else
			sb.append("◀");
	    
	    for(int i=startPage; i<=endPage; i++) {
	        if(i > totalPage) break;
	        if(i == nowPage) {
	            sb.append("&nbsp;<b><font color='black'>");
	            sb.append(i);
	            sb.append("</font></b>");
	        } else {
	            sb.append("&nbsp;<a href='" + pageURL + "?page=" + i + "'><font color='black'>");
	            sb.append(i);
	            sb.append("</font></a>");
	        }
	    }

	    sb.append("&nbsp;");

		if(isNextPage){
			sb.append("<a href='"+pageURL+"?page=");
			
			sb.append(endPage + 1);
			/*if(nowPage+blockPage > totalPage)nowPage = totalPage;
			else
				nowPage = nowPage+blockPage;
			sb.append(nowPage);*/
			sb.append("'>▶</a>");
		}
		else
			sb.append("▶");
//---------------------------------------------------------------------------------------------------------------------	    

		return sb.toString();
	}



}