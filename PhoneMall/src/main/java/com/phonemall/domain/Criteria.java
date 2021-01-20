package com.phonemall.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	// Criteria : 검색기준

	private int pageNum;
	private int amount;
	
	private String keyword;
	
	private String brand;
	private String type;
	private String carrier;
	
	private int priceStart;
	private int priceEnd;
		
	public Criteria(){
		this(1,6,0,4000000);
	}
	
	public Criteria(int pageNum, int amount, int priceStart, int priceEnd) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.priceStart = priceStart;
		this.priceEnd = priceEnd;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getPageStart() {
		return (this.pageNum -1) * amount;
	}
	
	public String getListLink() {
		
		// UriComponentsBuilder는 여러개의 파라미터들을 연결해서 URL형태로 만들어주는 기능 제공
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
}
