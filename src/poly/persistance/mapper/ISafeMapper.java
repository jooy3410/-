package poly.persistance.mapper;

import config.Mapper;
import poly.dto.NUserInfoDTO;
import poly.dto.SafeDTO;

@Mapper("SafeMapper")
public interface ISafeMapper {

	int insertSafeUserInfo(SafeDTO pDTO) throws Exception;

	SafeDTO getSafeUserExists(SafeDTO pDTO) throws Exception;

	SafeDTO getUserSafeLoginCheck(SafeDTO pDTO) throws Exception;
	
	SafeDTO getBuserInfo(SafeDTO pDTO) throws Exception;
	
	// 사업자 비밀번호 변경
	int changePwdB(SafeDTO pDTO) throws Exception;
	
	// 사업자 정보 수정
	int updBUserInfo(SafeDTO pDTO) throws Exception;

	// 개인회원

	int insertNUserInfo(NUserInfoDTO pDTO) throws Exception;

	NUserInfoDTO getNUserExists(NUserInfoDTO pDTO) throws Exception;

	NUserInfoDTO getNUserLoginCheck(NUserInfoDTO pDTO) throws Exception;

	NUserInfoDTO getPuserInfo(NUserInfoDTO pDTO) throws Exception;
	
	// 개인회원 비밀번호 변경
	int changePwdP(NUserInfoDTO pDTO) throws Exception;
	
	// 개인회원 정보 수정
	int updPUserInfo(NUserInfoDTO pDTO) throws Exception;
}
