
package itinfra;

public class problemlist {
	String  pid,sid,ptype,pstatus,pdesc,ptypestring,slot;

	public problemlist(String pid,String sid, String ptype, String pstatus, String pdesc, String ptypestring) {
		this.pid=pid;
		this.sid = sid;
		this.ptype = ptype;
		this.pstatus = pstatus;
		this.pdesc = pdesc;
		this.ptypestring = ptypestring;
	}

	public String getSlot() {
		return slot;
	}

	public void setSlot(String slot) {
		this.slot = slot;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPstatus() {
		return pstatus;
	}

	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public String getPtypestring() {
		return ptypestring;
	}

	public void setPtypestring(String ptypestring) {
		this.ptypestring = ptypestring;
	}

	@Override
	public String toString() {
		return "problemlist{" + "pid=" + pid + ", sid=" + sid + ", ptype=" + ptype + ", pstatus=" + pstatus + ", pdesc=" + pdesc + ", ptypestring=" + ptypestring + '}';
	}

	
}
