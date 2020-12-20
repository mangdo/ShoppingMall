package com.phonemall.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.phonemall.domain.ProductVO;
import com.phonemall.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ProductServiceImpl implements ProductService {

	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getList() {
		// TODO Auto-generated method stub
		log.info("getList....");
		return mapper.getList();
	}
	@Override
	public void register(ProductVO product) {
		// TODO Auto-generated method stub
		log.info("register...");
		mapper.insertSelectKey(product);
	}

	@Override
	public ProductVO get(Long product_id) {
		// TODO Auto-generated method stub
		log.info("get.."+product_id);
		return mapper.read(product_id);
	}

	@Override
	public boolean modify(ProductVO product) {
		log.info("modify.."+product);
		//mapper.update()가 정상수행을 했을시 1, 아니면0을 리턴한다
		return mapper.update(product)==1;
		//1이면 true가 리턴
	}

	@Override
	public boolean remove(Long product_id) {
		// TODO Auto-generated method stub
		log.info("remove.." +product_id);
		return mapper.delete(product_id)==1;
	}


}
