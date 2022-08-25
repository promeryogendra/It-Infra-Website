
package itinfra;

public class student {
	private String sid,sname,sage,smail,sphone,sbatch,branch,laptap_serial_no,adapter_serial_number;
	
	public student()
	{
		
	}
	public void setall(String sid, String sname, String sage, String smail, String sphone, String sbatch, String branch, String laptap_serial_no, String adapter_serial_number) {
		this.sid = sid;
		this.sname = sname;
		this.sage = sage;
		this.smail = smail;
		this.sphone = sphone;
		this.sbatch = sbatch;
		this.branch = branch;
		this.laptap_serial_no = laptap_serial_no;
		this.adapter_serial_number = adapter_serial_number;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSage() {
		return sage;
	}

	public void setSage(String sage) {
		this.sage = sage;
	}

	public String getSmail() {
		return smail;
	}

	public void setSmail(String smail) {
		this.smail = smail;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public String getSbatch() {
		return sbatch;
	}

	public void setSbatch(String sbatch) {
		this.sbatch = sbatch;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getLaptap_serial_no() {
		return laptap_serial_no;
	}

	public void setLaptap_serial_no(String laptap_serial_no) {
		this.laptap_serial_no = laptap_serial_no;
	}

	public String getAdapter_serial_number() {
		return adapter_serial_number;
	}

	public void setAdapter_serial_number(String adapter_serial_number) {
		this.adapter_serial_number = adapter_serial_number;
	}
}
