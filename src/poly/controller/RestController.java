package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.PagingDTO;
import poly.dto.RestDTO;
import poly.dto.SafeDTO;
import poly.dto.SelfCheckDTO;
import poly.service.IRestService;
import poly.service.ISafeService;
import poly.util.CmmUtil;

@Controller
public class RestController {

	@Resource(name = "RestService")
	IRestService restService;

	@Resource(name = "SafeService")
	ISafeService safeService;

	private Logger log = Logger.getLogger(this.getClass());

	// 메인 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String Index(HttpServletRequest request, HttpServletResponse reponse, ModelMap model, HttpSession session)
			throws Exception {
		
		log.info(getClass().getName() + ".index start");

		if (session.getAttribute("SS_VAL") == null) {
			session.setAttribute("SS_VAL", 0);
		}

		int val = 0;

		int res = restService.countBoard();

		int num = restService.countSC();

		String user_id = (String) session.getAttribute("SS_USER_ID");

		if (user_id != null && session.getAttribute("SS_USER_NUM").equals("1")) {

			SafeDTO pDTO = new SafeDTO();
			pDTO.setUser_id(user_id);

			SafeDTO rDTO = safeService.getBuserInfo(pDTO);

			String safety_restrnt_no = rDTO.getSafety_restrnt_no();

			SelfCheckDTO p2DTO = new SelfCheckDTO();
			p2DTO.setSafety_restrnt_no(safety_restrnt_no);

			SelfCheckDTO r2DTO = restService.getSCInfo(p2DTO);

			if (r2DTO == null) {
				val = 0;
			} else {
				val = 1;
			}

			pDTO = null;
			p2DTO = null;
			rDTO = null;
			r2DTO = null;
		}
		
		model.addAttribute("res", String.valueOf(res));
		model.addAttribute("num", String.valueOf(num));
		model.addAttribute("val", String.valueOf(val));

		log.info(getClass().getName() + ".index end!");
		
		return "/index";
	}

	// 페이징 처리 안심식당 리스트
	@RequestMapping(value = "rest/restPaging.do")
	public String boardList(PagingDTO pDTO, ModelMap model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {

		log.info(this.getClass().getName() + ".restPaging start!");
		
		int total = restService.countBoard();

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "20";
		}

		pDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		model.addAttribute("paging", pDTO);
		model.addAttribute("viewAll", restService.selectBoard(pDTO));
		
		log.info(this.getClass().getName() + ".restPaging end!");
		
		return "rest/restPaging";
	}

	// 상호명 찾기, Search 기능
	@RequestMapping(value = "rest/restSearch", method = RequestMethod.GET)
	@ResponseBody
	public List<RestDTO> restSearchList(HttpServletRequest request) throws Exception {
		// 컨트롤러로 들어옴
		log.info(this.getClass().getName() + ".restSearch start!!");

		// jsp 보낸값을 받는거
		String bizplc_nm = CmmUtil.nvl(request.getParameter("name"));
		// CmmUtil .src > util > CmmUtil 함수 값이 널이면 ""으로 바꿔주는 것
		// ajax data {}, form name, ?title=값
		log.info("name: " + bizplc_nm);

		RestDTO pDTO = new RestDTO();
		pDTO.setBizplc_nm(bizplc_nm);

		List<RestDTO> eList = restService.getRestSearchList(pDTO);
		
		if(eList == null) {
			eList = new ArrayList<>();
		}

		log.info("eList size : " + eList.size());

		log.info(this.getClass().getName() + "restSearch end!!");

		return eList;
	}

	// 자가점검표 신규 등록 화면 불러오기
	@RequestMapping(value = "rest/SelfCheck.do", method = RequestMethod.GET)
	public String selfcheck(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
			HttpSession session) throws Exception {

		String user_id = (String) session.getAttribute("SS_USER_ID");

		SafeDTO pDTO = new SafeDTO();
		pDTO.setUser_id(user_id);

		SafeDTO rDTO = safeService.getBuserInfo(pDTO);
		
		if(rDTO == null) {
			rDTO = new SafeDTO();
		}

		String safety_restrnt_no = rDTO.getSafety_restrnt_no();

		model.addAttribute("safety_restrnt_no", safety_restrnt_no);

		pDTO = null;
		rDTO = null;

		return "rest/SelfCheck";
	}

	// 자가점검표 신규 등록 처리
	@RequestMapping(value = "rest/selfCheck.do")
	public String selfCheck(HttpServletRequest request, HttpServletResponse response, ModelMap model
			) throws Exception {

		log.info(this.getClass().getName() + ".selfCheck start!");
		
		String air = CmmUtil.nvl(request.getParameter("air"));
		String distance = CmmUtil.nvl(request.getParameter("distance"));
		String time = CmmUtil.nvl(request.getParameter("time"));
		String scale = CmmUtil.nvl(request.getParameter("scale"));
		String activity = CmmUtil.nvl(request.getParameter("activity"));
		String manager = CmmUtil.nvl(request.getParameter("manager"));
		String hdisinfectant = CmmUtil.nvl(request.getParameter("hdisinfectant"));
		String mask = CmmUtil.nvl(request.getParameter("mask"));
		String announcement = CmmUtil.nvl(request.getParameter("announcement"));
		String disinfection = CmmUtil.nvl(request.getParameter("disinfection"));
		String namecheck = CmmUtil.nvl(request.getParameter("namecheck"));
		String safety_restrnt_no = CmmUtil.nvl(request.getParameter("safety_restrnt_no"));

		SelfCheckDTO pDTO = new SelfCheckDTO();

		pDTO.setAir(air);
		pDTO.setDistance(distance);
		pDTO.setTime(time);
		pDTO.setScale(scale);
		pDTO.setActivity(activity);
		pDTO.setManager(manager);
		pDTO.setHdisinfectant(hdisinfectant);
		pDTO.setMask(mask);
		pDTO.setAnnouncement(announcement);
		pDTO.setDisinfection(disinfection);
		pDTO.setNamecheck(namecheck);
		pDTO.setSafety_restrnt_no(safety_restrnt_no);

		int res = restService.selfCheck(pDTO);

		String msg = "";

		if (res == 1) {
			msg = "등록이 완료되었습니다.";
		} else {
			msg = "오류로 인해 등록에 실패했습니다.";
		}

		model.addAttribute("msg", msg);
		
		log.info(this.getClass().getName() + ".selfCheck end!");

		return "/rest/Msg";
	}

	// 자가점검표 변경 페이지 불러오기
	@RequestMapping(value = "rest/ChgSC", method = RequestMethod.GET)
	public String ChgSC(HttpServletRequest request, HttpServletResponse reponse, ModelMap model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass().getName() + ".ChgSC start!");

		String user_id = (String) session.getAttribute("SS_USER_ID");

		SafeDTO pDTO = new SafeDTO();
		pDTO.setUser_id(user_id);

		SafeDTO rDTO = safeService.getBuserInfo(pDTO);

		if(rDTO == null) {
			rDTO = new SafeDTO();
		}
		
		String safety_restrnt_no = rDTO.getSafety_restrnt_no();

		SelfCheckDTO p2DTO = new SelfCheckDTO();
		p2DTO.setSafety_restrnt_no(safety_restrnt_no);

		SelfCheckDTO r2DTO = restService.getSCInfo(p2DTO);
		
		if(r2DTO == null) {
			r2DTO = new SelfCheckDTO();
		}

		model.addAttribute("safety_restrnt_no", safety_restrnt_no);
		model.addAttribute("r2DTO", r2DTO);

		log.info(this.getClass().getName() + ".ChgSC end!");

		return "/rest/ChgSC";

	}

	// 자가점검표 변경 처리
	@RequestMapping(value = "rest/updCheck")
	public String updSC(HttpServletRequest request, HttpServletResponse reponse, ModelMap model, HttpSession session)
			throws Exception {
		
		log.info(this.getClass().getName() + ".updCheck start");

		String msg = "";

		String air = CmmUtil.nvl(request.getParameter("air"));
		String distance = CmmUtil.nvl(request.getParameter("distance"));
		String time = CmmUtil.nvl(request.getParameter("time"));
		String scale = CmmUtil.nvl(request.getParameter("scale"));
		String activity = CmmUtil.nvl(request.getParameter("activity"));
		String manager = CmmUtil.nvl(request.getParameter("manager"));
		String hdisinfectant = CmmUtil.nvl(request.getParameter("hdisinfectant"));
		String mask = CmmUtil.nvl(request.getParameter("mask"));
		String announcement = CmmUtil.nvl(request.getParameter("announcement"));
		String disinfection = CmmUtil.nvl(request.getParameter("disinfection"));
		String namecheck = CmmUtil.nvl(request.getParameter("namecheck"));
		String safety_restrnt_no = CmmUtil.nvl(request.getParameter("safety_restrnt_no"));

		SelfCheckDTO pDTO = new SelfCheckDTO();

		pDTO.setAir(air);
		pDTO.setDistance(distance);
		pDTO.setTime(time);
		pDTO.setScale(scale);
		pDTO.setActivity(activity);
		pDTO.setManager(manager);
		pDTO.setHdisinfectant(hdisinfectant);
		pDTO.setMask(mask);
		pDTO.setAnnouncement(announcement);
		pDTO.setDisinfection(disinfection);
		pDTO.setNamecheck(namecheck);
		pDTO.setSafety_restrnt_no(safety_restrnt_no);

		int res = restService.updSCInfo(pDTO);

		if (res == 1) {
			msg = "변경에 성공했습니다.";
		} else {
			msg = "오류로 인해 변경에 실패했습니다.";
		}

		model.addAttribute("msg", msg);

		return "/rest/Msg";
	}

	// 안심식당 상세페이지
	@RequestMapping(value = "rest/restDetail.do", method = RequestMethod.GET)
	public String rest_detail(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
			HttpSession session) throws Exception {
		
		log.info(this.getClass().getName() + "restDetail start!");

		String safety_restrnt_no = request.getParameter("no");

		RestDTO pDTO = new RestDTO();
		pDTO.setSafety_restrnt_no(safety_restrnt_no);

		RestDTO rDTO = restService.getRestInfoDetail(pDTO);
		
		if(rDTO == null) {
			rDTO = new RestDTO();
		}

		model.addAttribute("rDTO", rDTO);

		log.info("restDetail.do end!!");

		return "/rest/restDetail";

	}

	// 자가점검표 리스트
	@RequestMapping(value = "rest/selfCheckList.do")
	public String SCList(PagingDTO pDTO, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {

		log.info(this.getClass().getName() + ".selfCheckList start!");
		
		int total = restService.countBoard();

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "20";
		}

		pDTO = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		model.addAttribute("paging", pDTO);
		model.addAttribute("viewAll", restService.selectBoard(pDTO));
		
		log.info(this.getClass().getName() + ".selfCheckList end!");
		
		return "rest/selfCheckList";
	}

	// 자가점검표 상세페이지
	@RequestMapping(value = "rest/SelfCheckDetail.do", method = RequestMethod.GET)
	public String sc_detail(HttpServletRequest request, HttpServletResponse reponse, ModelMap model,
			HttpSession session) throws Exception {
		
		log.info(this.getClass().getName() + "SelfCheckDetail start!");

		String msg = "";

		String safety_restrnt_no = request.getParameter("no");

		RestDTO pDTO = new RestDTO();
		pDTO.setSafety_restrnt_no(safety_restrnt_no);

		RestDTO rDTO = restService.getRestInfoDetail(pDTO);
		
		if(rDTO == null) {
			rDTO = new RestDTO();
		}

		String bizplc_nm = rDTO.getBizplc_nm();

		SelfCheckDTO p2DTO = new SelfCheckDTO();
		p2DTO.setSafety_restrnt_no(safety_restrnt_no);

		SelfCheckDTO r2DTO = restService.getSCInfo(p2DTO);

		if (r2DTO == null) {
			r2DTO = new SelfCheckDTO();
			msg = bizplc_nm + "는 자가점검표를 등록하지 않았습니다";
		}

		model.addAttribute("rDTO", rDTO);
		model.addAttribute("r2DTO", r2DTO);
		model.addAttribute("msg", msg);

		pDTO = null;
		p2DTO = null;
		rDTO = null;
		r2DTO = null;
		
		log.info(this.getClass().getName() + ".SelfCheckDetail end!");
		
		return "/rest/SelfCheckDetail";
	}

	// 안심식당 소개 페이지
	@RequestMapping(value = "rest/about.do")
	public String about() {
		
		log.info(this.getClass().getName() + ".about");
		
		return "rest/about";
	}

}
