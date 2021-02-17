package com.phonemall.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class NoticeImageVO {
	private String image_uuid;
	private String image_uploadPath;
	private String image_name;
	private Long notice_id;
}
