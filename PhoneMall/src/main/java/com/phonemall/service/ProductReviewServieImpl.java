package com.phonemall.service;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductReviewVO;
import com.phonemall.domain.ProductReviewPageDTO;
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
		log.info("Regitser Review, " + vo);

		int result = mapper.insert(vo);
		productMapper.updateReview(vo.getProduct_id(), 1);
		
		return result;
	}

	@Override
	public ProductReviewVO get(Long review_id) {
		log.info("Get Review, "+review_id);
		
		return mapper.read(review_id);
	}

	@Transactional
	@Override
	public int remove(Long review_id) {
		log.info("Remove Review, "+review_id);
		
		ProductReviewVO vo = mapper.read(review_id);
		int result=mapper.delete(review_id);
		productMapper.updateReview(vo.getProduct_id(), -1);
		
		return result;
	}
	
	@Transactional
	@Override
	public int modify(ProductReviewVO vo) {
		log.info("Modify Reivew"+vo);
		
		int result = mapper.update(vo);
		productMapper.updateReview(vo.getProduct_id(), 0);
		
		return result;
	}

	@Override
	public ProductReviewPageDTO getListPage(Criteria cri, Long product_id) {
		log.info("Get review list of a product, "+product_id);
		
		return new ProductReviewPageDTO(mapper.getCountByProductId(product_id),
				mapper.getListWithPaging(cri, product_id));
	}
	

	@Override
	public int registerReply(ProductReviewVO vo) {
		log.info("Regitser Reply , " + vo);
		
		return mapper.insertReply(vo);
	}
	
	@Override
	public ProductReviewVO getReply(Long reply_id) {
		log.info("Get Reply , "+reply_id);
		
		return mapper.readReply(reply_id);
	}

	@Override
	public int modifyReply(ProductReviewVO vo) {
		log.info("Modify Reply , "+ vo);
		
		return mapper.updateReply(vo);
	}
	
	@Override
	public int removeReply(Long reply_id) {
		log.info("Delete Reply , "+ reply_id);
		
		return mapper.deleteReply(reply_id);
	}

	@Override
	public ProductReviewPageDTO getMyReviewListPage(Criteria cri, String review_reviewer) {
		log.info("Get my review list , "+review_reviewer);
		
		return new ProductReviewPageDTO(mapper.getCountByReviewer(review_reviewer),
				mapper.getMyReviewListWithPaging(cri, review_reviewer), productMapper.myReviewProductList(cri, review_reviewer));
	}

}
