package com.pcwk.ehr.image.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pcwk.ehr.cmn.DTO;
import com.pcwk.ehr.image.domain.ImageVO;

@Repository("imageDao")
public class ImageDaoImpl implements ImageDao {
	final Logger LOG = LogManager.getFormatterLogger(getClass());

	final String NAMESPACE = "com.pcwk.ehr.image"; 
	final String DOT = "."; 
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int doSave(ImageVO inVO) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doSave";
		LOG.debug("|  statement : " + statement);
		
		int flag = sqlSessionTemplate.insert(statement, inVO);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘");
		
		return flag;
	}

	@Override
	public int doDelete(ImageVO inVO) throws SQLException {
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doDelete";
		LOG.debug("|  statement : " + statement);
		
		int flag = sqlSessionTemplate.delete(statement, inVO);
		LOG.debug("|  flag : " + flag);
		LOG.debug("└--------------------------------┘");
		
		return flag;
	}

	@Override
	public int doUpdate(ImageVO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ImageVO doSelectOne(ImageVO inVO) throws SQLException {
		ImageVO outVO = null;
		
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "doSelectOne";
		LOG.debug("|  statement : " + statement);
		
		outVO = sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("|  outVO : " + outVO);
		LOG.debug("└--------------------------------┘");
		
		return outVO;
	}

	@Override
	public List<ImageVO> doRetrieve(DTO inVO) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ImageVO getImageNo(ImageVO inVO) throws SQLException {
		ImageVO outVO = null;
		
		LOG.debug("┌--------------------------------┐");
		LOG.debug("|  param : " + inVO);
		
		String statement = NAMESPACE + DOT + "getImageNo";
		LOG.debug("|  statement : " + statement);
		
		outVO = sqlSessionTemplate.selectOne(statement, inVO);
		LOG.debug("|  outVO : " + outVO);
		LOG.debug("└--------------------------------┘");
		
		return outVO;
	}

}
