package com.example.ex.controller.chart;

import java.io.FileOutputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex.service.chart.JFreeChartService;
import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;

@Controller 
@RequestMapping("jchart/*") 
public class JFreeChartController {
	
	@Inject
	JFreeChartService chartService;
	
	
	@RequestMapping("chart2.do")
	public ModelAndView createChart2(HttpServletResponse response) {
		String message="";
		try {
			JFreeChart chart=chartService.createChart();
			Document document=new Document(); 
			PdfWriter.getInstance(document, new FileOutputStream("d:/test.pdf"));
			document.open();
			Image png=Image.getInstance(
					ChartUtilities.encodeAsPNG(
							chart.createBufferedImage(500, 500)));
			document.add(png);
			document.close();
			message="pdf 파일이 생성되었습니다.";
		} catch (Exception e) {
			message="pdf 파일 생성 실패...";
			e.printStackTrace();
		}
		return new ModelAndView("chart/jchart02","message",message);
	}

}
