package com.phonemall.mapper;


import org.junit.Test;


import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ProductColorListMapperTests {
	
	@Setter(onMethod_=@Autowired)
	private ProductColorListMapper mapper;
	/*
	@Test
	public void TestInsert() {
		ProductColorListVO colorList = new ProductColorListVO();
		
		colorList.setProduct_id(14L);
		colorList.setProduct_color("brown");
		
		mapper.insert(colorList);
		
		log.info(colorList);
	}
	
	
	
	@Test
	public void TestFindById() {
		List<ProductColorListVO> color = mapper.findById(14L);
		log.info(color);
	}
	*/
	@Test
	public void testDelete() {
		log.info("DELETE");
		mapper.deleteAll(19L);
	}
}


