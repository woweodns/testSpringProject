package com.example.ex.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ex.model.shop.dao.ProductDAO;
import com.example.ex.model.shop.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO productDao;

	@Override
	public List<ProductDTO> listProduct() {
		return productDao.listProduct();
	}
	public List<ProductDTO> listProduct2() {
		return productDao.listProduct2();
	}
	public List<ProductDTO> listProduct3() {
		return productDao.listProduct3();
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return productDao.detailProduct(product_id);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		productDao.updateProduct(dto);
	}

	@Override
	public void deleteProduct(int product_id) {
		productDao.deleteProduct(product_id);
	}

	@Override
	public void insertProduct(ProductDTO dto) {
		productDao.insertProduct(dto);
	}

	@Override
	public String fileInfo(int product_id) {
		return productDao.fileInfo(product_id);
	}

}
