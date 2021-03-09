package com.phonemall.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTests {
	
	@Setter(onMethod_=@Autowired)
	private NoticeService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		NoticeVO notice = new NoticeVO();
		notice.setNotice_title("새로작성하는글");
		notice.setNotice_information("새로 작성하는 내용");
		notice.setNotice_description("새로 작성하는 내용");
		notice.setNotice_writer("writer1");
		
		service.register(notice);
		
	}
	
	@Test
	public void testRead() {
		log.info(service.get(17L));
	}
	
	@Test
	public void testGetList() {
		Criteria cri= new Criteria(1,6);
		log.info(service.getList(cri));
	}
	
	@Test
	public void testGetImage() {
		
		log.info("get image , "+service.getImage(22L));
	}
}
