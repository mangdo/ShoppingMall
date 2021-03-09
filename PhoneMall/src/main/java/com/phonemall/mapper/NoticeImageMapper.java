package com.phonemall.mapper;

import com.phonemall.domain.NoticeImageVO;

public interface NoticeImageMapper {
	public void insert(NoticeImageVO vo);
	public int delete(String uuid);
	public NoticeImageVO findById(Long notice_id);
	public int update(NoticeImageVO vo);
}
