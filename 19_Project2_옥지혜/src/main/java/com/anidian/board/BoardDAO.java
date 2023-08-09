package com.anidian.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class BoardDAO {

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private static BoardDAO bdao;

	private BoardDAO() {
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

	public static BoardDAO getInstance() {
		if (bdao == null)
			bdao = new BoardDAO();
		return bdao;
	}// DBCP
	
	public ArrayList<BoardBean> getArticles(int startRow, int pageSize) {

		// 1. ArrayList 객체 생성
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		String sql = "select board_no, userId, userPw, subject, reg_date, readcount, ref, step, depth, content ";
		sql += "from (select rownum as rank, board_no, userId, userPw, subject, reg_date, readcount, ref, step, depth, content ";
		sql += "from (select board_no, userId, userPw, subject, reg_date, readcount, ref, step, depth, content ";
		sql += "from board_ani ";
		sql += "order by ref desc, reg_date desc, step asc )) ";
		sql += "where rank between ? and ? ";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while (rs.next()) {
				
				int board_no = rs.getInt("board_no");
				String userId = rs.getString("userId");
				String userPw = rs.getString("userPw");
				String subject = rs.getString("subject");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");

				BoardBean bb = new BoardBean();
				bb.setBoard_no(board_no);
				bb.setUserId(userId);
				bb.setUserPw(userPw);
				bb.setSubject(subject);
				bb.setReg_date(reg_date);
				bb.setReadcount(readcount);
				bb.setRef(ref);
				bb.setStep(step);
				bb.setDepth(depth);
				bb.setContent(content);

				lists.add(bb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("BoardDAO getArticles SQL에러");
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
		return lists;
	}// getArticles

	public ArrayList<BoardBean> getArticlesTop() {

		// 1. ArrayList 객체 생성
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		String sql = "select board_no, userId, userPw, subject, reg_date, readcount, ref, step, depth, content ";
		sql += "from (select rownum as rank, board_no, userId, userPw, subject, reg_date, readcount, ref, step, depth, content ";
		sql += "from (select board_no, userId, userPw, subject, reg_date, readcount, ref, step, depth, content ";
		sql += "from board_ani ";
		sql += "order by readcount desc )) ";
		sql += "where rank between 1 and 5 ";
		sql += "order by readcount desc ";
		// Ton N절 구문
		try {
			ps = conn.prepareStatement(sql);
			//ps.setInt(1, start);
			//ps.setInt(2, end);
			rs = ps.executeQuery();
			while (rs.next()) {
				
				int board_no = rs.getInt("board_no");
				String userId = rs.getString("userId");
				String userPw = rs.getString("userPw");
				String subject = rs.getString("subject");
				Timestamp reg_date = rs.getTimestamp("reg_date");// Timestamp!
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				String content = rs.getString("content");

				BoardBean bb = new BoardBean();
				bb.setBoard_no(board_no);
				bb.setUserId(userId);
				bb.setUserPw(userPw);
				bb.setSubject(subject);
				bb.setReg_date(reg_date);
				bb.setReadcount(readcount);
				bb.setRef(ref);
				bb.setStep(step);
				bb.setDepth(depth);
				bb.setContent(content);

				lists.add(bb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("BoardDAO getArticlesTop SQL에러");
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
		return lists;
	}// getArticlesTop
	
	public int getArticleCount() {
		int count = -1;
		String sql = "select count(*) as cnt from board_ani";// 레코드갯수 구하기
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				// count = rs.getInt("count(*)"); //별칭지정X
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

	}// getArticleCount

	public int getArticleCountByDate() {
		int count = -1;
		String sql = "select count(*) as cnt from board_ani where reg_date=to_char(sysdate,'yy-mm-dd')";// 레코드갯수 구하기
		//elect count(*) as cnt from abandAni where bgnde=to_char(sysdate,'yy-mm-dd');
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				// count = rs.getInt("count(*)"); //별칭지정X
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

	}// getArticleCountByDate
	
	
	//insertBoard_Proc.jsp
	public int insertArticle(BoardBean bb) {
		int cnt = -1;
		String sql1 = "select userPw from users where userId =?";
		
		String sql2 = "insert into board_ani(board_no,userId,userPw,subject,reg_date,readcount,ref,step,depth,content) "
				+ "values(board_seq.nextval,?,?,?,sysdate,?,?,?,?,?)";
	
		try {
			ps = conn.prepareStatement(sql1);
			ps.setString(1, bb.getUserId());
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String dbpw = rs.getString("userPw");
				if(dbpw.equals(bb.getUserPw())){//사용자가 입력한 비밀번호가 db에 있는 비밀번호와 일치
					ps = conn.prepareStatement(sql2);
					ps.setString(1, bb.getUserId());
					ps.setString(2, bb.getUserPw());
					ps.setString(3, bb.getSubject());
					ps.setInt(4, bb.getReadcount());
					ps.setInt(5, bb.getRef());
					ps.setInt(6, 0);//step : 원글은 무조건 0
					ps.setInt(7, 0);//depths : 답글, 원글은 답글이 아니니까 0
					ps.setString(8, bb.getContent());
					System.out.println("insertArticle ps 1~7");
					
					cnt = ps.executeUpdate();
					
					cnt = ps.executeUpdate();
				}//if(dbpw.equals(bb.getUserPw()))
			}//if
			
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

		return cnt;

	}// insertArticle

	public BoardBean getArticleByBoard_No(String paramNo) {
		String sql2 = "update board_ani set readcount = readcount+1 where board_no=?";

		BoardBean bb = new BoardBean();
		String sql = "select * from board_ani where board_no=?";
		try {

			ps = conn.prepareStatement(sql2);
			ps.setString(1, paramNo);
			ps.executeUpdate();

			ps = conn.prepareStatement(sql);
			ps.setString(1, paramNo);
			rs = ps.executeQuery();
			if (rs.next()) {
		
				bb.setBoard_no(rs.getInt("board_no"));
				bb.setUserId(rs.getString("userId"));
				bb.setUserPw(rs.getString("userPw"));
				bb.setSubject(rs.getString("subject"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setStep(rs.getInt("step"));
				bb.setDepth(rs.getInt("depth"));
				bb.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bb;
	}// getArticleByBoard_No

	//updateBoard
	public BoardBean getContentByBoardNo(String paramNum) {
		BoardBean bb = new BoardBean();
		String sql = "select * from board_ani where board_no=?";
		try {

			ps = conn.prepareStatement(sql);
			ps.setString(1, paramNum);
			rs = ps.executeQuery();
			if (rs.next()) {
				bb.setBoard_no(rs.getInt("board_no"));
				bb.setUserId(rs.getString("userId"));
				bb.setUserPw(rs.getString("userPw"));
				bb.setSubject(rs.getString("subject"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setStep(rs.getInt("step"));
				bb.setDepth(rs.getInt("depth"));
				bb.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bb;
	}// getContentByNum
	

	public int updateBoard(BoardBean bb) {
	
	 //사용자가 기존에 입력했던 비밀번호와 동일하지 않으면 update할 수 없게 처리. 
	 
		int cnt = -1;
		
		String sql1 = "select userPw from board_ani where board_no=?";//updateForm에서 입력한 비밀번호와 동일한지 확인.
		String sql2 = "update board_ani set subject=?, content=? where board_no=?";
		//userPw=? -> 비밀번호는 수정대상X, 본인확인용도
		try {
			ps = conn.prepareStatement(sql1);
			ps.setInt(1, bb.getBoard_no());
			rs = ps.executeQuery();
			
			if (rs.next()) {
				String dbpw = rs.getString("userPw");
				if(dbpw.equals(bb.getUserPw())){//사용자가 입력한 비밀번호가 db에 있는 비밀번호와 일치
					ps = conn.prepareStatement(sql2);
					ps.setString(1, bb.getSubject());
					ps.setString(2, bb.getContent());
					ps.setInt(3, bb.getBoard_no());
					
					cnt = ps.executeUpdate();
				}//if(dbpw.equals(bb.getUserPw()))
			}//if
			
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
	}// updateArticle
	
	/*
	public int deleteArticle(String num, String passwd) {
		int cnt = -1;
		String sql1 = "select passwd from board where num=?";
		String sql2 = "delete from board where num=?";
		try {
			ps = conn.prepareStatement(sql1);
			ps.setString(1, num);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbpw = rs.getString("passwd");
				if(dbpw.equals(passwd)){//사용자가 입력한 비밀번호가 db에 있는 비밀번호와 일치
					ps = conn.prepareStatement(sql2);
					ps.setString(1, num);
					cnt = ps.executeUpdate();
				}else {//사용자가 입력한 비밀번호가 db에 있는 비밀번호와 불일치
					
				}
			}//if
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
		
	}//deleteArticle
	
	public int replyArticle(BoardBean bb){
		//10개의 정보가 넘어옴
		//7가지 답글
		//3가지 부모정보(ref,re_step,re_level)
		
		// 기존에 있던 것들 먼저 update
		//처리 후 insert
		
		int re_step,re_level,cnt = -1;
		
		String sql = "update board set re_step=re_step+1 where ref=? and re_step>?";
		String sql2 = "insert into board(num,writer,subject,email,content,passwd,reg_date,ref,re_step,re_level,ip) "
				+ "values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			// 동일한 ref를 갖는 레코드 중 부모글의 re_step 보다 큰 레코드는 re_step을 1씩 증가(답변글의 최신순 정렬에 사용)

			ps = conn.prepareStatement(sql);
			ps.setInt(1, bb.getRef());
			ps.setInt(2, bb.getRe_step());
			ps.executeUpdate();
			
			re_step = bb.getRe_step() + 1;
			re_level = bb.getRe_level() + 1;

			// 부모의 ref와 동일한 값을 갖고, step 및 re_level은 1씩 큰 값을 데이터베이스에 입력

			ps = conn.prepareStatement(sql2);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getEmail());
			ps.setString(4, bb.getContent());
			ps.setString(5, bb.getPasswd());
			ps.setTimestamp(6, bb.getReg_date());
			ps.setInt(7, bb.getRef()); //ref : 그룹
			ps.setInt(8, re_step); //re_step : 순번
			ps.setInt(9, re_level); //re_level : 답글 들여쓰기 정도
			ps.setString(10, bb.getIp());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null)
					ps.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
		
	}//replyArticle
	*/
	
}//BoardDAO
