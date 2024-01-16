package com.amdocs.bank;
import java.sql.*;

public class Bank {
	//DB Connection
	private static final String URL = "jdbc:mysql://localhost:3306/amdocspro";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "gG8097040526";
	
	public static void main(String[] args) throws ClassNotFoundException {
		try {
			//Loading MySQL JDBC Driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			
			processandUpdate(con);
			
			con.close();
			
		}
		catch (ClassNotFoundException e) {
        e.printStackTrace();
		}
		catch (SQLException e) {
        e.printStackTrace();
		}
	}
	
	public static void updateTrans(Connection con, String TransID, double NewBal, String TransStat) throws SQLException {
		String updateQuery = "UPDATE BankTrans SET NewBal = ?, TransStat = ? WHERE TransID = ?";
		
		try (PreparedStatement updateStatement = con.prepareStatement(updateQuery)) {
			updateStatement.setDouble(1, NewBal);
			updateStatement.setString(2, TransStat);
			updateStatement.setString(3, TransID);
			updateStatement.executeUpdate();
		}
	}
	
	public static void logTrans(Connection con, String TransID, String TransType, double TransAmt, String Validity) throws SQLException {
		
		String logQuery = "INSERT INTO " + (Validity.equals("Valid") ? "ValidTrans" : "InvalidTrans") + "(TransID, TransType, TransAmt, Validity) VALUES (?, ?, ?, ?)";
		 try (PreparedStatement logStatement = con.prepareStatement(logQuery))  {
			 logStatement.setString(1, TransID);
			 logStatement.setString(2, TransType);
			 logStatement.setDouble(3, TransAmt);
			 logStatement.setString(4, Validity);
			 logStatement.executeUpdate();
		 }
	}
	
	private static void processandUpdate(Connection con) throws SQLException {
		String selectQuery = "SELECT TransID, OldBal, TransType, TransAmt, TransStat FROM BankTrans";
		
		try (PreparedStatement selectStatement = con.prepareStatement(selectQuery); 
				ResultSet rs = selectStatement.executeQuery())  {
				while(rs.next()) {
					String TransID = rs.getString("TransID");
					double OldBal = rs.getDouble("OldBal");
					String TransType = rs.getString("TransType");
					double TransAmt = rs.getDouble("TransAmt");
					double NewBal = OldBal + TransAmt;
					String TransStat = rs.getString("TransStat");
					
					if(TransStat == null) {
						TransStat = (NewBal >= 0) ? "Valid":"Invalid";
						logTrans(con, TransID, TransType, TransAmt, TransStat);
						System.out.println("Data Updated Successfully");
				}	
					
					updateTrans(con, TransID, NewBal, TransStat);
			}
				
		}
				
	}
	
	
	
	
	
	
		
}
