package T3_Model;

import java.io.Serializable;
import java.sql.Timestamp;

public class forumArtVO implements Serializable{

	private String forumartid;
	private String forumartname;
	private byte[] forumartcon;
	private Timestamp forumartstart;
	private String chefid;
	public String getForumartid() {
		return forumartid;
	}
	public void setForumartid(String forumartid) {
		this.forumartid = forumartid;
	}
	public String getForumartname() {
		return forumartname;
	}
	public void setForumartname(String forumartname) {
		this.forumartname = forumartname;
	}
	public byte[] getForumartcon() {
		return forumartcon;
	}
	public void setForumartcon(byte[] forumartcon) {
		this.forumartcon = forumartcon;
	}
	public Timestamp getForumartstart() {
		return forumartstart;
	}
	public void setForumartstart(Timestamp forumartstart) {
		this.forumartstart = forumartstart;
	}
	public String getChefid() {
		return chefid;
	}
	public void setChefid(String chefid) {
		this.chefid = chefid;
	}
	
	
}
