package com.phonemall.controller;

import org.junit.Before;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class ProductControllerTests {
	@Setter(onMethod_= { @Autowired })
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;//가짜 mvc
	//가짜로 URL, 파라미터등을 브라우저에서 사용하는 것처럼 만들어서 컨트롤러를 실행해 볼 수 있다.
	//=WAS를 실행하지않고 테스트 가능
	
	@Before//junit을 사용해야함
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	/*
	@Test
	public void testList() throws Exception{
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/product/list")
				).andReturn().getModelAndView().getModelMap());
	}
	
	
	@Test
	public void testRegister() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/register")
				.param("product_title","테스트 새글제목")
				.param("product_description","테스트 새글 내용")
				.param("product_price","1000")
				).andReturn().getModelAndView().getViewName();
				
				log.info(resultPage);
	//MockMvcRequestBuilders의 post()이용하여 POST방식으로 데이터를 전달
	//param()을 이용해서 전달해야하는 파라미터들을 지정
	}
	
	
	@Test
	public void testGet() throws Exception{
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/product/get")
				.param("product_id","9")
				).andReturn().getModelAndView().getModelMap());
	}
	*/
	
	@Test
	public void testModify() throws Exception{
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/product/modify")
						.param("product_id","9")
						.param("product_title","테스트 새글제목")
						.param("product_description","테스트 새글 내용")
						.param("product_price","1000")
						).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	/*
	@Test
	public void testRemove() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/product/remove")
				.param("product_id","10")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
		
	}
	*/
}
