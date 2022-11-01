package TIPSDTO;

import java.sql.Timestamp;

public class TipsDTO {
	private int tips_seq;
	private String tips_title;
	private String tips_writer;
	private String tips_contents;
	private Timestamp tips_write_date;
	private int tips_view_count;
	private String tips_nickname;
	
	public TipsDTO () {}
		
	public TipsDTO(int tips_seq, String tips_title, String tips_writer, String tips_contents, Timestamp tips_write_date,
			int tips_view_count, String tips_nickname) {
		super();
		this.tips_seq = tips_seq;
		this.tips_title = tips_title;
		this.tips_writer = tips_writer;
		this.tips_contents = tips_contents;
		this.tips_write_date = tips_write_date;
		this.tips_view_count = tips_view_count;
		this.tips_nickname = tips_nickname;
	}
	public int getTips_seq() {
		return tips_seq;
	}
	public void setTips_seq(int tips_seq) {
		this.tips_seq = tips_seq;
	}
	public String getTips_title() {
		return tips_title;
	}
	public void setTips_title(String tips_title) {
		this.tips_title = tips_title;
	}
	public String getTips_writer() {
		return tips_writer;
	}
	public void setTips_writer(String tips_writer) {
		this.tips_writer = tips_writer;
	}
	public String getTips_contents() {
		return tips_contents;
	}
	public void setTips_contents(String tips_contents) {
		this.tips_contents = tips_contents;
	}
	public Timestamp getTips_write_date() {
		return tips_write_date;
	}
	public void setTips_write_date(Timestamp tips_write_date) {
		this.tips_write_date = tips_write_date;
	}
	public int getTips_view_count() {
		return tips_view_count;
	}
	public void setTips_view_count(int tips_view_count) {
		this.tips_view_count = tips_view_count;
	}
	public String getTips_nickname() {
		return tips_nickname;
	}
	public void setTips_nickname(String tips_nickname) {
		this.tips_nickname = tips_nickname;
	}
	
	
	

}
