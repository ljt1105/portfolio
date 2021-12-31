package com.traveler.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.traveler.vo.FlightSchedules;

public class TravelerDaoImpl implements TravelerDao {

	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public void dropFlightSchedulesTable() {
		String sql = "DROP TABLE flight_schdules ";

	}

	@Override
	public void createFlightSchedulesTable() {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// 1. 드라이버 로딩 (등록)
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 2. 연결 객체 만들기
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_schedules", "root", "mysql");

			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("테이블 생성 실패");
		} finally {
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
			try {
				conn.close();
			} catch (Exception ex) {
			}
		}

	}

	@Override
	public void insertFlightSchedules(FlightSchedules fs) {
		Connection conn = null; // 연결 객체의 참조를 저장할 변수
		PreparedStatement pstmt = null; // 명령 객체의 참조를 저장할 변수

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_schedules", "root", "mysql"); // 데이터베이스
																													// 사용자
																													// 계정

			String sql = "INSERT INTO Flight_Schedules (DAY, FLIGHT, TIME, DATE_FROM, DATE_TO, AIRLINE, DESTINATION) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?) ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fs.getDay());
			// java.util.Date --> java.sql.Date
			// java.util.Date.getTime() : 1970년 1월 1일 0시 0분 0초로부터 경과된 1/1000 초단위의 경과 값
			pstmt.setString(2, fs.getFlight());
			pstmt.setString(3, fs.getTime());
			pstmt.setDate(4, new java.sql.Date(fs.getDate_from().getTime()));
			pstmt.setDate(5, new java.sql.Date(fs.getDate_to().getTime()));
			pstmt.setString(6, fs.getAirline());
			pstmt.setString(7, fs.getDestination());

			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
			try {
				conn.close();
			} catch (Exception ex) {
			}
		}

	}

	@Override
	public void insertFlightSchedules2(List<FlightSchedules> schedules) {
		Connection conn = null; // 연결 객체의 참조를 저장할 변수
		PreparedStatement pstmt = null; // 명령 객체의 참조를 저장할 변수

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight_schedules", "root", "mysql"); // 데이터베이스
																													// 사용자
																													// 계정

			conn.setAutoCommit(false);

			String sql = "INSERT INTO Flight_Schedules (DAY, FLIGHT, TIME, DATE_FROM, DATE_TO, AIRLINE, DESTINATION) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?) ";

			pstmt = conn.prepareStatement(sql);

			for (FlightSchedules fs : schedules) {
				pstmt.setString(1, fs.getDay());
				// java.util.Date --> java.sql.Date
				// java.util.Date.getTime() : 1970년 1월 1일 0시 0분 0초로부터 경과된 1/1000 초단위의 경과 값
				pstmt.setString(2, fs.getFlight());
				pstmt.setString(3, fs.getTime());
				pstmt.setDate(4, new java.sql.Date(fs.getDate_from().getTime()));
				pstmt.setDate(5, new java.sql.Date(fs.getDate_to().getTime()));
				pstmt.setString(6, fs.getAirline());
				pstmt.setString(7, fs.getDestination());

				pstmt.addBatch();
			}

			pstmt.executeBatch(); // 일괄 처리 -> 한 번에 여러 개를 insert

			conn.commit();
			conn.setAutoCommit(true);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
			try {
				conn.close();
			} catch (Exception ex) {
			}
		}

	}


	

	/*public int[] selectStatsBySection(int months, int range) {

		Connection conn = null; // 연결 객체의 참조를 저장할 변수
		PreparedStatement pstmt = null; // 명령 객체의 참조를 저장할 변수
		ResultSet rs = null; // 조회 결과의 참조를 저장할 변수
		int[] countBySection = new int[(int) Math.ceil(45. / range)]; // 번호별 당첨 횟수를 저장할 배열

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/demoweb", // 사용할 데이터베이스 연결 정보
					"kdigital", "mysql"); // 데이터베이스 사용자 계정

			String[] columns = { "NO1", "NO2", "NO3", "NO4", "NO5", "NO6", "BNO" };
			for (int no = 0; no < (int) Math.ceil(45. / range); no++) {

				int count = 0;
				for (int i = 0; i < columns.length; i++) {
					String sql = "SELECT COUNT(*) " + "FROM WINNING_NUMBERS " + String.format(
							"WHERE (RND > (SELECT COUNT(RND) - ? FROM WINNING_NUMBERS)) AND (%s BETWEEN ? AND ?)",
							columns[i]);
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, weeks);
					pstmt.setInt(2, no * range + 1);
					pstmt.setInt(3, no * range + range);
					rs = pstmt.executeQuery();
					rs.next();// 무조건 결과가 1개 있는 조회이기 때문에 if 또는 while 을 사용하지 않았습니다
					count += rs.getInt(1);

					rs.close();
					pstmt.close();
				}
				countBySection[no] = count;

			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (Exception ex) {
			}
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
			try {
				conn.close();
			} catch (Exception ex) {
			}
		}

		return countBySection;
	}*/

}
