package poly.service.impl;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.MailDTO;
import poly.dto.NUserInfoDTO;
import poly.dto.SafeDTO;
import poly.persistance.mapper.ISafeMapper;
import poly.service.IMailService;
import poly.service.ISafeService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Service("SafeService")
public class SafeService implements ISafeService {

	@Resource(name = "SafeMapper")
	private ISafeMapper safeMapper;

	// 메일 발송을 위한 MailService 자바객체 가져오기
	@Resource(name = "MailService")
	private IMailService mailService;

	// 사업자 개인정보 등록
	@Override
	public int insertSafeUserInfo(SafeDTO pDTO) throws Exception {
		// 회원가입 성공 :1, 아이디 중복으로인한 실패:2, 기타에러:0
		int res = 0;

		// controller에서 같이 정상적으로 못 넘어오는 경우 대비
		if (pDTO == null) {
			pDTO = new SafeDTO();
		}

		// 회원 가입 중복 방지를 위해 DB에서 테이터 조회
		SafeDTO rDTO = safeMapper.getSafeUserExists(pDTO);

		// mapper에서 같이 정상적으로 못 넘어오는 경우 대비
		if (rDTO == null) {
			rDTO = new SafeDTO();
		}

		// 중복된 회원정보가 있는 경우, 결과값을 2로 변경, 더이상 작업 진행안함
		if (CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
			res = 2;

		} else { // 중복이 아니면 계속 진행

			// 회원 가입
			int success = safeMapper.insertSafeUserInfo(pDTO);

			// db에 데이터가 등록
			if (success > 0) {

				res = 1; // 1:성공

				/*
				 * ###################################################
				 * 
				 * 메일 발송 로직 추가 시작
				 * 
				 * ###################################################
				 */

				MailDTO mDTO = new MailDTO();

				// 회원가입화면에서 입력받은 이메일 변수(암호화되어 넘어오기 떄문에 복호화 수행)
				mDTO.setToMail(EncryptUtil.decAES128CBC(CmmUtil.nvl(pDTO.getEmail())));

				// 제목
				mDTO.setTitle("회원가입을 축하합니다.");
				// 내용 가입자 이름넣어 발송
				mDTO.setContents(CmmUtil.nvl(pDTO.getUser_name()) + "님의 회원가입을 진심으로 축하드립니다.");

				// 회원 가입이 성공했기 때문에 발송
				mailService.doSendMail(mDTO);

				/*
				 * ###################################################
				 * 
				 * 메일 발송 로직 추가 끝
				 * 
				 * ###################################################
				 */
			} else {
				res = 0;
			}
		}
		return res;
	}
	
	// 사업자 로그인
	@Override
	public int getUserSafeLoginCheck(SafeDTO pDTO) throws Exception {
		// 로그인 성공 : 1, 실패 : 0
		int res = 0;

		// 로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위한 mapper 호출하기
		SafeDTO rDTO = safeMapper.getUserSafeLoginCheck(pDTO);

		if (rDTO == null) {
			rDTO = new SafeDTO();
		}

		// 로그인 성공 여부 체크 시작

		/*
		 * userInfoMapper로 부터 SELECT 쿼리의 결과로 회원아이디를 받아왔다면, 로그인 성공
		 * 
		 * DTO의 변수에 값이 있는지 확인하기 처리속도 측면에서 가장 좋은 방법은 변수의 길이를 가져오는 것이다. 따라서 .length() 함수를
		 * 통해 회원아이디의 글자수를 가져와 0보다 큰지 비교한다. 0보다 크다면, 글자가 존재하는 것이기 때문에 값이 존재한다.
		 */
		if (CmmUtil.nvl(rDTO.getUser_id()).length() > 0) {
			res = 1;
		}

		// 로그인 성공 여부 체크 끝

		return res;
	}

	// 개인회원 개인정보 등록
	@Override
	public int insertNUserInfo(NUserInfoDTO pDTO) throws Exception {
		// 회원가입 성공 :1, 아이디 중복으로인한 실패:2, 기타에러:0
		int res = 0;

		// controller에서 같이 정상적으로 못 넘어오는 경우 대비
		if (pDTO == null) {
			pDTO = new NUserInfoDTO();
		}

		// 회원 가입 중복 방지를 위해 DB에서 테이터 조회
		NUserInfoDTO rDTO = safeMapper.getNUserExists(pDTO);

		// mapper에서 같이 정상적으로 못 넘어오는 경우 대비
		if (rDTO == null) {
			rDTO = new NUserInfoDTO();
		}

		// 중복된 회원정보가 있는 경우, 결과값을 2로 변경, 더이상 작업 진행안함
		if (CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
			res = 2;

		} else { // 중복이 아니면 계속 진행

			// 회원 가입
			int success = safeMapper.insertNUserInfo(pDTO);

			// db에 데이터가 등록
			if (success > 0) {

				res = 1; // 1:성공

				/*
				 * ###################################################
				 * 
				 * 메일 발송 로직 추가 시작
				 * 
				 * ###################################################
				 */

				MailDTO mDTO = new MailDTO();

				// 회원가입화면에서 입력받은 이메일 변수(암호화되어 넘어오기 떄문에 복호화 수행)
				mDTO.setToMail(EncryptUtil.decAES128CBC(CmmUtil.nvl(pDTO.getEmail())));

				// 제목
				mDTO.setTitle("회원가입을 축하합니다.");
				// 내용 가입자 이름넣어 발송
				mDTO.setContents(CmmUtil.nvl(pDTO.getUser_name()) + "님의 회원가입을 진심으로 축하드립니다.");

				// 회원 가입이 성공했기 때문에 발송
				mailService.doSendMail(mDTO);

				/*
				 * ###################################################
				 * 
				 * 메일 발송 로직 추가 끝
				 * 
				 * ###################################################
				 */
			} else {
				res = 0;
			}
		}
		return res;
	}

	// 개인회원 로그인
	@Override
	public int getNUserLoginCheck(NUserInfoDTO pDTO) throws Exception {
		// 로그인 성공 : 1, 실패 : 0
		int res = 0;

		// 로그인을 위해 아이디와 비밀번호가 일치하는지 확인하기 위한 mapper 호출하기
		NUserInfoDTO rDTO = safeMapper.getNUserLoginCheck(pDTO);

		if (rDTO == null) {
			rDTO = new NUserInfoDTO();
		}

		// 로그인 성공 여부 체크 시작

		/*
		 * userInfoMapper로 부터 SELECT 쿼리의 결과로 회원아이디를 받아왔다면, 로그인 성공
		 * 
		 * DTO의 변수에 값이 있는지 확인하기 처리속도 측면에서 가장 좋은 방법은 변수의 길이를 가져오는 것이다. 따라서 .length() 함수를
		 * 통해 회원아이디의 글자수를 가져와 0보다 큰지 비교한다. 0보다 크다면, 글자가 존재하는 것이기 때문에 값이 존재한다.
		 */
		if (CmmUtil.nvl(rDTO.getUser_id()).length() > 0) {
			res = 1;
		}

		// 로그인 성공 여부 체크 끝

		return res;
	}

	// 개인회원 정보 불러오기
	@Override
	public NUserInfoDTO getPuserInfo(NUserInfoDTO pDTO) throws Exception {

		return safeMapper.getPuserInfo(pDTO);
	}

	// 사업자 정보 불러오기
	@Override
	public SafeDTO getBuserInfo(SafeDTO pDTO) throws Exception {

		return safeMapper.getBuserInfo(pDTO);
	}

	// 인증번호 생성
	@Override
	public String certNumber() throws Exception {

		Random ran = new Random();

		String str;

		String value = "";

		for (int i = 0; i < 6; i++) {
			if (ran.nextBoolean()) {
				// A-Z
				str = String.valueOf((char) ((ran.nextInt(26)) + 65));
				value = value + str;
				continue;
			} else {
				// 0-9
				str = String.valueOf(ran.nextInt(10));
				value = value + str;
				continue;
			}

		}

		return value;
	}

	// 사업자 비밀번호 변경
	@Override
	public int changePwdB(SafeDTO pDTO) throws Exception {

		int res = 0;

		int success = safeMapper.changePwdB(pDTO);

		if (success > 0) {
			res = 1;
		} else {
			res = 0;
		}

		return res;
	}

	// 사업자 회원정보 수정
	@Override
	public int updBUserInfo(SafeDTO pDTO) throws Exception {

		int res = 0;

		int success = safeMapper.updBUserInfo(pDTO);

		if (success > 0) {
			res = 1;
		} else {
			res = 0;
		}

		return res;
	}
	
	// 개인회원 비밀번호 변경
	@Override
	public int changePwdP(NUserInfoDTO pDTO) throws Exception {

		int res = 0;

		int success = safeMapper.changePwdP(pDTO);

		if (success > 0) {
			res = 1;
		} else {
			res = 0;
		}

		return res;
	}
	
	// 개인회원 회원정보 수정
	@Override
	public int updPUserInfo(NUserInfoDTO pDTO) throws Exception {

		int res = 0;

		int success = safeMapper.updPUserInfo(pDTO);

		if (success > 0) {
			res = 1;
		} else {
			res = 0;
		}

		return res;
	}
	
}
