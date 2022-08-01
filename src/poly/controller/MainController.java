package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="basic/footer")
	public String footer() {
		log.info(this.getClass());
		
		return "basic/footer";
	}
	
	@RequestMapping(value="basic/top")
	public String top() {
		log.info(this.getClass());
		
		return "basic/top";
	}
	
	@RequestMapping(value="basic/content")
	public String content() {
		log.info(this.getClass());
		
		return "basic/content";
	}
	
	@RequestMapping(value="basic/center")
	public String center() {
		log.info(this.getClass());
		
		return "/basic/center";
	}	
	
}