package com.phonemall.service;

import static org.junit.Assert.assertNotNull;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.phonemall.domain.Criteria;

import org.springframework.beans.factory.annotation.Autowired;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {
	@Setter(onMethod_=@Autowired)
	private ProductService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	/*
	@Test
	public void testRegister() {
		ProductVO product = new ProductVO();
		product.setProduct_title("새로작성하는글");
		product.setProduct_description("새로 작성하는 내용");
		product.setProduct_price(1000);
		
		service.register(product);
		log.info("생성된 게시물의 번호 : "+ product.getProduct_id());
		
	}
	*/
	@Test
	public void testGetList() {
		service.getList(new Criteria(2,6,0,100000)).forEach(product->log.info(product));
	}
	
	/*
	@Test
	public void testGet() {
		log.info(service.get(7L));
	}
	@Test
	public void testDelete() {
		log.info("remove result : "+service.remove(7L));
		
	}

	@Test
	public void testUpdate() {
		ProductVO product = service.get(8L);
		
		if(product==null) return;
		
		product.setProduct_title("제목을 수정하겠다.");
		log.info("modify result : "+service.modify(product));
		
	}
	*/
}
