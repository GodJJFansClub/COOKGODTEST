package cust.model;

import java.sql.Date;

public class CustVO {
	private String custId;
	private String custAcc;
	private String custPwd;
	private String custName;
	private Integer custSex;
	private Integer custTel;
	private String custAddr;
	private String custPid;
	private String custMail;
	private Date custBrd;
	private Date custReg;
	private byte[] custPic;
	private Integer custStatus;
	private String custNiname;
	
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
	public Integer getCustSex() {
		return custSex;
	}
	public void setCustSex(Integer custSex) {
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
	public Date getCustReg() {
		return custReg;
	}
	public void setCustReg(Date custReg) {
		this.custReg = custReg;
	}
	public byte[] getCustPic() {
		return custPic;
	}
	public void setCustPic(byte[] custPic) {
		this.custPic = custPic;
	}
	public Integer getCustStatus() {
		return custStatus;
	}
	public void setCustStatus(Integer custStatus) {
		this.custStatus = custStatus;
	}
	public String getCustNiname() {
		return custNiname;
	}
	public void setCustNiname(String custNiname) {
		this.custNiname = custNiname;
	}
	
}
