package T3_Model;

import java.io.Serializable;
import java.sql.Timestamp;

public class forumMsgVO implements Serializable{

	private String forummsgid;
	private byte[] forummsgcon;
	private Timestamp forummsgstart;
	private String forummsgstatus;
	private String forumartid;
	private String custid;
	public String getForummsgid() {
		return forummsgid;
	}
	public void setForummsgid(String forummsgid) {
		this.forummsgid = forummsgid;
	}
	public byte[] getForummsgcon() {
		return forummsgcon;
	}
	public void setForummsgcon(byte[] forummsgcon) {
		this.forummsgcon = forummsgcon;
	}
	public Timestamp getForummsgstart() {
		return forummsgstart;
	}
	public void setForummsgstart(Timestamp forummsgstart) {
		this.forummsgstart = forummsgstart;
	}
	public String getForummsgstatus() {
		return forummsgstatus;
	}
	public void setForummsgstatus(String forummsgstatus) {
		this.forummsgstatus = forummsgstatus;
	}
	public String getForumartid() {
		return forumartid;
	}
	public void setForumartid(String forumartid) {
		this.forumartid = forumartid;
	}
	public String getCustid() {
		return custid;
	}
	public void setCustid(String custid) {
		this.custid = custid;
	}
	
	
}
