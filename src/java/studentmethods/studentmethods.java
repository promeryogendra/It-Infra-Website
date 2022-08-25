package studentmethods;

import itinfra.problem;
import itinfra.student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class studentmethods {
	public boolean login(String name,String pass)
	{
		boolean st =false;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from students where sid=? and spass=?");
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
			PreparedStatement ps =con.prepareStatement("select * from updates");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString("dept"));
				list.add(rs.getString("message"));
			}
		}catch(ClassNotFoundException | SQLException e)
		{
			System.out.println("ERROR");
		}
		return list;
	}
	public List getnotifications()
	{
		List<String> list=new LinkedList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from notifications");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString("message"));
				list.add(rs.getString("link"));
			}
		}catch(ClassNotFoundException | SQLException e)
		{
			System.out.println("ERROR");
		}
		return list;
	}
	public student getprofile(String id)
	{
		student st=new student();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from students where sid=?");
			ps.setString(1, id);
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				st.setSid(id);
				st.setSname(rs.getString("sname"));
				st.setSage(rs.getString("sage"));
				st.setSmail(rs.getString("smail"));
				st.setSbatch(rs.getString("sbatch"));
				st.setBranch(rs.getString("branch"));
				st.setSphone(rs.getString("sphone"));
			}
			//more code here for laptap and adapater
		}catch(ClassNotFoundException | SQLException e)
		{
			System.out.println("ERROR");
		}
		return st;
	}
	public List getproblemtypes()
	{
		List<String> list=new LinkedList<>();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from problem_types");
			ResultSet rs =ps.executeQuery();
			while(rs.next())
			{
				list.add(rs.getString("ptname"));
			}
		}catch(ClassNotFoundException | SQLException e)
		{
			System.out.println("ERROR");
		}
		return list;
	}
	public int checkproblem(String ptype,String sid,String pdesc)
	{
		boolean st =false;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select ptid from problem_types where ptname=?");
			ps.setString(1, ptype);
			ResultSet rs =ps.executeQuery();
			int ptid;
			if(rs.next())
			{
				ptid=rs.getInt("ptid");
				ps=con.prepareStatement("select * from problem where ptype=? and psid=? and pstatus!='success'");
				ps.setString(1, ""+ptid);
				ps.setString(2, sid);
				rs =ps.executeQuery();
				if(rs.next())
				{
					return 1;
				}
				else
				{
					st=true;
					ps=con.prepareStatement("insert into problem values(0,?,?,?,?)");
					ps.setString(1, sid);
					ps.setString(2, ""+ptid);
					ps.setString(3 , pdesc);
					ps.setString(4, "pending");
					int i=ps.executeUpdate();
					if(i==0)
					{
						return 2;
					}
					else
					{
						return 4;
					}
				}
			}
			else
			{
				return 0;
			}
		}catch(ClassNotFoundException | SQLException e)
		{
			if(st==true)
			{
				System.out.println(e.getMessage());
				return 3;
			}
			System.out.println("ERROR");
		}
		return -1;
	}
	public List<problem> getproblems(String sid)
	{
		List<problem> list=new LinkedList<>();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from problem where psid=?");
			ps.setString(1, sid);
			ResultSet rs =ps.executeQuery();
			String ptype=null;
			while(rs.next())
			{
				ps =con.prepareStatement("select ptname from problem_types where ptid=?");
				ps.setString(1,rs.getString("ptype"));
				ResultSet rs1 =ps.executeQuery();
				if(rs1.next())
				{
					ptype=rs1.getString("ptname");
				}
				else
				{
					ptype="Problem type not mentioned";
				}
				problem p=new problem(sid,ptype,rs.getString("pdesc"),rs.getString("pstatus"));
				p.ptid=rs.getInt("ppid");
				list.add(p);
			}
		}catch(ClassNotFoundException | SQLException e)
		{
			System.out.println("ERROR");
		}
		if(list==null || list.isEmpty())
		{
			return list;
		}
		else
		{
			List<problem> temp=new LinkedList<>();
			List<problem> temp1=new LinkedList<>();
			List<problem> temp2=new LinkedList<>();
			
			Iterator<problem> itr=list.iterator();
			while(itr.hasNext())
			{
				problem p=itr.next();
				if(p.getPstatus().equals("inprogress"))
				{
					temp.add(p);
				}
				else if(p.getPstatus().equals("pending"))
				{
					temp1.add(p);
				}
				else if(p.getPstatus().equals("success"))
				{
					temp2.add(p);
				}
			}
			itr=temp1.iterator();
			while(itr.hasNext())
			{
				temp.add(itr.next());
			}
			itr=temp2.iterator();
			while(itr.hasNext())
			{
				temp.add(itr.next());
			}
			return temp;
		}
	}
	public String getslot(String ptid)
	{
		String s="None";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/itinfra?","root","root");
			PreparedStatement ps =con.prepareStatement("select * from slots where pid=?");
			ps.setString(1, ptid);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{
				s=(String)rs.getString(2);
				return s;
			}
		}
		catch(ClassNotFoundException | SQLException e)
		{
			
		}
		return s;
	}
}
