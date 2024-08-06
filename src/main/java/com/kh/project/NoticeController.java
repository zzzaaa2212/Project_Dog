package com.kh.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vo.NoticeVO;
import vo.InquiryVO;
import dao.NoticeDAO;
import util.Common;

@Controller
public class NoticeController {

	@Autowired
	ServletContext app;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	

	@Autowired
	NoticeDAO notice_dao;

	public NoticeController(NoticeDAO notice_dao) {
		
		this.notice_dao = notice_dao;
	}

	//게시글
	@RequestMapping("/gongList.do")
	public String list(Model model,String page){
		
		int nowPage = 1;
		
		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		int start = (nowPage - 1) * Common.Gong.BLOCKLIST + 1;
		int end = start + Common.Gong.BLOCKLIST - 1;
		
		

		

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		
		
		int row_total = notice_dao.getRowTotal(map);
		
		String pageMenu = util.NoticePaging.NoticegetPaging("gongList.do", nowPage, row_total,
				Common.Gong.BLOCKLIST, Common.Gong.BLOCKPAGE);
		
		List<NoticeVO> list = notice_dao.selectList(map);
		model.addAttribute("list", list);
		model.addAttribute("pageMenu",pageMenu);
		
		System.out.println("pagemenu :"+ pageMenu);
		return Common.Gong.VIEW_PATH_GONG + "notice_list.jsp";

	}
	
	
	

	// 새 글 작성 폼
	@RequestMapping("/write.do")
	public String insert_form() {
		return Common.Gong.VIEW_PATH_GONG + "notice_write.jsp";
		
	}

	// 새 글 등록
	@RequestMapping("/insert.do")
	public String insert(NoticeVO vo) {

		notice_dao.insert(vo);

		return "redirect:list.do";

	}

	// 게시글 상세보기
	@RequestMapping("/view.do")
	public String view(Model model, int idx) {
		
		
	
		 //조회수	 무한증가 방지를 위한 세션
		NoticeVO vo = notice_dao.selectOne(idx);
			
			
			  String show = (String)session.getAttribute("show");
			  
			  if(show == null) {
				  notice_dao.update_readhit(idx);
			  session.setAttribute("show",""); 
			  }
		  
			  model.addAttribute("vo", vo);
			  
			  
		return Common.Gong.VIEW_PATH_GONG + "notice_view.jsp";
		

	}

}