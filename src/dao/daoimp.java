package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class daoimp implements UserInterface{
	static String validateUserQry = "select * from admin where aid = ? and password = ?";
	
	public boolean validateUser(int aid,String password) {
		int rowCount = 0;
		boolean validUser = false;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevoting", "root","admin");
			System.out.println(aid);
			System.out.println(password);
			PreparedStatement stat = con.prepareStatement(validateUserQry);
			stat.setInt(1, aid);
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
