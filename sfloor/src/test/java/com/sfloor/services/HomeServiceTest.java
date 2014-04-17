package com.sfloor.services;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration(locations={"classpath:WEB-INF/spring/test-context.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class HomeServiceTest{

	@Autowired
	HomeService homeService;
	
	@Test
	public void testGetAllPages(){
	
		System.out.println(homeService.getAllPages());
	}
}
