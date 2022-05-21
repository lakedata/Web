//LectureBean.java
package jspbook.pr35;

public class LectureBean {

   static final String[] typeNames = {"�����ʼ�", "��������", "����", "��������"};
   static final String[] titleNames = {"�����α׷���", "�ü��", "����Ʈ�������α׷���", "�����ͺ��̽�����", "�ڷᱸ��", "��Ʈ��ũ", "â�ǿͰ���", "��ȸ����"};
   static final String[] dayNames = {"��", "ȭ", "��", "��", "��"};
   private int type;
   private int title;
   private int day;
   private int time;
   private int consecutive;
   
   public LectureBean () {
      type = -1;
      title = -1;
      day = -1;
      time = -1;
      consecutive = -1;
   }
   
   public int getType() {
      return type;
   }
   public void setType(int type) {
      this.type = type;
   }
   
   public int getTitle() {
      return title;
   }
   public void setTitle(int title) {
      this.title = title;
   }
   
   public int getDay() {
      return day;
   }
   public void setDay(int day) {
      this.day = day;
   }
   
   public int getTime() {
      return time;
   }
   public void setTime(int time) {
      this.time = time;
   }
   
   public int getConsecutive() {
      return consecutive;
   }
   public void setConsecutive(int consecutive) {
      this.consecutive = consecutive;
   }
   
   public String toString() {
      return typeNames[getType()] + "/" + titleNames[getTitle()] + "/" + dayNames[getDay()] + "/" + 
            getTime() + "/" + getConsecutive() + "<br>";
   }
}