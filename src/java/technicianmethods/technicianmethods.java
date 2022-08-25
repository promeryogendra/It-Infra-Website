
package technicianmethods;

import itinfra.notification;
import itinfra.problemlist;
import itinfra.update;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class technicianmethods {
	public boolean login(String name,String pass)
	{
		boolean st =false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from technicians where tid=? and tpass=?");
			ps.setString(1, name);
			ps.setString(2, pass);
			ResultSet rs =ps.executeQuery();
			st = rs.next();
		}catch(ClassNotFoundException | SQLException e)
		{
			System.out.println("ERROR");
		}
		return st;
	}
	public List getupdates()
	{
		List<String> list=new LinkedList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from technicianupdates");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString("about"));
				list.add(rs.getString("tmsg"));
			}
		}catch(ClassNotFoundException | SQLException e)
		{
			System.out.println("ERROR");
		}
		return list;
	}
	public int insertupdate(String nmsg,String nlink)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("insert into updates values(0,?,?)");
			ps.setString(1, nmsg);
			ps.setString(2, nlink);
			int i=ps.executeUpdate();
			if(i==0)
			{
				return 2;
			}
			return 1;
		}
		catch (ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
	public int insertnotification(String nmsg,String nlink)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("insert into notifications values(0,?,?)");
			ps.setString(1, nmsg);
			ps.setString(2, nlink);
			int i=ps.executeUpdate();
			if(i==0)
			{
				return 2;
			}
			return 1;
		}
		catch (ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
	public List<update> getupdatesList()
	{
		List<update> list=new LinkedList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from updates");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				update u=new update((String)rs.getString(1),(String)rs.getString(2),(String)rs.getString(3));
				list.add(u);
			}
		}
		catch(ClassNotFoundException | SQLException e)
		{
			
		}
		return list;
	}
	public int removeupdate(String id,String dept,String desc)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from updates where id=? and dept=? and message=?");
			ps.setString(1, id);
			ps.setString(2, dept);
			ps.setString(3, desc);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				ps=con.prepareStatement("delete from updates where id=? and dept=? and message=?");
				ps.setString(1, id);
				ps.setString(2, dept);
				ps.setString(3, desc);
				if(ps.executeUpdate()==0)
				{
					return 0;
				}
				return 1;
			}
			return -1;
		} 
		catch (ClassNotFoundException | SQLException e) {
		}
		return 2;
	}
	public List<notification> getnotificationList()
	{
		List<notification> list=new LinkedList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from notifications");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				notification n=new notification((String)rs.getString(1),(String)rs.getString(2),(String)rs.getString(3));
				list.add(n);
			}
		}
		catch(ClassNotFoundException | SQLException e)
		{
			
		}
		return list;
	}
	public int removenotification(String id,String msg,String link)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from notifications where id=? and message=? and link=?");
			ps.setString(1, id);
			ps.setString(2, msg);
			ps.setString(3, link);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				ps=con.prepareStatement("delete from notifications where id=? and message=? and link=?");
				ps.setString(1, id);
				ps.setString(2, msg);
				ps.setString(3, link);
				if(ps.executeUpdate()==0)
				{
					return 0;
				}
				return 1;
			}
			return -1;
		} 
		catch (ClassNotFoundException | SQLException e) {
		}
		return 2;
	}
	public List<problemlist> getnewproblems()
	{
		List<problemlist> list=new LinkedList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from problem where pstatus='pending'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String ptype="Not Listead";
				ps=con.prepareStatement("select * from problem_types where ptid=?");
				ps.setString(1, rs.getString("ptype"));
				ResultSet rs1=ps.executeQuery();
				if(rs1.next())
				{
					ptype=rs1.getString("ptname");
				}
				problemlist p=new problemlist(rs.getString("ppid"),rs.getString("psid"),rs.getString("ptype"),rs.getString("pstatus"),rs.getString("pdesc"),ptype);
				list.add(p);
			}
		}
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<problemlist> getoldproblems()
	{
		List<problemlist> list=new LinkedList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from problem where pstatus='success' or pstatus='inprogress'");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String ptype="Not Listead";
				ps=con.prepareStatement("select * from problem_types where ptid=?");
				ps.setString(1, rs.getString("ptype"));
				ResultSet rs1=ps.executeQuery();
				if(rs1.next())
				{
					ptype=rs1.getString("ptname");
				}
				problemlist p=new problemlist(rs.getString("ppid"),rs.getString("psid"),rs.getString("ptype"),rs.getString("pstatus"),rs.getString("pdesc"),ptype);
				ps=con.prepareStatement("select pslot from slots where pid=?");
				ps.setString(1,p.getPid());
				rs1=ps.executeQuery();
				if(rs1.next())
				{
					p.setSlot(rs1.getString(1));
				}
				list.add(p);
			}
		}
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		List<problemlist> temp=new LinkedList<>();
		List<problemlist> temp1=new LinkedList<>();
		Iterator<problemlist> itr=list.iterator();
		while(itr.hasNext())
		{
			problemlist u=itr.next();
			if(u.getPstatus().equals("success"))
			{
				temp1.add(u);
			}
			else
			{
				temp.add(u);
			}
		}
		itr=temp1.iterator();
		while(itr.hasNext())
		{
			temp.add(itr.next());
		}
		return temp;
	}
	public int addtimeslot(String pid,String time)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("insert into slots values(?,?)");
			ps.setString(1, pid);
			ps.setString(2, time);
			int i=ps.executeUpdate();
			if(i!=0)
			{
				ps=con.prepareStatement("update problem set pstatus='inprogress' where ppid=?");
				ps.setString(1, pid);
				i=ps.executeUpdate();
				if(i!=0) 
				{
					return 2;
				}
			}
		}
		catch (ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
	public int makeproblemsuccess(String pid)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("update problem set pstatus='success' where ppid=?");
			ps.setString(1, pid);
			int i=ps.executeUpdate();
			System.out.println(pid);
			if(i!=0)
			{
			System.out.println(pid);
					return 2;
			}
		}
		catch (ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
	public int editslot(String pid,String newslot)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("update slots set pslot=? where pid=?");
			ps.setString(1, newslot);
			ps.setString(2, pid);
			int i=ps.executeUpdate();
			System.out.println(pid);
			if(i!=0)
			{
			System.out.println(pid);
					return 2;
			}
		}
		catch (ClassNotFoundException | SQLException e){
			e.printStackTrace();
		}
		return 0;
	}
}
