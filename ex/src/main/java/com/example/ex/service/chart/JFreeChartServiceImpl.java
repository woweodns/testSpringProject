package com.example.ex.service.chart;

import java.awt.Color;
import java.awt.Font;
import java.util.List;

import javax.inject.Inject;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Service;

import com.example.ex.model.shop.dao.CartDAO;
import com.example.ex.model.shop.dto.CartDTO;


@Service 
public class JFreeChartServiceImpl implements JFreeChartService {

	@Inject 
	CartDAO cartDao;
	
	@Override
	public JFreeChart createChart() {
		List<CartDTO> list=cartDao.cartMoney();
		DefaultPieDataset dataset=new DefaultPieDataset();
		for(CartDTO dto : list) {
			dataset.setValue(dto.getProduct_name(), dto.getMoney());
		}
		
		JFreeChart chart=null;
		String title="장바구니 통계"; 
		try {
			chart=ChartFactory.createPieChart(
					title, dataset, true, true, false);
			chart.getTitle().setFont(new Font("돋움",Font.BOLD,15));
			chart.getLegend().setItemFont(
					new Font("돋움",Font.PLAIN,10));
			Font font=new Font("돋움",Font.PLAIN, 12);
			Color color=new Color(0,0,0); 
			StandardChartTheme chartTheme=
				(StandardChartTheme)StandardChartTheme.createJFreeTheme();
			chartTheme.setExtraLargeFont(font);
			chartTheme.setLargeFont(font);
			chartTheme.setRegularFont(font);
			chartTheme.setSmallFont(font);
			chartTheme.setAxisLabelPaint(color);
			chartTheme.setLegendItemPaint(color);
			chartTheme.setItemLabelPaint(color);
			chartTheme.apply(chart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return chart;
	}

}
