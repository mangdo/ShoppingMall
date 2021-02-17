package com.phonemall.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private Long notice_id;
	private String notice_title;
	private String notice_information;
	private String notice_description;
	private String notice_writer;
	private Date notice_regDate;
	
	private Long prev_id;
	private String prev_title;
	private Long next_id;
	private String next_title;
	
	private NoticeImageVO notice_image;
}
