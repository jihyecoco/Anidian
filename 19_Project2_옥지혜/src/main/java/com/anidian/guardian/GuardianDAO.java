package com.anidian.guardian;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GuardianDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static GuardianDAO gdao;

	private GuardianDAO() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:comp/env");
			System.out.println("envContext ok");
			DataSource ds = (DataSource) envContext.lookup("jdbc/OracleDB");
			System.out.println("DataSource ok");
			conn = ds.getConnection();
			System.out.println("conn:" + conn);
		} catch (NamingException e) {
			System.out.println("NamingException!!");
		} catch (SQLException e) {
			System.out.println("SQLException!!");
		}
	}//GuardianDAO

	public static GuardianDAO getInstance() {
		if (gdao == null)
			gdao = new GuardianDAO();
		return gdao;
	}// getInstance

	//guardianProc.jsp
	public int insertGuardian(GuardianBean guardian) {
	
		int cnt = -1;
		GuardianBean gd = null;
		
		String sql1 = "select userPw from users where userId =?";
		String sql2 = "insert into guardian values(guardseq.nextval,?,?,?,?,?)";
		
		try {
		ps = conn.prepareStatement(sql1);
		ps.setString(1, guardian.getUserId());
		rs = ps.executeQuery();
		
			if (rs.next()) {
			String dbpw = rs.getString("userPw");
				if(dbpw.equals(guardian.getUserPw())){//사용자가 입력한 비밀번호가 db에 있는 비밀번호와 일치
					ps = conn.prepareStatement(sql2);
					ps.setInt(1, guardian.getNo());
					ps.setString(2, guardian.getUserId());
					ps.setString(3, guardian.getUserPw());
					ps.setString(4, guardian.getGender());
					ps.setString(5, guardian.getReason());
				
				cnt = ps.executeUpdate();
				}
			}//if -rs
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (ps != null)
					ps.close();

				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println("insertGuardian SQL에러");
			}
		} // finally
		
		return cnt;
	}//insertGuardian
	
			
	
}//GuardianDAO
