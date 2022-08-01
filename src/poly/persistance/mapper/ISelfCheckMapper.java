package poly.persistance.mapper;

import config.Mapper;
import poly.dto.SelfCheckDTO;

@Mapper("SelfCheckMapper")
public interface ISelfCheckMapper {

	int insertSCInfo(SelfCheckDTO pDTO) throws Exception;
	
	int countSC() throws Exception;
	
	SelfCheckDTO getSCInfo(SelfCheckDTO pDTO) throws Exception;
	
	int updSCInfo(SelfCheckDTO pDTO) throws Exception;
}
