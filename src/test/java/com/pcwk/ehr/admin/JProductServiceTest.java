package com.pcwk.ehr.admin;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pcwk.ehr.admin.domain.ProductVO;
import com.pcwk.ehr.admin.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)//spring-test lib에 있음!
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"
		                          ,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class JProductServiceTest {
	final Logger LOG = LogManager.getLogger(getClass());
	
	@Autowired
	ApplicationContext  context;
	
	@Autowired
	ProductService prodService;
	
	// 테스트 픽스쳐
	List<ProductVO> products;

	@Before
	public void setUp() throws Exception {
		products = Arrays.asList(
					new ProductVO(1, "안동에서 올라온 전통찜닭(2인용)", 16900, 1, 1, "생산지_01", 0, "20221231", "상품설명_01", 0, 2000, 5, "", "")
				);
	}
	
	@Test
	public void upDeleteAll() throws SQLException {
		
	}

	@Test
	@Ignore
	public void beans() {
		LOG.debug("┌-------------------------------------------┐");
		LOG.debug("|  context : " + context);
		LOG.debug("|  prodService : " + prodService);
		LOG.debug("└-------------------------------------------┘");
		
		assertNotNull(context);
		assertNotNull(prodService);
	}

}