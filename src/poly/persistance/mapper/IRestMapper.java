package poly.persistance.mapper;

import java.util.ArrayList;
import java.util.List;

import config.Mapper;
import poly.dto.PagingDTO;
import poly.dto.RestDTO;

@Mapper("RestMapper")
public interface IRestMapper {

	int InsertRestInfo(RestDTO pDTO) throws Exception;
	
	// 안심식당 정보 INSERT 전 중복 체크하기(DB조회하기)
	RestDTO getRestExists(RestDTO pDTO) throws Exception;
	
	List<String> getRestInfo() throws Exception;
	
	RestDTO getRestInfoDetail(RestDTO pDTO) throws Exception;
	
	List<RestDTO> selectBoard(PagingDTO pDTO) throws Exception;

	int countBoard() throws Exception;

	public List<RestDTO> getRestSearchList(RestDTO eDTO) throws Exception;
	
	ArrayList<RestDTO> getBizplc(RestDTO pDTO) throws Exception;
}
