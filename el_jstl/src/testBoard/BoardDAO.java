package testBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {

	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp", pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	// 생산자
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<BoardDTO> list(int st,int end){
		//String sql = "select * from paging ORDER BY num desc";
		String sql = 
		"select B.*"+ 
		" from(select rownum rn, A.*"+
		     " from( select * from paging order by num desc)A"+
		     ") B where rn between ? and ?";
		
		ArrayList<BoardDTO> listDto = new ArrayList<BoardDTO>();
		

		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);

			ps.setInt(1, st);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto =new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPdate(rs.getString("pdate"));
				dto.setCount(rs.getInt("count"));
				listDto.add(dto);
				
			}	
			
		} catch (SQLException e) {
			System.out.println("");
			e.printStackTrace();
		}
		

		return listDto;
		
	}
	
	
	public void insert(BoardDTO dto) {
		String sql = "insert into paging(num,title,pdate,count)"+
					"values(test_num.nextval,?,sysdate,0)";
			try {
				
				con = DriverManager.getConnection(url,user,pwd);
				ps = con.prepareStatement(sql);

				ps.setString(1, dto.getTitle());
				ps.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("insert()오류");
				e.printStackTrace();
			}
		
	}
	
	
	public void count(String num) {
		String sql = "update paging set count=count+1 where num="+num;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("count()메소드");
		}
	}
	
	
	public int getTotalPage() {
		String sql = "select count(*) from paging";
		int totPage = 0;
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			//만약 결과가 존재하면 첫번째 컬럼, 즉 게시글 번호를 가져온다.(게시글 갯수이므로)
			if(rs.next()) totPage = rs.getInt(1);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("getTotalPage");
		}
		
		
		return totPage;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
