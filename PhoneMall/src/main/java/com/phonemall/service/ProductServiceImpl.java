package com.phonemall.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.phonemall.domain.ProductColorListVO;
import com.phonemall.domain.ProductVO;
import com.phonemall.mapper.ProductColorListMapper;
import com.phonemall.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ProductServiceImpl implements ProductService {

	private ProductMapper mapper;
	private ProductColorListMapper colorListMapper;
	
	@Override
	public List<ProductVO> getList() {
		log.info("getList product");
		return mapper.getList();
	}
	@Override
	public void register(ProductVO product) {
		log.info("register product");
		mapper.insertSelectKey(product);
		
		if(product.getProduct_colorList() == null || product.getProduct_colorList().size() <= 0) {
			return;
		}
		
		product.getProduct_colorList().forEach(colorList->{
			colorList.setProduct_id(product.getProduct_id());
			
			colorListMapper.insert(colorList);
			log.info("register colorList "+ colorList);
		});
		
	}

	@Override
	public ProductVO get(Long product_id) {
		log.info("get product, "+product_id);
		return mapper.read(product_id);
	}

	@Override
	public boolean modify(ProductVO product) {
		log.info("modify product, "+product);
		
		// 이전의 colorList 데이터 전체를 삭제하고
		colorListMapper.deleteAll(product.getProduct_id());
		
		//mapper.update()가 정상수행을 했을시 1, 아니면0을 리턴한다
		boolean modifyResult = mapper.update(product) == 1;

		if(product.getProduct_colorList()==null) {
			return modifyResult;
		}

		// 다시 새로운 colorList 데이터를 추가한다.
		if(modifyResult && product.getProduct_colorList().size()>0) {
			product.getProduct_colorList().forEach(color->{
				color.setProduct_id(product.getProduct_id());
				colorListMapper.insert(color);
			});
		}
				
		return modifyResult;
	}

	@Override
	public boolean remove(Long product_id) {
		
		log.info("remove product, " + product_id);
		
		colorListMapper.deleteAll(product_id);
		
		return mapper.delete(product_id)==1;
	}
	@Override
	public List<ProductColorListVO> getColorList(Long product_id) {
		
		log.info("get color list by id," + product_id);
		
		return colorListMapper.findById(product_id);
	}


}
