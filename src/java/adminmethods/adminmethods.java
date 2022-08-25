
package adminmethods;
import itinfra.problemlist;
import java.sql.*;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class adminmethods {
	public boolean login(String name,String pass)
	{
		boolean st =false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from administration where aname=? and apass=?");
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
	public int[] getstatus()
	{
		int a[]=new int[4];
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select count(ppid) from problem");
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				a[0]=Integer.parseInt(rs.getString(1));
			}
			ps=con.prepareStatement("select count(ppid) from problem where pstatus='pending'");
			rs =ps.executeQuery();
			if(rs.next())
			{
				a[1]=Integer.parseInt(rs.getString(1));
			}
			ps=con.prepareStatement("select count(ppid) from problem where pstatus='inprogress'");
			rs =ps.executeQuery();
			if(rs.next())
			{
				a[2]=Integer.parseInt(rs.getString(1));
			}
			ps=con.prepareStatement("select count(ppid) from problem where pstatus='success'");
			rs =ps.executeQuery();
			if(rs.next())
			{
				a[3]=Integer.parseInt(rs.getString(1));
			}
		}catch(ClassNotFoundException | SQLException e)
		{
			System.out.println("ERROR");
		}
		return a;
	}
	public int addtechnician(String username,String password,String fullname,String gmail,String phone)
	{
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from technicians where tid=? and tpass=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				return 1;
			}
			ps=con.prepareStatement("insert into technicians values (?,?,?,?,?)");
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, fullname);
			ps.setString(4, phone);
			ps.setString(5, gmail);
			int i=ps.executeUpdate();
			if(i==0)
			{
				return 0;
			}
			return 2;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 3;
	}
	public int addproblemtype(String type)
	{
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from problem_types where ptname=?");
			ps.setString(1, type);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				return 1;
			}
			ps=con.prepareStatement("insert into problem_types values (0,?)");
			ps.setString(1, type);
			int i=ps.executeUpdate();
			if(i==0)
			{
				return 0;
			}
			return 2;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 3;
	}
	public List<String[]> getproblemtypes()
	{
		List<String[]> list=new LinkedList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from problem_types");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				String a[]=new String[3];
				ps=con.prepareStatement("select count(ppid) from problem where ptype=? and pstatus!='success'");
				ps.setString(1, rs.getString("ptid"));
				ResultSet rs1=ps.executeQuery();
				if(rs1.next())
				{
					a[2]=rs1.getString(1);
				}
				else
				{
					a[2]="0";
				}
				a[0]=rs.getString(1);
				a[1]=rs.getString(2);
				list.add(a);
			}
		}
		catch(ClassNotFoundException | SQLException e)
		{
			
		}
		return list;
	}
	public int removeproblemtype(String ptype)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("delete from problem_types where ptid=?");
			ps.setString(1, ptype);
			int k=ps.executeUpdate();
			if(k==0)
			{
				return 0;
			}
			return 1;
		}
		catch(Exception e)
		{
			
		}
		return 2;
	}
	public int insertupdate(String nmsg,String desc)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("insert into technicianupdates values(0,?,?)");
			ps.setString(1, nmsg);
			ps.setString(2, desc);
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
	public List<String[]> getupdatesList()
	{
		List<String[]> list=new LinkedList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from technicianupdates");
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				String a[]=new String[3];
				a[0]=rs.getString(1);
				a[1]=rs.getString(2);
				a[2]=rs.getString(3);
				list.add(a);
			}
		}
		catch(Exception e)
		{
			
		}
		return list;
	}
	public int removeupdate(String id,String dept,String desc)
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from technicianupdates where id=? and about=? and tmsg=?");
			ps.setString(1, id);
			ps.setString(2, dept);
			ps.setString(3, desc);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				ps=con.prepareStatement("delete from technicianupdates where id=? and about=? and tmsg=?");
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
	public List<problemlist> getproblems()
	{
		List<problemlist> list=new LinkedList<>();
		List<problemlist> temp=new LinkedList<>();
		List<problemlist> temp1=new LinkedList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from problem");
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
				switch (p.getPstatus()) {
					case "pending":
						list.add(p);
						break;
					case "inprogress":
						temp.add(p);
						break;
					default:
						temp1.add(p);
						break;
				}
			}
		}
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		Iterator<problemlist> itr=temp.iterator();
		while(itr.hasNext())
		{
			list.add(itr.next());
		}
		itr=temp1.iterator();
		while(itr.hasNext())
		{
			list.add(itr.next());
		}
		return list;
	}
	public int editprofile(String user,String pass)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("update administration set aname =?,apass=?");
			ps.setString(1, user);
			ps.setString(2, pass);
			int k=ps.executeUpdate();
			if(k!=0)
				return 2;
			
		}
		catch(Exception e)
		{
			
		}
		return 1;
	}
}
