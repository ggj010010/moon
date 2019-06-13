package com.spring.moon.dto;

import java.sql.Date;

public class EventDetailDTO {

	int ed_id;
	int e_id;
	int p_id;
	int p_sort;
	int prevSort;
	int nextSort;
	
	public int getEd_id() {
		return ed_id;
	}
	public void setEd_id(int ed_id) {
		this.ed_id = ed_id;
	}
	public int getE_id() {
		return e_id;
	}
	public void setE_id(int e_id) {
		this.e_id = e_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getP_sort() {
		return p_sort;
	}
	public void setP_sort(int p_sort) {
		this.p_sort = p_sort;
	}
	public int getPrevSort() {
		return prevSort;
	}
	public void setPrevSort(int prevSort) {
		this.prevSort = prevSort;
	}
	public int getNextSort() {
		return nextSort;
	}
	public void setNextSort(int nextSort) {
		this.nextSort = nextSort;
	}
	
}
