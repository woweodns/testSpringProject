package com.example.ex.model.member.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ex.model.member.dto.MemberDTO;
import com.example.ex.model.shop.dto.CartDTO;

@Repository 
public class MemberDAOImpl implements MemberDAO {
	
	@Inject 
	SqlSession sqlSession;

	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name = 
				sqlSession.selectOne("member.login_check", dto);
		return (name==null) ? false : true;
	}

	@Override
	public void join(MemberDTO dto) {
		sqlSession.insert("member.insert", dto);
	}
	
	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember", userid);
	}

}
