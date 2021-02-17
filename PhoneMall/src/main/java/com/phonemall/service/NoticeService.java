package com.phonemall.service;

import java.util.List;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.NoticeImageVO;
import com.phonemall.domain.NoticeVO;

public interface NoticeService {
	public void register(NoticeVO notice);
	
	public NoticeVO get(Long notice_id);
	
	public List<NoticeVO> getList(Criteria cri);
	
	public int getTotal();
	
	public boolean remove(Long notice_id);
	
	public NoticeImageVO getImage(Long notice_id);
	
	public boolean modify(NoticeVO notice);
	
}
