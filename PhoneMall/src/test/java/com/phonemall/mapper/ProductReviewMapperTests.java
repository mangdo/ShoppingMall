package com.phonemall.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductReplyVO;
import com.phonemall.domain.ProductReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ProductReviewMapperTests {
	@Setter(onMethod_=@Autowired)
	private ProductReviewMapper mapper;
	
	@Test
	public void testCreate() {
		ProductReviewVO vo = new ProductReviewVO();
		vo.setProduct_id(4L);
		vo.setReview_content("hi");
		vo.setReview_reviewer("tester");
		vo.setReview_rating(5);
		
		log.info(vo);
		log.info(mapper.insert(vo));
		
	}
	
	@Test
	public void testList() {
		Criteria cri = new Criteria(1,5);
		log.info(cri);
		List<ProductReviewVO> reviews = mapper.getListWithPaging(cri, 4L);
		reviews.forEach(review->log.info(review));
	}
	
	@Test
	public void testgetMyReviewListWithPaging() {
		Criteria cri = new Criteria(1,5);
		log.info(cri);
		List<ProductReviewVO> reviews = mapper.getMyReviewListWithPaging(cri, "admin");
		reviews.forEach(review->log.info(review));
	}

	@Test
	public void testUpdate() {
		ProductReviewVO vo= mapper.read(1L);
		log.info("update : "+mapper.update(vo));
	}
	
	@Test
	public void testUpdateReply() {
		ProductReplyVO vo= mapper.readReply(1L);
		log.info("update : "+mapper.updateReply(vo));
		log.info(vo);
	}
}
