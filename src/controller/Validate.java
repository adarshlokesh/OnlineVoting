package controller;



import java.io.IOException;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.UserValidate;

/**
 * Servlet implementation class Validate
 */
public class Validate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		HttpSession session = request.getSession();

		String from=request.getParameter("fromwhere");
		UserValidate uv = new UserValidate();
		Integer vid1;
		
		if(from.equalsIgnoreCase("loginpage")){
		Integer aid = Integer.parseInt(request.getParameter("AID"));
		String password = request.getParameter("password");
		session.setAttribute("aid", aid);
		
		try
		{
			
			if(uv.validateUser(aid, password))
			{
				
				rd = request.getRequestDispatcher("/admintask.jsp");
				rd.forward(request, response);
			}
			else{
				rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
				
			}
		}
		catch(Exception e){
			System.out.println("exception:"+e);
			rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
		}
	}
		if(from.equalsIgnoreCase("loginpage1")){
			Integer vid = Integer.parseInt(request.getParameter("VID"));
			Integer password = Integer.parseInt(request.getParameter("Ano"));
			session.setAttribute("vid1", vid);
			
			try
			{
				
				if(validateVoter(vid, password))
				{
					
					rd = request.getRequestDispatcher("/password.jsp");
					rd.forward(request, response);
				}
				else{
					rd = request.getRequestDispatcher("/error.jsp");
					rd.forward(request, response);
					
				}
			}
			catch(Exception e){
				System.out.println("exception:"+e);
				rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		}
		if(from.equalsIgnoreCase("addvoter")){
			Integer vid = Integer.parseInt(request.getParameter("VID"));
			Integer ano = Integer.parseInt(request.getParameter("Ano"));
			String pass = request.getParameter("pass");
			
			try
			{
				
				if(addPass(vid, ano,pass))
				{
					
					rd = request.getRequestDispatcher("/success.jsp");
					rd.forward(request, response);
				}
				else{
					rd = request.getRequestDispatcher("/error.jsp");
					rd.forward(request, response);
					
				}
			}
			catch(Exception e){
				System.out.println("exception:"+e);
				rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		}
		if(from.equalsIgnoreCase("addcand")){
			Integer vid = Integer.parseInt(request.getParameter("VID"));
			Integer cid = Integer.parseInt(request.getParameter("CID"));
			
			
			try
			{
				
				if(addCandidate(cid,vid))
				{
					
					rd = request.getRequestDispatcher("/success.jsp");
					rd.forward(request, response);
				}
				else{
					rd = request.getRequestDispatcher("/error.jsp");
					rd.forward(request, response);
					
				}
			}
			catch(Exception e){
				System.out.println("exception:"+e);
				rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		}
		if(from.equalsIgnoreCase("remove")){
			Integer cid = Integer.parseInt(request.getParameter("cid"));
			int vid= (int) session.getAttribute("vid1");
			if(voteEntry(vid,cid)){
				rd = request.getRequestDispatcher("/success.jsp");
				rd.forward(request, response);
			}
			else{
				rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		}

		if(from.equalsIgnoreCase("password")){
			String password = request.getParameter("password");
			int vid= (int) session.getAttribute("vid1");
			if(validatePassword(vid,password)){
				rd = request.getRequestDispatcher("/candidates.jsp");
				rd.forward(request, response);
			}
			else{
				rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		}
		if(from.equalsIgnoreCase("adddetails")){
			Integer vid = Integer.parseInt(request.getParameter("VID"));
			Integer bid = Integer.parseInt(request.getParameter("BID"));
			Long mobile = Long.parseLong(request.getParameter("mobile"));
			Integer adharNo = Integer.parseInt(request.getParameter("adharNo"));
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("EID");
			
			if(validateDetails(vid,name,adharNo,email,mobile,bid,password)){
				rd = request.getRequestDispatcher("/success.jsp");
				rd.forward(request, response);
			}
			else{
				rd = request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		}
	
	}
	
	public boolean validateVoter(int vid,int aid) {
	
		boolean validUser = false;
		String validatevoter="select * from voters where vid = ? and adharNo = ?";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting", "root","admin");
			System.out.println(vid);
			System.out.println(aid);
			PreparedStatement stat = con.prepareStatement(validatevoter);
			stat.setInt(1, vid);
			stat.setInt(2, aid);
			ResultSet rs = stat.executeQuery();
			
			while(rs.next()) {				
				//rowCount++;
				
					
					validUser = true;
					
				
			}
			
			
			
			
		}
		
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}
		System.out.println(validUser);
		//System.out.println(rowCount);
		return validUser;
	}
	public boolean addPass(int vid,int aid,String pass) {
		
		boolean validUser = false;
		String validatevoter="update voters set password=? where vid=? and adharNo=?";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting", "root","admin");
			System.out.println(vid);
			System.out.println(aid);
			PreparedStatement stat = con.prepareStatement(validatevoter);
			stat.setString(1, pass);
			stat.setInt(2, vid);
			stat.setInt(3, aid);
			int rs = stat.executeUpdate();
			if(rs>=0){
				validUser=true;
			}
		}
		
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}
		System.out.println(validUser);
		//System.out.println(rowCount);
		return validUser;
	}
	public boolean addCandidate(int cid,int vid) {
		
		boolean validUser = false;
		String validatevoter="insert into candidates values (?,?)";
		String qry="insert into leader values (?,(select bid from voters where vid=?),0);";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting", "root","admin");
			System.out.println(cid);
			System.out.println(vid);
			PreparedStatement stat = con.prepareStatement(validatevoter);
			stat.setInt(1, cid);
			stat.setInt(2, vid);
			int rs = stat.executeUpdate();
			
			if(rs>=0) {				
				//rowCount++;
				
					
					validUser = true;
					
				
			}
			if(validUser){
				 stat = con.prepareStatement(qry);
				 stat.setInt(1, cid);
				 stat.setInt(2, vid);
				 stat.executeUpdate();
			}
			
			
			
		}
		
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}
		System.out.println(validUser);
		//System.out.println(rowCount);
		return validUser;
	}
public boolean validateDetails(int vid,String name,int adharNo,String email,long mobile,int bid,String password) {
		
		boolean validUser = false;
		
		String qry="insert into voters values (?,?,?,?,?,?,?)";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting", "root","admin");
			
			PreparedStatement stat = con.prepareStatement(qry);
			 stat.setInt(1, vid);
			 stat.setString(2, name);
			 stat.setInt(3, adharNo);
			 stat.setString(4, email);
			 stat.setLong(5,mobile );
			 stat.setInt(6, bid);
			 stat.setString(7, password);
			int rs = stat.executeUpdate();
			
			if(rs>=0) {				
				//rowCount++;
				
					
					validUser = true;
					
				
			}
			
			
			
		}
		
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}
		System.out.println(validUser);
		//System.out.println(rowCount);
		return validUser;
	}
	public boolean voteEntry(int vid,int cid){
		boolean validUser = false;
		String validatevote="insert into votes values (?,?)";
		//String updateqry="update leader set vote_count=vote_count+1 where cid=?";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting", "root","admin");
			System.out.println(vid);
			System.out.println(cid);
			PreparedStatement stat = con.prepareStatement(validatevote);
			stat.setInt(1, vid);
			stat.setInt(2, cid);
			int rs = stat.executeUpdate();
			
			if(rs>=0) {				
				//rowCount++;
				
					
					validUser = true;
					
				
			}
			/*if(validUser){
				stat = con.prepareStatement(updateqry);
				stat.setInt(1, cid);
				stat.executeUpdate();
			}*/
			
			
			
		}
		
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}
		System.out.println(validUser);
		//System.out.println(rowCount);
		return validUser;
		
	}
	public boolean validatePassword(int vid,String password) {
		
		boolean validUser = false;
		String validatePassword="select * from voters where vid = ? and password = ?";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting", "root","admin");
			System.out.println(vid);
			System.out.println(password);
			PreparedStatement stat = con.prepareStatement(validatePassword);
			stat.setInt(1, vid);
			stat.setString(2, password);
			ResultSet rs = stat.executeQuery();
			
			while(rs.next()) {				
				//rowCount++;
				
					
					validUser = true;
					
				
			}
			
			
			
			
		}
		
		catch(Exception e){
			System.out.println("Exception:"+e);
			
		}
		System.out.println(validUser);
		//System.out.println(rowCount);
		return validUser;
	}
}
