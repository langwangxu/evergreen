package org.anran.model;

public class QueryTool {
	private String dt;
	private String sd;
	private String ed;
	
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
	
	public void formatDate(){
		if(this.dt!=null && "d".equals(this.dt)){
			this.sd = this.sd + " 00:00:00";
			this.ed = this.ed + " 59:59:59";
		}else if(this.dt!=null && "m".equals(this.dt)){
			this.sd = this.sd + "-01 00:00:00";
			this.ed = this.ed + "-31 59:59:59";
		}else if(this.dt!=null && "y".equals(this.dt)){
			this.sd = this.sd + "-01-01 00:00:00";
			this.ed = this.ed + "-12-31 59:59:59";
		}
	}
	
}
