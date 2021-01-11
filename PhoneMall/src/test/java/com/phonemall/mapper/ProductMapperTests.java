package com.phonemall.mapper;

import java.util.List;

import org.junit.Test;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ProductMapperTests {
	@Setter(onMethod_=@Autowired)
	private ProductMapper mapper;
	/*
	@Test
	public void testGetList() {
		mapper.getList().forEach(product->log.info(product));
	}
	
	@Test
	public void TestInsert() {
		ProductVO product = new ProductVO();
		product.setProduct_title("새로작성하는글");
		product.setProduct_description("새로 작성하는 내용");
		product.setProduct_price(100);
		
		mapper.insert(product);
		
		log.info(product);
	}

	@Test
	public void testDelete() {
		log.info("DELETE count : "+mapper.delete(3L));
	}
	
	
	@Test
	public void TestInsertSelectKey() {
		ProductVO product = new ProductVO();
		product.setProduct_title("새로작성하는글");
		product.setProduct_description("새로 작성하는 내용");
		product.setProduct_price(100);
		
		mapper.insertSelectKey(product);
		
		log.info(product);
	}
	
	
	
	@Test
	public void testRead() {
		//존재하는 게시물 번호로 테스트
		ProductVO product = mapper.read(38L);
		
		log.info(product);
		
	}
	
	@Test
	public void testUpdate() {
		ProductVO product = new ProductVO();
		// 실제 존재하는 번호인지 확인
		product.setProduct_id(4L);
		product.setProduct_title("변경");
		product.setProduct_description("변경");
		product.setProduct_price(100);
		
		int count = mapper.update(product);
		log.info("update count : "+count);
	}
	*/
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		// 2page
		//cri.setPageNum(2);
		
		// 검색
		//cri.setKeyword("iphone");
		
		// 카테고리
		//cri.setType("Phone");
		//cri.setBrand("APPLE");
		//cri.setCarrier("SKT");
		
		List<ProductVO> list = mapper.getListWithPaging(cri);
		list.forEach(product->log.info(product));
	}
	
}
