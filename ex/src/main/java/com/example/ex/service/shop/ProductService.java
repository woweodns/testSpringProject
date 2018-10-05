package com.example.ex.service.shop;

import java.util.List;

import com.example.ex.model.shop.dto.ProductDTO;

public interface ProductService {

	List<ProductDTO> listProduct();
	List<ProductDTO> listProduct2();
	List<ProductDTO> listProduct3();
	ProductDTO detailProduct(int product_id);
	void updateProduct(ProductDTO dto);
	void deleteProduct(int product_id);
	void insertProduct(ProductDTO dto);
	String fileInfo(int product_id);
	
}
