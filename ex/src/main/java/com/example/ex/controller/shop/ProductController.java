package com.example.ex.controller.shop;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex.model.shop.dto.ProductDTO;
import com.example.ex.service.shop.ProductService;

@Controller
@RequestMapping("shop/product/*")
public class ProductController {

	@Inject
	ProductService productService;

	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/shop/product_list");
		mav.addObject("list", productService.listProduct());
		return mav;
	}

	@RequestMapping("list2.do")
	public ModelAndView list2(ModelAndView mav) {
		mav.setViewName("/shop/product_list2");
		mav.addObject("list2", productService.listProduct2());
		return mav;
	}

	@RequestMapping("list3.do")
	public ModelAndView list3(ModelAndView mav) {
		mav.setViewName("/shop/product_list3");
		mav.addObject("list3", productService.listProduct3());
		return mav;
	}

	@RequestMapping("detail/{product_id}")
	public ModelAndView detail(@PathVariable int product_id, ModelAndView mav) {
		mav.setViewName("/shop/product_detail");
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}

	@RequestMapping("write.do")
	public String write() {
		return "shop/product_write";
	}

	@RequestMapping("insert.do")
	public String insert(@ModelAttribute ProductDTO dto) {
		String filename = "-";
		if (!dto.getFile1().isEmpty()) {
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path = "D:\\work\\ex\\src\\main\\webapp\\resources\\images";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setPicture_url(filename);
		productService.insertProduct(dto);
		return "redirect:/shop/product/list.do";
	}

	@RequestMapping("edit/{product_id}")
	public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) {
		mav.setViewName("shop/product_edit");
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}

	@RequestMapping("update.do")
	public String update(ProductDTO dto) {
		String filename = "-";
		if (!dto.getFile1().isEmpty()) {
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path = "D:\\work\\ex\\src\\main\\webapp\\resources\\images";
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setPicture_url(filename);
		} else {
			ProductDTO dto2 = productService.detailProduct(dto.getProduct_id());
			dto.setPicture_url(dto2.getPicture_url());
		}
		productService.updateProduct(dto);
		return "redirect:/shop/product/list.do";
	}

	@RequestMapping("delete.do")
	public String delete(@RequestParam int product_id) {
		String filename = productService.fileInfo(product_id);
		System.out.println("첨부파일 이름:" + filename);
		if (filename != null && !filename.equals("-")) {
			String path = "D:\\work\\ex\\src\\main\\webapp\\resources\\images";
			File f = new File(path + filename);
			System.out.println("파일존재여부:" + f.exists());
			if (f.exists()) {
				f.delete(); 
				System.out.println("삭제되었습니다.");
			}
		}
		productService.deleteProduct(product_id);
		return "redirect:/shop/product/list.do";
	}

}
