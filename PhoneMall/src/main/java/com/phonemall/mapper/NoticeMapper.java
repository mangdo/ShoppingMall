package com.phonemall.mapper;

import java.util.List;

import com.phonemall.domain.Criteria;
import com.phonemall.domain.NoticeVO;

public interface NoticeMapper {
	public void insert(NoticeVO notice);
	
	public NoticeVO read(Long notice_id);
	
	public List<NoticeVO> getList(Criteria cri);
	
	public int getTotalCount();
	
	public int delete(Long notice_id);
	
	public int update(NoticeVO notice);
	
	public List<NoticeVO> getRecentList();
}
