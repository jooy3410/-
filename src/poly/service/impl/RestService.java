package poly.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import poly.dto.PagingDTO;
import poly.dto.RestDTO;
import poly.dto.SelfCheckDTO;
import poly.persistance.mapper.IRestMapper;
import poly.persistance.mapper.ISelfCheckMapper;
import poly.service.IRestService;
import poly.util.CmmUtil;
import test.Test;

@Configuration
@EnableScheduling
@Service("RestService")
public class RestService implements IRestService{
	
	@Resource(name="RestMapper")
	private IRestMapper restMapper;
	
	@Resource(name="SelfCheckMapper")
	private ISelfCheckMapper selfCheckMapper;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	// 매주 월요일 새벽 5시에 안심식당 정보를 등록/갱신하는 스케줄
	// 안심식당 API 파싱 후 DB 저장
	@Override
	@Scheduled(cron="0 0 5 ? * MON")  
	public void InsertRestInfo() throws Exception{
		
		RestDTO pDTO = new RestDTO();
		RestDTO rDTO = new RestDTO();
		
		int page = 1;   // 페이지 초기값 
	      try{
	    	  
	         while(true){
	            // parsing할 url 지정(API 키 포함해서)
	            String url = "https://openapi.gg.go.kr/SafetyRestrntInfo?KEY=12200392d4a94e059fec5a6fa315518c&pIndex="+page+"&pSize=1000";
	            
	            DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
	            DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
	            Document doc = dBuilder.parse(url);
	            
	            // root tag 
	            doc.getDocumentElement().normalize();
	            System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
	            
	            // 파싱할 tag
	            NodeList nList = doc.getElementsByTagName("row");
	            
	            System.out.println("파싱할 리스트 수 : "+ nList.getLength());
	            
	            for(int temp = 0; temp < nList.getLength(); temp++){
	               Node nNode = nList.item(temp);
	               if(nNode.getNodeType() == Node.ELEMENT_NODE){
	                  
	                  Element eElement = (Element) nNode;
	                  System.out.println("######################");
	                  System.out.println("식당번호  : " + Test.getTagValue("SAFETY_RESTRNT_NO", eElement));
	                  System.out.println("상호명  : " + Test.getTagValue("BIZPLC_NM", eElement));
	                  System.out.println("구주소  : " + Test.getTagValue("REFINE_LOTNO_ADDR", eElement));
	                  
	                  pDTO.setBizplc_nm(CmmUtil.nvl(Test.getTagValue("BIZPLC_NM", eElement))); //상호명
	                  pDTO.setRefine_lotno_addr(CmmUtil.nvl(Test.getTagValue("REFINE_LOTNO_ADDR", eElement))); //구주소
	                  pDTO.setSafety_restrnt_no(CmmUtil.nvl(Test.getTagValue("SAFETY_RESTRNT_NO", eElement)));//식당번호             
	          		  pDTO.setRefine_roadnm_addr(CmmUtil.nvl(Test.getTagValue("REFINE_ROADNM_ADDR", eElement))); //도로명주소
	          		  pDTO.setDetail_addr(CmmUtil.nvl(Test.getTagValue("DETAIL_ADDR", eElement)));
	          		  pDTO.setSigngu_nm(CmmUtil.nvl(Test.getTagValue("SIGNGU_NM", eElement)));
	          		  pDTO.setSido_nm(CmmUtil.nvl(Test.getTagValue("SIDO_NM", eElement)));
	          		  pDTO.setIndutype_nm(CmmUtil.nvl(Test.getTagValue("INDUTYPE_NM", eElement)));
	          		  pDTO.setIndutype_detail_nm(CmmUtil.nvl(Test.getTagValue("INDUTYPE_DETAIL_NM", eElement)));//업종상세명
	          		  pDTO.setTelno(CmmUtil.nvl(Test.getTagValue("TELNO", eElement)));//전화번호
	          		  
	          		  rDTO = restMapper.getRestExists(pDTO);
	          		  
	          		  if(rDTO == null) {
	          			  rDTO = new RestDTO();
	          		  }
	          		  
	          		  if(CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
	          			  continue;
	          		  } else {
	          			  restMapper.InsertRestInfo(pDTO);
	          		  }
	          		  
	               }   // for end
	            }   // if end
	           	         	     
	            page += 1;
	            System.out.println("page number : " + page);
	            if(page > 12){ 
	               break;
	            }
	         }   // while end
	         
	         pDTO = null;
	         rDTO = null;
	         
	      } catch (Exception e){   
	         e.printStackTrace();
	      }   // try~catch end
		
	}
	
	// 안심식당 정보 불러오기
	@Override
	public List<String> getRestInfo() throws Exception{
			
		return restMapper.getRestInfo();
	}
	
	// 자가점검표 신규 등록
	@Override
	public int selfCheck(SelfCheckDTO pDTO) throws Exception{
		
		int res = 0;
		
		if(pDTO == null) {
			pDTO = new SelfCheckDTO();
		}
		
		int success = selfCheckMapper.insertSCInfo(pDTO);
		
		if(success > 0) {
			res = 1;
		}
		
		return res;
	}
	
	// 자가점검표 수정
	@Override
	public int updSCInfo(SelfCheckDTO pDTO) throws Exception{
		
		int res = 0;
		
		int success = 0;
		
		success = selfCheckMapper.updSCInfo(pDTO);
		
		if(success > 0) {
			res = 1;
		}else {
			res = 0;
		}
		
		return res;
	}
	
	// 자가점검표 총 갯수
	@Override
	public int countSC() throws Exception{
		return selfCheckMapper.countSC();
	}
	
	// 안심식당 총 갯수
	@Override
	public int countBoard() throws Exception{
		
		return restMapper.countBoard();
	}

	// 안심식당 리스트 페이징 처리
	@Override
	public List<RestDTO> selectBoard(PagingDTO pDTO) throws Exception{
		
		return restMapper.selectBoard(pDTO);
	}

	// 안심식당 리스트 검색
	@Override
	public List<RestDTO> getRestSearchList(RestDTO eDTO) throws Exception{
		
		return restMapper.getRestSearchList(eDTO);
	}

	// 안심식당 상세페이지
	@Override
	public RestDTO getRestInfoDetail(RestDTO pDTO) throws Exception{
			
		return restMapper.getRestInfoDetail(pDTO);
	}
	
	// 자가점검표 상세페이지 로딩을 위해서 디비에서 값을 가져오기
	public SelfCheckDTO getSCInfo(SelfCheckDTO pDTO) throws Exception{
		
		return selfCheckMapper.getSCInfo(pDTO);
	}
}
