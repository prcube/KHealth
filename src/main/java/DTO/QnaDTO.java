package DTO;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class QnaDTO {
   private int qna_seq;
   private String qna_title;
   private String qna_writer;
   private String qna_contents;
   private Timestamp qna_write_date;
   private int qna_view_count;
   private String qna_nickname;
   private int rn;
   private int qna_thumbsup;
   private int numberOfComment;
   


   public QnaDTO() {}
   public QnaDTO(int qna_seq, String qna_title, String qna_writer, String qna_contents, Timestamp qna_write_date,
         int qna_view_count, String qna_nickname, int rn,int qna_thumbsup ,int numberOfComment) {
      super();
      this.qna_seq = qna_seq;
      this.qna_title = qna_title;
      this.qna_writer = qna_writer;
      this.qna_contents = qna_contents;
      this.qna_write_date = qna_write_date;
      this.qna_view_count = qna_view_count;
      this.qna_nickname = qna_nickname;
      this.rn = rn;
      this.qna_thumbsup = qna_thumbsup;
      this.numberOfComment = numberOfComment;
   }
   public int getQna_seq() {
      return qna_seq;
   }
   public void setQna_seq(int qna_seq) {
      this.qna_seq = qna_seq;
   }
   public String getQna_title() {
      return qna_title;
   }
   public void setQna_title(String qna_title) {
      this.qna_title = qna_title;
   }
   public String getQna_writer() {
      return qna_writer;
   }
   public void setQna_writer(String qna_writer) {
      this.qna_writer = qna_writer;
   }
   public String getQna_contents() {
      return qna_contents;
   }
   public void setQna_contents(String qna_contents) {
      this.qna_contents = qna_contents;
   }
   public Timestamp getQna_write_date() {
      return qna_write_date;
   }
   public void setQna_write_date(Timestamp qna_write_date) {
      this.qna_write_date = qna_write_date;
   }
   public int getQna_view_count() {
      return qna_view_count;
   }
   public void setQna_view_count(int qna_view_count) {
      this.qna_view_count = qna_view_count;
   }
   public String getQna_nickname() {
      return qna_nickname;
   }
   public void setQna_nickname(String qna_nickname) {
      this.qna_nickname = qna_nickname;
   }
   public int getRn() {
	   return rn;
   }
   public void setRn(int rn) {
	   this.rn =rn;
   }
   public int getQna_thumbsup() {
	   return qna_thumbsup;
   }
   public void setQna_thumbsup(int qna_thumbsup) {
	   this.qna_thumbsup = qna_thumbsup;
   }
   public int getNumberOfComment() {
	   return numberOfComment;
   }
   public void setNumberOfComment(int numberOfComment) {
	   this.numberOfComment = numberOfComment;
   }
   
   public String getFormedDate() {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
      long qna_writer_date = this.qna_write_date.getTime();
      long current_date = System.currentTimeMillis();
      
      long gapTime = (current_date - qna_writer_date)/1000;
      
      if(gapTime < 60) {
			return "방금 전";
		}else if(gapTime < 300) {
			return "5분 전";
		}else if(gapTime < 360) {
			return "6분 전";
		}else if(gapTime < 420) {
			return "7분 전";
		}else if(gapTime < 480) {
			return "8분 전";
		}else if(gapTime < 540) {
			return "9분 전";
		}else if(gapTime < 600) {
			return "10분 전";
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
			return sdf.format(this.qna_write_date);
		}
     
   }

}