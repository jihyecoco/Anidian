package com.anidian.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UsersDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static UsersDAO udao;

	private UsersDAO() {
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
	}//UsersDAO

	public static UsersDAO getInstance() {
		if (udao == null)
			udao = new UsersDAO();
		return udao;
	}// getInstance
	
	
	//loginProc.jsp
	public UsersBean getUsersInfo(String userId, String userPw) {
		
		UsersBean ub = null;
		System.out.println("1. DAO getUsersInfo : " + userId + " / " + userPw);
		String sql = "select userId, userPw from users where userId=? and userPw=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userPw);
			System.out.println("2. getUsersInfo userId : " + userId);
			if(ps!=null) {
				rs = ps.executeQuery();
				System.out.println("3. UsersDAO rs.next() : " + rs);

				if (rs.next()) {
					ub = new UsersBean();
					if(userPw.equals(rs.getString("userPw"))) {
						String p_userId = rs.getString("userId");
						String p_userPw = rs.getString("userPw");
						System.out.print("4. UsersDAO rs.next() userId : " + p_userId);
						System.out.print(" 4. UsersDAO rs.next() userPw : " + p_userPw);
						System.out.println();
						
						ub.setUserId(p_userId);
						ub.setUserPw(userPw);
					}
				
					
					
					System.out.println("5. UsersDAO rs.next() p_userId " );
				
				}//rs.next()
		
			}else {
				System.out.println("ps == null");
			}
		} catch (SQLException e) {
			System.out.println("getMembersInfo : SQL ?óê?ü¨");
		} finally {
			try {
				if (ps != null)
					ps.close();

				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println("getMembersInfo : ?ó∞Í≤? ?ï¥?†ú ?óê?ü¨");
			}
		} // finally
		return ub;

	}// getUsersInfo

	
	//registerProc.jsp
	public int insertUsers(UsersBean users) {
		/*
		 * System.out.println(users.getUserId());
		 * System.out.println(users.getUserPw());
		 * System.out.println(users.getUserName());
		 * System.out.println(users.getEmail());
		 * System.out.println(users.getPhoneNum());
		 * System.out.println(users.getAddress());
		 * System.out.println(users.getAddress_sub());
		 */
		int cnt = -1;
		UsersBean ub = null;
		String sql = "insert into users values(userseq.nextval,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, users.getUserName());
			ps.setString(2, users.getUserId());
			ps.setString(3, users.getUserPw());
			ps.setString(4, users.getEmail());
			ps.setString(5, users.getPhoneNum());
			ps.setString(6, users.getAddress());
			ps.setString(7, users.getAddress_sub());
			
			cnt = ps.executeUpdate();
			
		
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
				System.out.println("insertUsers : ?ó∞Í≤? ?ï¥?†ú ?óê?ü¨");
			}
		} // finally
		
		return cnt;
	}//insertUsers
	
	//findmIdProc.jsp
	public UsersBean findmId(UsersBean users) {
		UsersBean bean = null;
		String sql = "select * from users where userName=? and email=? and phoneNum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, users.getUserName());
			ps.setString(2, users.getEmail());
			ps.setString(3, users.getPhoneNum());
			
			rs = ps.executeQuery();
			if(rs.next()) {
				String userId = rs.getString("userId");
				String userPw = rs.getString("userPw");
				String userName = rs.getString("userName");
				String email = rs.getString("email");
				String phoneNum = rs.getString("phoneNum");
				String address = rs.getString("address");
				String address_sub = rs.getString("address_sub");
				
				bean = new UsersBean();
				bean.setUserId(userId);
				bean.setUserPw(userPw);
				bean.setUserName(userName);
				bean.setEmail(email);
				bean.setPhoneNum(phoneNum);
				bean.setAddress(address);
				bean.setAddress_sub(address_sub);
				
			}//if
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bean;
		
	}//findmId
	
	//findmPwProc.jsp
	public UsersBean findmPw(UsersBean users) {
		UsersBean bean = null;
		String sql = "select * from users where userId=? and userName=? and email=? and phoneNum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, users.getUserId());
			ps.setString(2, users.getUserName());
			ps.setString(3, users.getEmail());
			ps.setString(4, users.getPhoneNum());
			
			rs = ps.executeQuery();
			if(rs.next()) {
				String userId = rs.getString("userId");
				String userPw = rs.getString("userPw");
				String userName = rs.getString("userName");
				String email = rs.getString("email");
				String phoneNum = rs.getString("phoneNum");
				String address = rs.getString("address");
				String address_sub = rs.getString("address_sub");
				
				bean = new UsersBean();
				bean.setUserId(userId);
				bean.setUserPw(userPw);
				bean.setUserName(userName);
				bean.setEmail(email);
				bean.setPhoneNum(phoneNum);
				bean.setAddress(address);
				bean.setAddress_sub(address_sub);
				
			}//if
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bean;
		
	}//findmPw
	
	//findmPwProc.jsp
	public boolean check_userId(String userId) {
		boolean flag = false;
			String sql = "select userId from users where userId=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return flag;
			
	}//check_userId

	public ArrayList<UsersBean> getAllUsers() {
		ArrayList<UsersBean> lists = new ArrayList<UsersBean>();
		UsersBean ub = null;
		// "select * from users order by userNo"
		
		String sql = "SELECT userNo, userName, userid, userPw, email, "
				+ "REGEXP_REPLACE(phoneNum, '(02|.{3})(.+)(.{4})', '\\1-\\2-\\3') phoneNum, address, address_sub "
				+ "FROM users "
				+ "where userid<>'admin' "
				+ "order by userNo";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
				
			while(rs.next()) {
				int userNo = (Integer.parseInt(rs.getString("userNo")));
				String userName = rs.getString("userName");
				String userId = rs.getString("userId");
			//	String userPw = rs.getString("userPw");
				
				String email = rs.getString("email");
				String phoneNum = rs.getString("phoneNum");
				String address = rs.getString("address");
				String address_sub = rs.getString("address_sub");
				
				ub = new UsersBean();
				ub.setUserNo(userNo);
				ub.setUserId(userId);
				//ub.setUserPw(userPw);
				ub.setUserName(userName);
				ub.setEmail(email);
				ub.setPhoneNum(phoneNum);
				ub.setAddress(address);
				ub.setAddress_sub(address_sub);
				lists.add(ub);
				
			}//while
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return lists;

	}//getAllUsers
	
}// membersDAO
