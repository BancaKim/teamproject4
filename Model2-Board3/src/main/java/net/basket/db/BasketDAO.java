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
	
	public BasketDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			con = ds.getConnection();
		} catch(Exception ex) {
			System.out.println("DB 연결 실패 : "+ex);
			return;
		}
	}
			
}
