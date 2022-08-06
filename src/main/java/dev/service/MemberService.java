package dev.service;

import java.util.List;

import dev.domain.Criteria;
import dev.domain.Member;
import dev.repository.MemberRepository;

public class MemberService {

	/*
	 * Field
	 */
	// 싱글톤
	private static MemberService memberService = new MemberService();
	MemberRepository memberRepository = new MemberRepository();

	/*
	 * Constructor
	 */
	private MemberService() {
	}

	/*
	 * Method
	 */
	public static MemberService getMemberService() {
		return memberService;
	}

	// 회원가입
	public void joinMember(Member member) {
		// DB 저장시 비밀번호는 암호화해서 저장
		member.setPassword(encryption(member.getPassword()));
		memberRepository.insert(member);
	}

	// 회원 정보 수정 --> 세션의 로그인 멤버를 가져와 비밀번호 
	public void modifyMember(Member member) {
		member.setPassword(encryption(member.getPassword()));
		memberRepository.update(member);
		member.setPassword(decryption(member.getPassword()));
	}

	// 회원 정보 삭제
	public void deleteMember(String id) {
		memberRepository.delete(id);
	}

	// 회원 단건 조회
	public Member findOneMember(String id) {
		Member member = memberRepository.selectOne(id);
		// 조회 시 비밀번호 복호화해서 가져오기
		if (member != null) {
			member.setPassword(decryption(member.getPassword()));
		}
		return member;
	}

	// 회원 전체 조회
	public List<Member> findAllMembers() {
		List<Member> list = memberRepository.selectAll();
		// 조회 시 비밀번호 복호화해서 가져오기
		for (Member member : list) {
			member.setPassword(decryption(member.getPassword()));
		}
		return list;
	}
	
	// id 중복체크
	public String checkIdDupl(String id) {
		Member member = memberRepository.selectOne(id);
		
		if (member == null) {
			return "isNotDupl"; // id 사용가능
		}
		else {
			return "isDupl"; // id 사용불가
		}
	}
	
	// 로그인
	public Member login(String id, String password) {
	
		// 복호화 로직이 들어간 memberService.findOneMember(id) 메서드 사용
		Member member = memberService.findOneMember(id);
		
		if (member != null) {
			if (member.getPassword().equals(password)) {
				return member;
			}
		}
		return null;
	}

	// 시저암호 - DB에 비밀번호 입력 시 암.복호화를 적용
	// 암호화
	private static String encryption(String password) {
		String answer = "";
		int n = 3;

		for (int i = 0; i < password.length(); i++) {
			char ch = password.charAt(i);

			if (Character.isLowerCase(ch)) { // 소문자
				ch = (char) ((ch - 'a' + n) % 26 + 'a');
			} else if (Character.isUpperCase(ch)) { // 대문자
				ch = (char) ((ch - 'A' + n) % 26 + 'A');
			}
			answer += ch;
		}
		return answer;
	}
	
	// 복호화
	private static String decryption(String password) {
		String answer = "";
		int n = 3;

		for (int i = 0; i < password.length(); i++) {
			char ch = password.charAt(i);

			if (Character.isLowerCase(ch)) { // 소문자
				ch = (char) ((ch - 'z' - n) % 26 + 'z');
			} else if (Character.isUpperCase(ch)) { // 대문자
				ch = (char) ((ch - 'Z' - n) % 26 + 'Z');
			}
			answer += ch;
		}
		return answer;
	}
	
	public boolean removeMember(String memberId) {
		return memberRepository.deleteMember(memberId);
	}

	public List<Member> getMemberList(Criteria cri) {
		return memberRepository.getListPaging(cri);
	}
}