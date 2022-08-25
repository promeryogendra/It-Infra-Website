/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package itinfra;

/**
 *
 * @author yogendra
 */
public class problem {
	String sid,ptype,pstatus,pdesc;
	public int ptid;
	public problem()
	{
		
	}

	public problem(String sid, String ptype, String pdesc,String pstatus ) {
		this.sid = sid;
		this.ptype = ptype;
		this.pstatus = pstatus;
		this.pdesc = pdesc;
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

	@Override
	public String toString() {
		return "Problem{" + "sid=" + sid + ", ptype=" + ptype + ", pstatus=" + pstatus + ", pdesc=" + pdesc + '}';
	}
	
}
