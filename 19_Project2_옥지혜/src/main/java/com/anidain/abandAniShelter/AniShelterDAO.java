package com.anidain.abandAniShelter;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.anidain.ani.AniBean;

public class AniShelterDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static AniShelterDAO asdao;

	private AniShelterDAO() {
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
	}//AniShelterDAO 생성자

	public static AniShelterDAO getInstance() {
		if (asdao == null)
			asdao = new AniShelterDAO();
		return asdao;
	}// DBCP
	
	//ani_management_details.jsp
	public ArrayList<AniShelterBean> getAllAniShl(){
		ArrayList<AniShelterBean> list = new ArrayList<AniShelterBean>();
		
		String sql = "select * from abandAniShelter order by care_reg_no asc";
		try {
			ps = conn.prepareStatement(sql);
			if(ps != null) {
				rs = ps.executeQuery();
				while(rs.next()) {
					//CARE_REG_NO CARENM               CARETEL CAREADDR
					int care_reg_no = rs.getInt("care_reg_no");
					String careNm = rs.getString("careNm");
					String careTel = rs.getString("careTel");
					String careAddr = rs.getString("careAddr");
					
					AniShelterBean aniSB = new AniShelterBean();
					aniSB.setCare_reg_no(care_reg_no);
					aniSB.setCareNm(careNm);
					aniSB.setCareTel(careTel);
					aniSB.setCareAddr(careAddr);
					list.add(aniSB);
					
				}//while
			}else {
				System.out.println("AniShelterDAO getAllAniShl : ps null");
			}
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
				System.out.println("AniShelterDAO getAllAniShl : 연결 해제 에러");
			}
		} // finally
		
		return list;
			
	}//getAllAniShl
	
	public AniShelterBean getAniShlByNo(int care_reg_no) {
		AniShelterBean aniSB = null;
		
		String sql = "select * from abandAniShelter where care_reg_no=?"; 
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, care_reg_no);
			if(ps != null) {
				rs = ps.executeQuery();
				if(rs.next()) {
					String careNm = rs.getString("careNm");
					String careTel = rs.getString("careTel");
					String careAddr = rs.getString("careAddr");
					 
					aniSB = new AniShelterBean();
					aniSB.setCare_reg_no(care_reg_no);
					aniSB.setCareNm(careNm);
					aniSB.setCareTel(careTel);
					aniSB.setCareAddr(careAddr);

				}//if - rs
			}//if - ps != null
		} catch (SQLException e) {
			System.out.println("AniShelterDAO getAniShlByNo : ps null");
		}finally {
			try {
				if (ps != null)
					ps.close();

				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println("AniShelterDAO getAniShlByNo : 연결 해제 에러");
			}
		} // finally
		
		return aniSB;
		
	}//getAniByNo
	
	public int getAniShlCount() {
		int count = -1;
		String sql = "select count(*) as cnt from abandAniShelter";// 레코드갯수 구하기
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt"); // 별칭지정O
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 5. 자원반납
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // finally

		return count;

	}// getAniShlCount
	
	
}//AniShelterDAO
