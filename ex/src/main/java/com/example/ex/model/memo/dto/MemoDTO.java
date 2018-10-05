package com.example.ex.model.memo.dto;

import java.util.Date;

public class MemoDTO {
	private int idx;
	private String writer;
	private String hp;
	private String ad;
	private String memo;
	private Date post_date; 
	@Override
	public String toString() {
		return "MemoDTO [idx=" + idx + ", writer=" + writer + ", hp=" + hp + ", ad=" + ad + ", memo=" + memo
				+ ", post_date=" + post_date + "]";
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAd() {
		return ad;
	}
	public void setAd(String ad) {
		this.ad = ad;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	
	public MemoDTO() {
	}
	public MemoDTO(String writer, String memo) {
		this.writer = writer;
		this.memo = memo;
		this.hp = hp;
		this.ad= ad;
	}
	
	
}
