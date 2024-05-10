package net.login.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.board.db.BoardBean;

public class UserDAO {   //데이터베이스를 처리하는 클래스
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	UserBean user;
	
	public UserDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			con = ds.getConnection();
		} catch(Exception ex) {
			System.out.println("DB 연결 실패 : "+ex);
			return;
		}
	}	
	
	public boolean isUser(String user_id, String user_pw) {
		String sql = "SELECT USER_ID, USER_PW FROM USER WHERE USER_ID=? AND USER_PW=?";
		int result = 0;
		try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, user_id);
		pstmt.setString(1, user_pw);

		result = pstmt.executeUpdate();
		
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException ex) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException ex) {
		}
		if(con != null)
			try {
				con.close();
			} catch(SQLException ex) {
				
		}
		}
		if (result != 0) {
		return true;
		} else {
		return false;
		}
	}
	
	public UserBean getUserData(String user_id) {
		String user_sql = "select * from user_id=?"; 
		
		try {
		pstmt = con.prepareStatement(user_sql);
		pstmt.setString(1, user_id);
		rs = pstmt.executeQuery();

			while (rs.next()) {
				user = new UserBean();
				user.setUser_id(rs.getString("user_id"));
				user.setUser_pw(rs.getString("user_pw"));
				user.setEmail(rs.getString("email"));
				user.setUser_name(rs.getString("user_name"));
				user.setSsn(rs.getString("ssn"));
				user.setIntroduction(rs.getString("introduction"));
			}

		} catch (Exception ex) {
			System.out.println("getBoardList  뿉 윭 : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
			}
			if(con != null)
				try {
					con.close();
				} catch(SQLException ex) {
					
			}
		}
		return user; 
	}
	
	
}
