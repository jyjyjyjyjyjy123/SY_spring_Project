package com.project.apa.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Connection;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class HirariCPTest {
	
	@Autowired
	private HikariDataSource dataSource;

	@Test
	public void testConnectionPool() {
		
		//우리가 직접 Connection을 생성하지 않고
		//Connection Pool을 통해 Connection이 잘 생성되는지 테스트
		
		assertNotNull(dataSource);
		
		try {
			Connection conn = dataSource.getConnection();
			assertEquals(false, conn.isClosed());			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
