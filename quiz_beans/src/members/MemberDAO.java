package members;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp", pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	// 생산자
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	// 아이디 없으면 -1, 비번 틀리면 0, 로그인 성공시 1 리턴
	public int idPwChk(String id, String pw) {
		int chk = 0;
		try {

			String sql = "SELECT * FROM members WHERE id=?";

			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			// id가 존재하면
			if (rs.next()) {
				// 비번이 같은지 확인
				if (rs.getString("pwd").equals(pw)) {
					chk = 1; // 비번 맞으면
				} else {
					chk = 0;
				} // 비번 틀리면

			} else { // id없으면
				chk = -1;
			}

		} catch (SQLException e) {
			System.out.println("아이디 비번 존재여부 확인 에러");
			e.printStackTrace();
		}

		return chk;
	}

	public ArrayList<MemberDTO> getMemberList() {
		ArrayList<MemberDTO> list = new ArrayList<>();

		try {

			String sql = "SELECT * FROM members";
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				MemberDTO m = new MemberDTO();
				m.setId(rs.getString("id"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setAddr(rs.getString("addr"));
				m.setTel(rs.getString("tel"));

				list.add(m);
			}

		} catch (SQLException e) {
			System.out.println("getMemberList 오류");
			e.printStackTrace();
		}

		return list;

	}

	// 회원 한명 반환
	public MemberDTO getAMember(String id) {
		MemberDTO m = new MemberDTO();

		String sql = "SELECT * FROM members WHERE id=?";

		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();

			while (rs.next()) {
				m.setId(rs.getString("id"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setAddr(rs.getString("addr"));
				m.setTel(rs.getString("tel"));
			}

		} catch (SQLException e) {
			System.out.println("getAMember() 오류");
			e.printStackTrace();
		}

		return m;
	}

	// 회원가입
	public void registerMember(MemberDTO mem) {

		try {

			String sql = "INSERT INTO members VALUES(?,?,?,?,?)";
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			
			ps.setString(1, mem.getId());
			ps.setString(2, mem.getPwd());
			ps.setString(3, mem.getName());
			ps.setString(4, mem.getAddr());
			ps.setString(5, mem.getTel());
			
			ps.executeUpdate();



		} catch (SQLException e) {
			System.out.println("getMemberList 오류");
			e.printStackTrace();
		}

	}

	// 수정
	public void updateMember(MemberDTO mem) {
		String sql = "UPDATE members SET name=?,"
				+ " addr=?, tel=? where id=?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, mem.getName());
			ps.setString(2, mem.getAddr());
			ps.setString(3, mem.getTel());
			ps.setString(4, mem.getId());
			
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("updateMember 오류");
			e.printStackTrace();
		}
		
	}

	// 삭제
	public void deleteMember(String id) {
		String sql = "DELETE FROM members where id=?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("DeleteMember 오류");
			e.printStackTrace();
		}
		
		
		
	}

}
