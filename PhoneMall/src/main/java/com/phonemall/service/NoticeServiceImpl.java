package com.phonemall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.NoticeImageVO;
import com.phonemall.domain.NoticeVO;
import com.phonemall.mapper.NoticeImageMapper;
import com.phonemall.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class NoticeServiceImpl implements NoticeService {

	NoticeMapper mapper;
	NoticeImageMapper imageMapper;
	
	@Override
	public void register(NoticeVO notice) {
		log.info("register notice");
		mapper.insert(notice);
		
		// register on notice_image
		if(notice.getNotice_image() != null ) {
			NoticeImageVO image = notice.getNotice_image();
			image.setNotice_id(notice.getNotice_id());
			imageMapper.insert(image);
			log.info("notice image register "+ image);
		}
	}

	@Override
	public NoticeVO get(Long notice_id) {
		log.info("get notice, "+ notice_id);
		return mapper.read(notice_id);
	}

	@Override
	public List<NoticeVO> getList(Criteria cri) {
		log.info("get list");
		return mapper.getList(cri);
	}

	@Override
	public int getTotal() {	
		return mapper.getTotalCount();
	}

	@Override
	public boolean remove(Long notice_id) {
		return mapper.delete(notice_id)==1;
	}

	@Override
	public NoticeImageVO getImage(Long notice_id) {
		
		return imageMapper.findById(notice_id);
	}

	@Override
	public boolean modify(NoticeVO notice) {
		if(notice.getNotice_image() !=null) {
			NoticeImageVO image = notice.getNotice_image();
			image.setNotice_id(notice.getNotice_id());
			
			if( imageMapper.update(image)!=1){
				imageMapper.insert(image);
			}
		}
		return mapper.update(notice)==1;
	}

}
