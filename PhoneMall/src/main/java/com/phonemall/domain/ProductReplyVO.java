package com.phonemall.domain;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@Data
public class ProductReplyVO {
	private Long reply_id;
	private Long review_id;
	
	private String reply_content;
	private String reply_replier;
	private Date reply_regDate;
	private Date reply_updateDate;
}
