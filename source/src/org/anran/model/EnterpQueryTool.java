package org.anran.model;

public class EnterpQueryTool {
	private String dt;
	private String sd;
	private String ed;
	private String gname;
	private int pageNo;
	private int pageSize;
	
	public EnterpQueryTool() {
	}
	
	public EnterpQueryTool(String dt, String sd, String ed, String gname) {
		this.dt = dt;
		this.sd = sd;
		this.ed = ed;
		this.gname = gname;
	}

	public EnterpQueryTool(String dt, String sd, String ed, String gname,
			int pageNo, int pageSize) {
		this.dt = dt;
		this.sd = sd;
		this.ed = ed;
		this.gname = gname;
		this.pageNo = pageNo;
		this.pageSize = pageSize;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getDt() {
		return dt;
	}
	public void setDt(String dt) {
		this.dt = dt;
	}
	public String getSd() {
		return this.sd;
	}
	public void setSd(String sd) {
		this.sd = sd;
	}
	public String getEd() {
		return this.ed;
	}
	public void setEd(String ed) {
		this.ed = ed;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	
}
