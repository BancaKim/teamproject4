package net.basket.db;

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

public class BasketDAO {   //데이터베이스를 처리하는 클래스
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public BasketDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			//con = ds.getConnection();
		} catch(Exception ex) {
			System.out.println("DB 연결 실패 : "+ex);
			return;
		}
	}
		
	public boolean insertItem(String user_id, String item_name, int item_num) {

		int num = 0;
		String sql = "select item_num from basket where user_id=? and item_name=?";
		String sql2="";
		
		System.out.println("insertItem in 1");
		int result = 0;

		try {
			System.out.println("1");
			con = ds.getConnection();
			System.out.println("2");
			pstmt = con.prepareStatement(sql);
			System.out.println("3");
			System.out.println("user_id: "+user_id);
			System.out.println("item_name"+item_name);
			pstmt.setString(1, user_id);
			pstmt.setString(2, item_name);
			rs = pstmt.executeQuery();
			System.out.println("insertItem in 2");
			if (rs.next()) {
				num = rs.getInt(1)+item_num;
				
				sql2 = "UPDATE BASKET SET ITEM_NUM=? WHERE USER_ID=? and ITEM_NAME=?";

				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, num);
				pstmt.setString(2, user_id);
				pstmt.setString(3, item_name);
				result = pstmt.executeUpdate();
				System.out.println("result in"+result);
			}
			else {
				num = item_num;
				sql2 = "INSERT INTO BASKET (USER_ID, ITEM_NAME, ITEM_NUM) VALUES(?,?,?)";
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, user_id);
				pstmt.setString(2, item_name);
				pstmt.setInt(3, num);
				result = pstmt.executeUpdate();	
				System.out.println("result else in:"+result);
			}
		}catch (Exception ex) {
			System.out.println("error : " + ex);
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
		if (result == 0)
			return false;

		return true;
	}

	public int getItem(String user_id, String item_name) {
		int num = 0;
		String sql = "select item_num from basket where user_id=? and item_name=?";

		try {
			System.out.println("1");
			con = ds.getConnection();
			System.out.println("2");
			pstmt = con.prepareStatement(sql);
			System.out.println("3");
			System.out.println("user_id: "+user_id);
			System.out.println("item_name"+item_name);
			pstmt.setString(1, user_id);
			pstmt.setString(2, item_name);
			rs = pstmt.executeQuery();
			System.out.println("insertItem in 2");
			if (rs.next()) {
				num = rs.getInt(1);
			}
			else {
				num = 0;
			}
		}catch (Exception ex) {
			System.out.println("error : " + ex);
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
		return num;
	}
}
