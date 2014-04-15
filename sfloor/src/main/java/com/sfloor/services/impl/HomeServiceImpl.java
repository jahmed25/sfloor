package com.sfloor.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sfloor.dao.PageDAO;
import com.sfloor.entities.Page;
import com.sfloor.services.HomeService;

@Service
public class HomeServiceImpl implements HomeService{

	@Autowired
	private PageDAO dao;
	
	@Override
	@Transactional
	public List<Page> getAllPages() {
		return dao.getAllPage();
	}

}
