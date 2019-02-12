package com.cust.model;

import java.sql.Date;

public class CustVO {
	private String custId;
	private String custAcc;
	private String custPwd;
	private String custName;
	private String custSex;
	private Integer custTel;
	private String custAddr;
	private String custPid;
	private String custMail;
	private Date custBrd;
	private String custReg;
	private byte[] custPic;
	private String custStatus;
	private String niname;
	
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getCustAcc() {
		return custAcc;
	}
	public void setCustAcc(String custAcc) {
		this.custAcc = custAcc;
	}
	public String getCustPwd() {
		return custPwd;
	}
	public void setCustPwd(String custPwd) {
		this.custPwd = custPwd;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustSex() {
		return custSex;
	}
	public void setCustSex(String custSex) {
		this.custSex = custSex;
	}
	public Integer getCustTel() {
		return custTel;
	}
	public void setCustTel(Integer custTel) {
		this.custTel = custTel;
	}
	public String getCustAddr() {
		return custAddr;
	}
	public void setCustAddr(String custAddr) {
		this.custAddr = custAddr;
	}
	public String getCustPid() {
		return custPid;
	}
	public void setCustPid(String custPid) {
		this.custPid = custPid;
	}
	public String getCustMail() {
		return custMail;
	}
	public void setCustMail(String custMail) {
		this.custMail = custMail;
	}
	public Date getCustBrd() {
		return custBrd;
	}
	public void setCustBrd(Date custBrd) {
		this.custBrd = custBrd;
	}
	public String getCustReg() {
		return custReg;
	}
	public void setCustReg(String custReg) {
		this.custReg = custReg;
	}
	public byte[] getCustPic() {
		return custPic;
	}
	public void setCustPic(byte[] custPic) {
		this.custPic = custPic;
	}
	public String getCustStatus() {
		return custStatus;
	}
	public void setCustStatus(String custStatus) {
		this.custStatus = custStatus;
	}
	public String getNiname() {
		return niname;
	}
	public void setNiname(String niname) {
		this.niname = niname;
	}
	

}
