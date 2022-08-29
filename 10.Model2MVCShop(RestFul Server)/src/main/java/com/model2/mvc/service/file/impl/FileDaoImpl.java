package com.model2.mvc.service.file.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.file.FileDao;

@Repository("fileDaoImpl")
public class FileDaoImpl implements FileDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public FileDaoImpl() {
	}

	@Override
	public void addFile(Product product) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("FileMapper.insertFile",product.getFileName());
	}

	@Override
	public List<String> findFile(Product product) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("FileMapper.findFile",product);
	}

	@Override
	public void updateFile(Product product) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("FileMapper.updateFile1",product);
		sqlSession.update("FileMapper.updateFile2",product);
	}

}
