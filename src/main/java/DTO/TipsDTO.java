package DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class TipsDTO {
	private int tips_seq;
	private String tips_title;
	private String tips_writer;
	private String tips_contents;
	private Timestamp tips_write_date;
	private int tips_view_count;
	private String tips_nickname;
	private int rn;
	private String tips_bullet;
	
	
	public TipsDTO () {}

	
	
	   public TipsDTO(int tips_seq, String tips_title, String tips_writer, String tips_contents, Timestamp tips_write_date,
			int tips_view_count, String tips_nickname, int rn, String tips_bullet) {
		super();
		this.tips_seq = tips_seq;
		this.tips_title = tips_title;
		this.tips_writer = tips_writer;
		this.tips_contents = tips_contents;
		this.tips_write_date = tips_write_date;
		this.tips_view_count = tips_view_count;
		this.tips_nickname = tips_nickname;
		this.rn = rn;
		this.tips_bullet = tips_bullet;
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


	public int getRn() {
		return rn;
	}


	public void setRn(int rn) {
		this.rn = rn;
	}


	public String getTips_bullet() {
		return tips_bullet;
	}


	public void setTips_bullet(String tips_bullet) {
		this.tips_bullet = tips_bullet;
	}


	public String getFormedDate() {
		      SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		      long qna_writer_date = this.tips_write_date.getTime();
		      long current_date = System.currentTimeMillis();
		      
		      long gapTime = (current_date - qna_writer_date)/1000;
		      
		      if(gapTime < 60) {
					return "방금 전";
				}else if(gapTime < 300) {
					return "5분 전";
				}else if(gapTime < 3600) {
					return "1시간 전";
				}else if(gapTime < 7200) {
					return "2시간 전";
				}else if(gapTime < 10800) {
					return "3시간 전";
				}else if(gapTime < 14400) {
					return "4시간 전";
				}else if(gapTime < 18000) {
					return "5시간 전";
				
				}else if(gapTime < 86400) {
					
					return "하루 전";
				}else {
					return sdf.format(this.tips_write_date);
				}
		     
		   }

}
