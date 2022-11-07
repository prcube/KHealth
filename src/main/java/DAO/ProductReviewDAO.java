package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.ProductReviewDTO;

public class ProductReviewDAO {

	private static ProductReviewDAO instance = null;
	
	public static ProductReviewDAO getInstance() throws Exception{
		if(instance == null) {
			instance = new ProductReviewDAO();
		}
		return instance;
	}
	
	private ProductReviewDAO() {}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int write(ProductReviewDTO dto)throws Exception{
		String sql = "insert into product_review values(product_seq.nextval,?,?,?,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getPr_seq());
			pstat.setInt(2, dto.getPr_productseq());
			pstat.setString(3, dto.getPr_contents());
			pstat.setString(4, dto.getPr_writer());
			pstat.setString(5, dto.getPr_id());
			
			int result = pstat.executeUpdate();
			con.commit();
			con.close();
			return result;
		}
	}
	
	public List<ProductReviewDTO>selectAll(int pr_seq) throws Exception{
		String sql = "select * from product_review where product_seq =? order by productReview_seq";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, pr_seq);
			ResultSet rs = pstat.executeQuery();
			List<ProductReviewDTO>list = new ArrayList<>();
			while(rs.next()) {
				ProductReviewDTO dto = new ProductReviewDTO();
				dto.setPr_seq(rs.getInt("product_seq"));
				dto.setPr_productseq(rs.getInt("productReview_seq"));
				dto.setPr_contents(rs.getString("productReview_contents"));
				dto.setPr_writer(rs.getString("productReview_writerChracter"));
				dto.setPr_id(rs.getString("productReview_writerId"));
				
				list.add(dto);
			}
			return list;
		}
		
	}

}
