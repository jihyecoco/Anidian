package com.anidain.ani;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.anidian.board.BoardBean;
import com.anidian.users.UsersBean;
import com.oreilly.servlet.MultipartRequest;


public class AniDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static AniDAO adao;

	private AniDAO() {
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
	}

	public static AniDAO getInstance() {
		if (adao == null)
			adao = new AniDAO();
		return adao;
	}// DBCP
	
	
	//admin - ani_management.jsp
	public ArrayList<AniBean> getAllAni(){
		ArrayList<AniBean> list = new ArrayList<AniBean>();
		
		String sql = "select * from abandAni order by no asc";
		try {
			ps = conn.prepareStatement(sql);
			if(ps != null) {
				rs = ps.executeQuery();
				while(rs.next()) {
					int no = rs.getInt("no");
					Date bgnde = rs.getDate("bgnde");
					String state = rs.getString("state");
					String upkind = rs.getString("upkind");
					String happenPlace = rs.getString("happenPlace");
					String happenPlace_sub = rs.getString("happenPlace_sub");
					String kindCd = rs.getString("kindCd");
					String colorCd = rs.getString("colorCd");
					String sexCd = rs.getString("sexCd");
					String neuter_yn = rs.getString("neuter_yn");
					String specialMark = rs.getString("specialMark");
					String ani_image = rs.getString("ani_image");
					int care_reg_no = rs.getInt("care_reg_no");
					
					AniBean aniB = new AniBean();
					aniB.setNo(no);
					aniB.setBgnde(bgnde);
					aniB.setState(state);
					aniB.setUpkind(upkind);
					aniB.setHappenPlace(happenPlace);
					aniB.setHappenPlace_sub(happenPlace_sub);
					aniB.setKindCd(kindCd);
					aniB.setColorCd(colorCd);
					aniB.setSexCd(sexCd);
					aniB.setNeuter_yn(neuter_yn);
					aniB.setSpecialMark(specialMark);
					aniB.setAni_image(ani_image);
					aniB.setCare_reg_no(care_reg_no);
					
					list.add(aniB);
					
				}//while
			}else {
				System.out.println("AniDAO getAllAni : ps null");
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
				System.out.println("AniDAO getAllAni : 연결 해제 에러");
			}
		} // finally
		return list;
		
	}//getAllAni
	
	//user-aniList.jsp
	public ArrayList<AniBean> getAniByState(){
		//1. abandAni 테이블과 abandAniDetails 테이블 join && state가 protect or notice 값만 가져오기.
		ArrayList<AniBean> list = new ArrayList<AniBean>();
		String sql = 
				  "	 SELECT no, bgnde, state, upkind, happenPlace, happenPlace_sub, kindCd, colorCd, sexCd, neuter_yn, specialMark, ani_image, care_reg_no "
				  + "FROM abandAni ani "
				  + "where state ='protect' or state ='notice' or state = 'check' "
				  + "order by no ";
		System.out.println("query ok");
		try {
			ps = conn.prepareStatement(sql);
			System.out.println("ps ok");
			if(ps != null) {
				rs = ps.executeQuery();
				System.out.println("rs ok");
				while(rs.next()) {
					int no = rs.getInt("no");
					Date bgnde = rs.getDate("bgnde");
					String upkind = rs.getString("upkind");
					String happenPlace = rs.getString("happenPlace");
					String happenPlace_sub = rs.getString("happenPlace_sub");
					String kindCd = rs.getString("kindCd");
					String colorCd = rs.getString("colorCd");
					String sexCd = rs.getString("sexCd");
					String neuter_yn = rs.getString("neuter_yn");
					String specialMark = rs.getString("specialMark");
					String ani_image = rs.getString("ani_image");
					String state = rs.getString("state");
					//int care_reg_no = Integer.parseInt(rs.getString("care_reg_no"));
					
					AniBean aniB = new AniBean();
					aniB.setNo(no);
					aniB.setBgnde(bgnde);
					aniB.setUpkind(upkind);
					aniB.setHappenPlace(happenPlace);
					aniB.setHappenPlace_sub(happenPlace_sub);
					aniB.setKindCd(kindCd);
					aniB.setColorCd(colorCd);
					aniB.setSexCd(sexCd);
					aniB.setNeuter_yn(neuter_yn);
					aniB.setSpecialMark(specialMark);
					aniB.setAni_image(ani_image);
					aniB.setState(state);
					//aniB.setCare_reg_no(care_reg_no);
					list.add(aniB);
					
				}//while
			}else {
				System.out.println("AniDAO getAniByState : ps null");
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
				System.out.println("AniDAO getAniByState : 연결 해제 에러");
			}
		} // finally
		
		return list;
		
	}//getAllAni
	
	//aniList_Detail.jsp
	public AniBean getAniByNo(int no) {
		//System.out.println("AniDAO getAniByNo : " + no);
		AniBean aniB = new AniBean();
		
		String sql = "select * from abandAni where no=?"; 
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			if(ps != null) {
				rs = ps.executeQuery();
				if(rs.next()) {
					Date bgnde = rs.getDate("bgnde");
					String upkind = rs.getString("upkind");
					String happenPlace = rs.getString("happenPlace");
					String happenPlace_sub = rs.getString("happenPlace_sub");
					String state = rs.getString("state");
					String kindCd = rs.getString("kindCd");
					String colorCd = rs.getString("colorCd");
					String sexCd = rs.getString("sexCd");
					String neuter_yn = rs.getString("neuter_yn");
					String specialMark = rs.getString("specialMark");
					String ani_image = rs.getString("ani_image");
					int care_reg_no = rs.getInt("care_reg_no");

					aniB.setNo(no);
					aniB.setBgnde(bgnde);
					aniB.setUpkind(upkind);
					aniB.setHappenPlace(happenPlace);
					aniB.setHappenPlace_sub(happenPlace_sub);
					aniB.setState(state);
					aniB.setKindCd(kindCd);
					aniB.setColorCd(colorCd);
					aniB.setSexCd(sexCd);
					aniB.setNeuter_yn(neuter_yn);
					aniB.setSpecialMark(specialMark);
					aniB.setAni_image(ani_image);
					aniB.setCare_reg_no(care_reg_no);
					
				}//if - rs
			}//if - ps != null
		} catch (SQLException e) {
			System.out.println("AniDAO getAniByNo : ps null");
		}finally {
			try {
				if (ps != null)
					ps.close();

				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println("AniDAO getAniByNo : 연결 해제 에러");
			}
		} // finally
		
		return aniB;
		
	}//getAniByNo
	
	//main.jsp
	public int getAniByBgndeCount() {
		int count = -1;
		String sql = "select count(*) as cnt from abandAni where bgnde=to_char(sysdate,'yy-mm-dd')";// 레코드갯수 구하기
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
		System.out.println("전체 레코드 갯수:" + count);
		return count;

	}// getAniByBgndeCount
	
	//main.jsp
	public ArrayList<AniBean> getAniByBgnde() {
		ArrayList<AniBean> list = new ArrayList<AniBean>();
	
		String sql = "select * from abandAni where bgnde=to_char(sysdate,'yy-mm-dd')"; 
			try {
				ps = conn.prepareStatement(sql);
				if(ps != null) {
					rs = ps.executeQuery();
					while(rs.next()) {
						int no = rs.getInt("no");
						Date bgnde = rs.getDate("bgnde");
						String state = rs.getString("state");
						String upkind = rs.getString("upkind");
						String happenPlace = rs.getString("happenPlace");
						String happenPlace_sub = rs.getString("happenPlace_sub");
						String kindCd = rs.getString("kindCd");
						String colorCd = rs.getString("colorCd");
						String sexCd = rs.getString("sexCd");
						String neuter_yn = rs.getString("neuter_yn");
						String specialMark = rs.getString("specialMark");
						String ani_image = rs.getString("ani_image");
						int care_reg_no = rs.getInt("care_reg_no");
						
						AniBean aniB = new AniBean();
						aniB.setNo(no);
						aniB.setBgnde(bgnde);
						aniB.setState(state);
						aniB.setUpkind(upkind);
						aniB.setHappenPlace(happenPlace);
						aniB.setHappenPlace_sub(happenPlace_sub);
						aniB.setKindCd(kindCd);
						aniB.setColorCd(colorCd);
						aniB.setSexCd(sexCd);
						aniB.setNeuter_yn(neuter_yn);
						aniB.setSpecialMark(specialMark);
						aniB.setAni_image(ani_image);
						aniB.setCare_reg_no(care_reg_no);
						
						list.add(aniB);
						
					}//while
				}else {
					System.out.println("AniDAO getAniByBgnde : ps null");
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
					System.out.println("AniDAO getAniByBgnde : 연결 해제 에러");
				}
			} // finally
			return list;
		
	}//getAniByBgnde
	
	//main.jsp
	public int getAniByStateCount_f() {//state ='protect' or state ='notice'
		int count = -1;
		String sql = "select count(*) as cnt from abandAni "
				+ "where state ='protect' or state ='notice'";// 레코드갯수 구하기
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
		//System.out.println("전체 레코드 갯수:" + count);
		return count;

	}// getAniByStateCount_f	
	
	//main.jsp
	public int getAniByStateCount() {//state ='protect' or state ='notice'
		int count = -1;
		String sql = "select count(*) as cnt from abandAni "
				+ "where state ='adopt' or state ='guardian'";// 레코드갯수 구하기
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt"); // 별칭지정O
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // finally
		//System.out.println("전체 레코드 갯수:" + count);
		return count;

	}// getAniByStateCount	
	
	//admin - main.jsp
	public int getAniByStateCount_c() {//state ='check'
		int count = -1;
		String sql = "select count(*) as cnt from abandAni where state ='check' ";// 레코드갯수 구하기
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt"); // 별칭지정O
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // finally
		//System.out.println("전체 레코드 갯수:" + count);
		return count;

	}// getAniByStateCount_c	
		
	//findAni.jsp
	public int insertAbandAni(MultipartRequest mr) {
		int cnt = -1;
		
		String sql = "insert into abandAni(no, bgnde, state, upkind, happenPlace, happenPlace_sub, "
				+ "kindCd, colorCd, sexCd, neuter_yn, specialMark, ani_image) "
				+ "values(aniseq.nextval,?,?,?,?,?,?,?,?,?,?,?)"; 
		try {
				ps = conn.prepareStatement(sql);
				if(ps != null) {
				
				ps.setString(1, mr.getParameter("bgnde"));
				//System.out.println("1 bgnde");
				ps.setString(2, mr.getParameter("state"));
				//System.out.println("2 state");
				ps.setString(3, mr.getParameter("upkind"));
				//System.out.println("3 upkind");
				ps.setString(4, mr.getParameter("happenPlace"));
				//System.out.println("4 happenPlace");
				ps.setString(5, mr.getParameter("happenPlace_sub"));
				//System.out.println("5 happenPlace_sub");
				ps.setString(6, mr.getParameter("kindCd"));
				//System.out.println("6 kindCd");
				ps.setString(7, mr.getParameter("colorCd"));
				//System.out.println("7 colorCd");
				ps.setString(8, mr.getParameter("sexCd"));
				//System.out.println("8 sexCd");
				ps.setString(9, mr.getParameter("neuter_yn"));
				//System.out.println("9 neuter_yn");
				ps.setString(10, mr.getParameter("specialMark"));
				//System.out.println("10 specialMark");
				ps.setString(11, mr.getParameter("ani_image"));
				System.out.println("11 ani_image");
				/*
				System.out.println("AniDAO bgnde : " + mr.getParameter("bgnde"));
				System.out.println("AniDAO state : " + mr.getParameter("state"));
				System.out.println("AniDAO upkind : " + mr.getParameter("upkind"));
				System.out.println("AniDAO happenPlace : " + mr.getParameter("happenPlace"));
				System.out.println("AniDAO happenPlace_sub : " + mr.getParameter("happenPlace_sub"));
				System.out.println("AniDAO kindCd : " + mr.getParameter("kindCd"));
				System.out.println("AniDAO colorCd : " + mr.getParameter("colorCd"));
				System.out.println("AniDAO sexCd : " + mr.getParameter("sexCd"));
				System.out.println("AniDAO neuter_yn : " + mr.getParameter("neuter_yn"));
				System.out.println("AniDAO specialMark : " + mr.getParameter("specialMark"));
				*/
				System.out.println("AniDAO ani_image : " + mr.getParameter("ani_image"));
				
				cnt = ps.executeUpdate();
			}//if - ps != null
		} catch (SQLException e) {
			System.out.println("AniDAO insertAbandAni : ps null");
		}finally {
			try {
				if (ps != null)
					ps.close();

				if (rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println("AniDAO insertAbandAni : 연결 해제 에러");
			}
		} // finally
		
		return cnt;
		
	}//insertAbandAni
	
	public int updateAni(AniBean ani) {
		int cnt = -1;
		//System.out.println(care_reg_no + " / " + bgnde + " / " + upkind + " / " + care_reg_no + " / " + happenPlace  + " / " + happenPlace_sub  + " / " + sexcd);
		String sql = "update abandani set care_reg_no=?, happenPlace=?, happenPlace_sub=?, sexcd=? where no=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ani.getCare_reg_no());
			ps.setString(2, ani.getHappenPlace());
			ps.setString(3, ani.getHappenPlace_sub());
			ps.setString(4, ani.getSexCd());
			ps.setInt(5, ani.getNo());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
					
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}// updateAni
	
}//AniDAO
