package com.phonemall.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.beans.factory.annotation.Autowired;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})

@Log4j
public class MemberTests {
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource ds;
	
	@Test
	public void testInsertMember() {
		
		String sql = "insert into memberinfo(email,userpw,lastname,firstname,country,city,postalcode,phonenum,address) values (?,?,?,?,?,?,?,?,?)";
		
		for(int i = 0; i < 100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "user"+i);
				pstmt.setString(2, pwencoder.encode("pw" + i));
				pstmt.setString(3, "user");
				pstmt.setString(4, "user");
				pstmt.setString(5, "South Korea");
				pstmt.setString(6, "Seoul");
				pstmt.setString(7, "01234");
				pstmt.setString(8, "0123456789");
				pstmt.setString(9, "songpagu-randomapartment");				
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();}catch(Exception e) {}}
				if(con != null) {try {con.close();}catch(Exception e) {}}
					
				}
			}//endfor
			
		}
	
	@Test
	public void testInsertAuth() {
		String sql = "insert into memberauth(userEmail,auth) values(?,?)";
		
		for (int i = 0; i< 100; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
			if(i<100) {
				pstmt.setNString(1, "user"+i);
				pstmt.setNString(2, "ROLE_MEMBER");
			}
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {try {pstmt.close();}catch(Exception e) {}}
				if(con != null) {try {con.close();}catch(Exception e) {}}
					
				}
		
			}
			
		
	}
	}
	
	

