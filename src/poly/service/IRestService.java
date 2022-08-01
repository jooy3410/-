package poly.service;

import java.util.ArrayList;
import java.util.List;

import poly.dto.PagingDTO;
import poly.dto.RestDTO;
import poly.dto.SelfCheckDTO;

public interface IRestService {
	
	void InsertRestInfo() throws Exception;
	
	List<String> getRestInfo() throws Exception;

	int selfCheck(SelfCheckDTO pDTO) throws Exception;
	
	RestDTO getRestInfoDetail(RestDTO pDTO) throws Exception;
	
	int countBoard() throws Exception;

	int countSC() throws Exception;
	
	int updSCInfo(SelfCheckDTO pDTO) throws Exception;
	
	List<RestDTO> selectBoard(PagingDTO pDTO) throws Exception;

	List<RestDTO> getRestSearchList(RestDTO eDTO) throws Exception;

	SelfCheckDTO getSCInfo(SelfCheckDTO pDTO) throws Exception;
}
