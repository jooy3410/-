package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.BoardDTO;
import poly.service.IBoardService;

@Controller
public class BoardController {

	@Resource(name = "BoardService")
	IBoardService boardService;

	private Logger log = Logger.getLogger(this.getClass());

	// 공지사항 리스트
	@RequestMapping(value = "notice/noticeList")
	public String noticeList(ModelMap model) throws Exception {

		log.info(this.getClass().getName() + ".noticeList start!");

		List<BoardDTO> rList = boardService.getBoardList();

		if (rList == null) {
			rList = new ArrayList<>();
		}

		model.addAttribute("rList", rList);

		log.info(this.getClass().getName() + ".noticeList end!");

		return "/notice/noticeList";
	}

	// 새 글 작성
	@RequestMapping(value = "notice/newpost")
	public String newpost() {

		log.info(this.getClass().getName() + ".newpost start!");
		log.info(this.getClass().getName() + ".newpost end!");

		return "/notice/newpost";
	}

	// 새 글 작성 함수
	@RequestMapping(value = "board/dopost.do")
	public String dopost(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {

		log.info(this.getClass().getName() + ".dopost start!");

		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");
		String post_id = (String) session.getAttribute("SS_USER_ID");

		BoardDTO pDTO = new BoardDTO();
		pDTO.setReg_id(post_id);
		pDTO.setPost_title(post_title);
		pDTO.setPost_content(post_content);

		int result = boardService.insertPost(pDTO);

		String msg = "";
		String url = "/notice/noticeList.do";

		if (result < 1) {
			// 실패
			msg = "게시글 등록에 실패했습니다.";
		} else {
			// 성공
			msg = "등록에 성공했습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		log.info(this.getClass().getName() + ".dopost end!");

		return "/notice/reNotice";

	}

	// 글 상세 보기
	@RequestMapping("notice/noticeDetail")
	public String boardDetail(HttpServletRequest request, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + ".noticeDetail start!");

		String post_no = request.getParameter("no");

		BoardDTO pDTO = new BoardDTO();
		pDTO.setPost_no(post_no);

		BoardDTO rDTO = boardService.getPostDetail(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info(this.getClass().getName() + ".noticeDetail end!");

		return "/notice/noticeDetail";
	}

	// 글 삭제
	@RequestMapping("board/deletePost")
	public String deletePost(HttpServletRequest request, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + ".deletePost start!");

		String post_no = request.getParameter("no");

		BoardDTO pDTO = new BoardDTO();
		pDTO.setPost_no(post_no);

		int result = boardService.deletePost(pDTO);

		String msg = "";
		String url = "/notice/noticeList.do";

		if (result < 1) {
			// 실패
			msg = "게시글 삭제 했습니다.";
		} else {
			// 성공
			msg = "삭제를 성공했습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		log.info(this.getClass().getName() + ".deletePost end!");

		return "/notice/reNotice";

	}

	// 글 수정
	@RequestMapping(value = "notice/editPost")
	public String editPost(HttpServletRequest request, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + ".editPost start!");

		String post_no = request.getParameter("no");

		BoardDTO pDTO = new BoardDTO();
		pDTO.setPost_no(post_no);

		// 게시글에 대한 자세한 정보를 불러오는 함수
		// 게시글 보기 기능에서 이미 만들었으므로 재활용해준다.
		BoardDTO rDTO = boardService.getPostDetail(pDTO);

		model.addAttribute("rDTO", rDTO);

		log.info(this.getClass().getName() + ".editPost end!");

		return "/notice/editPost";

	}

	// 글 수정 함수
	@RequestMapping("board/doEditPost")
	public String doEditPost(HttpServletRequest request, ModelMap model) throws Exception {

		log.info(this.getClass().getName() + ".doEditPost start!");

		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");
		String post_no = request.getParameter("post_no");

		log.info(post_title);
		log.info(post_content);
		log.info(post_no);

		BoardDTO pDTO = new BoardDTO();
		pDTO.setPost_title(post_title);
		pDTO.setPost_content(post_content);
		pDTO.setPost_no(post_no);

		int result = boardService.updatePost(pDTO);

		String msg = "";
		String url = "/notice/noticeDetail.do?no=" + post_no;

		if (result < 1) {
			// 실패
			msg = "게시글 수정 실패 했습니다.";
		} else {
			// 성공
			msg = "게시글 수정 성공 했습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		log.info(this.getClass().getName() + ".doEditPost end!");

		return "/notice/reNotice";

	}

}
