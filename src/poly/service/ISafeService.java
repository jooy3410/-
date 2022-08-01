package poly.service;

import poly.dto.NUserInfoDTO;
import poly.dto.SafeDTO;

public interface ISafeService {

	int insertSafeUserInfo(SafeDTO pDTO) throws Exception;

	int getUserSafeLoginCheck(SafeDTO pDTO) throws Exception;

	SafeDTO getBuserInfo(SafeDTO pDTO) throws Exception;

	// 사업자 비밀번호 변경
	int changePwdB(SafeDTO pDTO) throws Exception;
	
	// 사업자 회원정보 변경
	int updBUserInfo(SafeDTO pDTO) throws Exception;

	// 개인회원
	int insertNUserInfo(NUserInfoDTO pDTO) throws Exception;

	int getNUserLoginCheck(NUserInfoDTO pDTO) throws Exception;

	NUserInfoDTO getPuserInfo(NUserInfoDTO pDTO) throws Exception;

	// 개인회원 비밀번호 변경
	int changePwdP(NUserInfoDTO pDTO) throws Exception;
	
	// 개인회원 회원정보 변경
	int updPUserInfo(NUserInfoDTO pDTO) throws Exception;

	// 인증번호 생성
	String certNumber() throws Exception;
}
