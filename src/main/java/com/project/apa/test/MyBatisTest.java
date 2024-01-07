package com.project.apa.test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MyBatisTest {

	@Autowired
	private SqlSessionTemplate template;
	
	@Test
	public void testQuery() {
		
		int count = template.selectOne("rest.test");
		
		assertNotNull(template);
		assertEquals(8, count);
	}
	
	@Test
	public void testConnection() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.53:1521:xe", "apaspring", "java1234");
			
			assertNotNull(conn);
			
			assertEquals("DB 연결", false, conn.isClosed());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
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
