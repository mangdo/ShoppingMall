package com.phonemall.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.ProductColorListVO;
import com.phonemall.domain.ProductImageVO;
import com.phonemall.domain.ProductVO;
import com.phonemall.mapper.ProductColorListMapper;
import com.phonemall.mapper.ProductImageMapper;
import com.phonemall.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ProductServiceImpl implements ProductService {

	private ProductMapper mapper;
	private ProductColorListMapper colorListMapper;
	private ProductImageMapper imageListMapper;
	
	@Override
	public List<ProductVO> getList(Criteria cri) {
		log.info("getList product");
		return mapper.getListWithPaging(cri);
	}
	@Override
	public void register(ProductVO product) {
		log.info("register product");
		mapper.insertSelectKey(product);
		
		// register on product_colorList
		if(product.getProduct_colorList() != null && product.getProduct_colorList().size() > 0) {
			product.getProduct_colorList().forEach(colorList->{
				colorList.setProduct_id(product.getProduct_id());
				
				colorListMapper.insert(colorList);
				log.info("register colorList "+ colorList);
			});
		}
		
		// register on product_image
		if(product.getProduct_imageList() != null || product.getProduct_imageList().size() > 0) {
			product.getProduct_imageList().forEach(image->{
				image.setProduct_id(product.getProduct_id());
				
				imageListMapper.insert(image);
				log.info("register imageList "+image);
			});
		}
	}

	@Override
	public ProductVO get(Long product_id) {
		log.info("get product, "+product_id);
		return mapper.read(product_id);
	}

	@Override
	public boolean modify(ProductVO product) {
		log.info("modify product, "+product);
		
		// delete all previous colorList, imageList
		colorListMapper.deleteAll(product.getProduct_id());
		imageListMapper.deleteAll(product.getProduct_id());
				
		// mapper.update()가 정상수행을 했을시 1, 아니면0을 리턴
		boolean modifyResult = mapper.update(product) == 1;

		// register new colorList
		if(modifyResult && product.getProduct_colorList()!=null && product.getProduct_colorList().size()>0) {
			
			product.getProduct_colorList().forEach(color->{
				color.setProduct_id(product.getProduct_id());
				colorListMapper.insert(color);
			});
		}
		
		// register new imageList
		if(modifyResult && product.getProduct_imageList()!=null && product.getProduct_imageList().size()>0) {
			
			product.getProduct_imageList().forEach(image->{
				image.setProduct_id(product.getProduct_id());
				imageListMapper.insert(image);
			});
		}
				
		return modifyResult;
	}

	@Override
	public boolean remove(Long product_id) {
		
		log.info("remove product, " + product_id);
		
		colorListMapper.deleteAll(product_id);
		imageListMapper.deleteAll(product_id);
		
		return mapper.delete(product_id)==1;
	}
	@Override
	public List<ProductColorListVO> getColorList(Long product_id) {
		
		log.info("get color list by id," + product_id);
		
		return colorListMapper.findById(product_id);
	}
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	@Override
	public List<ProductImageVO> getImageList(Long product_id) {
		
		log.info("get Image List by id, "+product_id);
		return imageListMapper.findById(product_id);
	}
	@Override
	public List<ProductVO> getRecentList(int amount) {
		log.info("get product List count : "+ amount);
		
		return mapper.getRecentList(amount);
	}
	@Override
	public List<ProductVO> getSaleList() {
		log.info("get sale product List");
		return mapper.getSaleList();
	}
	@Override
	public List<ProductVO> getPopularList() {
		log.info("get popular product List");
		return mapper.getPopularList();
	}
	@Override
	public List<ProductVO> getBestList() {
		log.info("get best product List");
		return mapper.getBestList();
	}
	@Override
	public ProductVO getQuickView(Long product_id) {
		log.info("get quick view, "+ product_id);
		return mapper.getQuickView(product_id);
	}
	@Override
	public List<ProductVO> getRelatedList(Long product_id, String product_brand){
		log.info("get related list, "+product_brand);
		return mapper.getRelatedList(product_id,product_brand);
	}

}
