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


   public QnaDTO() {}
   public QnaDTO(int qna_seq, String qna_title, String qna_writer, String qna_contents, Timestamp qna_write_date,
         int qna_view_count, String qna_nickname) {
      super();
      this.qna_seq = qna_seq;
      this.qna_title = qna_title;
      this.qna_writer = qna_writer;
      this.qna_contents = qna_contents;
      this.qna_write_date = qna_write_date;
      this.qna_view_count = qna_view_count;
      this.qna_nickname = qna_nickname;
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
   public String getFormedDate() {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
      return sdf.format(this.qna_write_date);
   }

}