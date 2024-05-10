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
	
	// 글의 개수 구하기
			public int getListCount() {
				int x = 0;

				try {
					pstmt = con.prepareStatement("select count(*) from board");
					rs = pstmt.executeQuery();

					if (rs.next()) {
						x = rs.getInt(1);
					}
				} catch (Exception ex) {
					System.out.println("getListCount 에러: " + ex);
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
				}
				return x;
			}

	// 글 목록보기
			public List getBoardList(int page, int limit) {
				String board_list_sql = "select * from " + "(select row_number() over() rnum,BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"
						+ "BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,"
						+ "BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE from "
						+ "(select * from board order by BOARD_RE_REF desc,BOARD_RE_SEQ asc) AS s)AS u " + "where rnum>=? and rnum<=?";		// 오라클->코끼리 서브쿼리 부분에 별칭 추가

				List list = new ArrayList();

				int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row번호
				int endrow = startrow + limit - 1; // 읽기 마지막 row번호.
				try {
					pstmt = con.prepareStatement(board_list_sql);
					pstmt.setInt(1, startrow);
					pstmt.setInt(2, endrow);
					rs = pstmt.executeQuery();

					while (rs.next()) {
						BoardBean board = new BoardBean();
						board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
						board.setBOARD_NAME(rs.getString("BOARD_NAME"));
						board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
						board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
						board.setBOARD_FILE(rs.getString("BOARD_FILE"));
						board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
						board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
						board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
						board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
						board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
						list.add(board);
					}

					return list;
				} catch (Exception ex) {
					System.out.println("getBoardList 에러 : " + ex);
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
				}
				return list;			
			}
			
			//글 등록

			public boolean boardInsert(BoardBean board) {
				int num = 0;
				String sql = "";
				int result = 0;
			try {
				pstmt = con.prepareStatement("Select max(board_num) from board");
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					num = rs.getInt(1)+1;
				} else {
					num =1;
				}
				
				sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
				sql+="BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"+
					"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+
					"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, board.getBOARD_NAME());
				pstmt.setString(3, board.getBOARD_NAME());
				pstmt.setString(4, board.getBOARD_NAME());
				pstmt.setString(5, board.getBOARD_NAME());
				pstmt.setString(6, board.getBOARD_NAME());
				pstmt.setInt(7, num);
				pstmt.setInt(8, 0);
				pstmt.setInt(9, 0);
				pstmt.setInt(10, 0);
				
				result = pstmt.executeUpdate();
				if(result == 0) return false;
				
				return true;
			} catch(Exception ex) {
				System.out.println("boardInsert 에러 : "+ex);
			} finally {
				if(rs!=null) try {rs.close();} catch (SQLException ex) {}
				if(pstmt!=null) try {pstmt.close();} catch (SQLException ex) {}
			}
			return false;
			}
			
			
			
			
			
			
			
			
			
			}
			
			
			
			
			
			
			
			
			
}
