package DTO;

import java.sql.Timestamp;

public class QnaCommentsDTO {

	private int qnaCms_seq;
	private int qnaCms_parent_seq;
	private String qnaCms_writer;
	private String qnaCms_contents;
	private String qnaCms_nincname;
	private Timestamp qnaCms_write_date;
	
	
	
	
	
	public QnaCommentsDTO() {}
	public QnaCommentsDTO(int qnaCms_seq, int qnaCms_parent_seq, String qnaCms_writer, String qnaCms_contents,
			String qnaCms_nincname, Timestamp qnaCms_write_date) {
		
		this.qnaCms_seq = qnaCms_seq;
		this.qnaCms_parent_seq = qnaCms_parent_seq;
		this.qnaCms_writer = qnaCms_writer;
		this.qnaCms_contents = qnaCms_contents;
		this.qnaCms_nincname = qnaCms_nincname;
		this.qnaCms_write_date = qnaCms_write_date;
	}
	public int getQnaCms_seq() {
		return qnaCms_seq;
	}
	public void setQnaCms_seq(int qnaCms_seq) {
		this.qnaCms_seq = qnaCms_seq;
	}
	public int getQnaCms_parent_seq() {
		return qnaCms_parent_seq;
	}
	public void setQnaCms_parent_seq(int qnaCms_parent_seq) {
		this.qnaCms_parent_seq = qnaCms_parent_seq;
	}
	public String getQnaCms_writer() {
		return qnaCms_writer;
	}
	public void setQnaCms_writer(String qnaCms_writer) {
		this.qnaCms_writer = qnaCms_writer;
	}
	public String getQnaCms_contents() {
		return qnaCms_contents;
	}
	public void setQnaCms_contents(String qnaCms_contents) {
		this.qnaCms_contents = qnaCms_contents;
	}
	public String getQnaCms_nincname() {
		return qnaCms_nincname;
	}
	public void setQnaCms_nincname(String qnaCms_nincname) {
		this.qnaCms_nincname = qnaCms_nincname;
	}
	public Timestamp getQnaCms_write_date() {
		return qnaCms_write_date;
	}
	public void setQnaCms_write_date(Timestamp qnaCms_write_date) {
		this.qnaCms_write_date = qnaCms_write_date;
	}
	
	
	
	
	
	
	

}
