
package itinfra;
public class update {
	String uid,udept,udesc;
	public update()
	{
		
	}
	public update(String uid, String udept, String udesc) {
		this.uid = uid;
		this.udept = udept;
		this.udesc = udesc;
	}
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUdept() {
		return udept;
	}

	public void setUdept(String udept) {
		this.udept = udept;
	}

	public String getUdesc() {
		return udesc;
	}

	public void setUdesc(String udesc) {
		this.udesc = udesc;
	}

	@Override
	public String toString() {
		return "update{" + "uid=" + uid + ", udept=" + udept + ", udesc=" + udesc + '}';
	}
	
}
