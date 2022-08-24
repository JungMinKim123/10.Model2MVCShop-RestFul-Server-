package com.model2.mvc.service.file;

import java.util.List;

import com.model2.mvc.service.domain.Product;

public interface FileDao {
		
	public  void addFile(Product product) throws Exception ;
	
	public List<String> findFile(Product product) throws Exception ;
	
	public  void updateFile(Product product) throws Exception ;
	
}
