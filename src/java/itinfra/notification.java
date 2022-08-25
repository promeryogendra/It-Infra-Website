
package itinfra;

public class notification {
	String id,msg,link;
	public notification()
	{
		
	}

	public notification(String id, String msg, String link) {
		this.id = id;
		this.msg = msg;
		this.link = link;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "Notification{" + "id=" + id + ", msg=" + msg + ", link=" + link + '}';
	}
	
	
}
