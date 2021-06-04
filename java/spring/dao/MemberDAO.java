package yh.spring.dao;

import yh.spring.vo.Member;

public interface MemberDAO {

	int insertMember(Member m);
	int selectLogin(Member m);
	Member selectOneMember(String mno);
	
}
