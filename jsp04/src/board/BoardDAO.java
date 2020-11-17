package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	private String url="jdbc:oracle:thin:@localhost:1521:xe";
	private String user="jsp", pwd="1234";
	private Connection con;
	private ResultSet rs;
	private PreparedStatement ps;
	
	
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
	}
	
	
	public ArrayList<BoardDTO> list(){
		//String sql = "select * from test_board order by id desc";
		String sql =
		"select * from test_board order by idgroup desc, step asc";
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				list.add(dto);
			
			}
		} catch (SQLException e) {
			System.out.println("list 메소드 에러");
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
	public void write_save(String name, String title, String content) {
		
		String sql = 
				"insert into test_board"
				+ "(id, name, title, content, idgroup, step, indent)"
				+ "values(test_board_seq.nextval, ?, ?, ?, "
						+ "test_board_seq.currval,0,0)";
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("write_save 메소드 에러");
			e.printStackTrace();
		}
		
		
	}
	
	private void upHit(String id) {
		String sql = "update test_board set hit=hit+1 where id=?";
	
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	//게시글 정보 반환 메소드
	public BoardDTO contentView(String id) {
		
		//조회수 올리는 메소드
		upHit(id);
	
		String sql = "select * from test_board where id=?";
		BoardDTO dto = new BoardDTO();
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()){
				dto.setId(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				
				dto.setSavedate(rs.getTimestamp("savedate"));	
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return dto;
	}


	public void modify(BoardDTO dto) {
		String sql = "update test_board set "
					+ "name=?,title=?,content=? where id=?";
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getId());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("modify메소드 오류 발생!");
		}
			
		
	}
	
	
	public void delete(String id) {
		
		String sql = "delete from test_board where id="+id;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public BoardDTO reply_view(String id) {
		String sql = "select * from test_board where id="+id;
		BoardDTO dto = new BoardDTO();
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				
				dto.setSavedate(rs.getTimestamp("savedate"));	
				
			}
			
		} catch (SQLException e) {
			System.out.println("reply_view메소드 오류발생");
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	
	
	public void reply(BoardDTO dto) {
		
		replyShape(dto);//스탭들을 결정시켜줄거임.
		
		//write_save메소드 그대로 복붙하고 조금 수정
		String sql = 
				"insert into test_board"
				+ "(id, name, title, content, idgroup, step, indent)"
				+ "values(test_board_seq.nextval, ?, ?, ?, ? , ? ,?)";
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getIdgroup());
			ps.setInt(5, dto.getStep()+1);
			ps.setInt(6, dto.getIndent()+1);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("reply 메소드 에러");
			e.printStackTrace();
		}
		
	}


	private void replyShape(BoardDTO dto) {
		String sql = //스탭이 ?보다 크면 +1을 해줘라.
		"update test_board set step=step+1 where idgroup=? and step>?";
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getIdgroup());
			ps.setInt(2, dto.getStep());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("replyShape메소드");
		}
		
	}
	
	
	
	
	
	
	
		
		
}


