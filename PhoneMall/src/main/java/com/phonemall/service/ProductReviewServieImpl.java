package com.phonemall.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductReviewVO;
import com.phonemall.domain.ReviewPageDTO;
import com.phonemall.mapper.ProductMapper;
import com.phonemall.mapper.ProductReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ProductReviewServieImpl implements ProductReviewService{
	
	private ProductReviewMapper mapper;
	private ProductMapper productMapper;
	
	@Transactional
	@Override
	public int register(ProductReviewVO vo) {
		log.info("regitser, " + vo);

		int result = mapper.insert(vo);
		productMapper.updateReview(vo.getProduct_id(), 1);
		return result;
	}

	@Override
	public ProductReviewVO get(Long review_id) {
		
		log.info("get, "+review_id);
		
		return mapper.read(review_id);
	}

	@Transactional
	@Override
	public int remove(Long review_id) {
		log.info("remove, "+review_id);
		
		ProductReviewVO vo = mapper.read(review_id);
		log.info("remove product_id: "+vo.getProduct_id());
		productMapper.updateReview(vo.getProduct_id(), -1);
		
		
		
		return mapper.delete(review_id);
	}

	@Override
	public ReviewPageDTO getListPage(Criteria cri, Long product_id) {
		log.info("get review list of a product, "+product_id);
		
		return new ReviewPageDTO(mapper.getCountByProductId(product_id),
				mapper.getListWithPaging(cri, product_id));
	}
	

	@Override
	public int registerReply(ProductReviewVO vo) {
		log.info("reply regitser, " + vo);
		
		return mapper.insertReply(vo);
	}

	@Override
	public int removeReply(Long reply_id) {

		return mapper.deleteReply(reply_id);
	}

}
