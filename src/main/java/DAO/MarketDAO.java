package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MarketDAO {
	private static MarketDAO instance;

	synchronized public static MarketDAO getInstance() throws Exception{

		if (instance == null) {
			instance = new MarketDAO();
		}
		return instance;
	}

	private MarketDAO() {}


	private Connection getConnection() throws Exception{

		// JDNI 기법 적용 
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();


	}


}
