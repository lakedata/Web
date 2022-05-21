//LectureManager.java
package jspbook.pr35;

import java.util.*;

public class LectureManager {
   private static final int times = 6;
   private static final int days = 5;
   private int[][] typeMatrix = new int[times][days];
   private int[][] titleMatrix = new int[times][days];
   private int[][] spanMatrix = new int[times][days];
   public static int i, j;
   
   List<LectureBean> lectureList = new ArrayList<LectureBean>();
   
   public LectureManager() {//초기화
      for(i = 0; i < times; i++)
         for(j = 0; j < days; j++) {
            typeMatrix[i][j] = 0;
            titleMatrix[i][j] = -1;
            spanMatrix[i][j] = 1;
         }
   }
   public List<LectureBean> getLectureList() {
      return lectureList;
   }
   
   public void add(LectureBean lbean) {
      lectureList.add(lbean);
   }
   
   public int getTypeMatrix (int a, int b) {//getter정의
      return typeMatrix[a][b];
   }
   public int getTitleMatrix(int a, int b) {
      return titleMatrix[a][b];
   }
   public int getSpanMatrix(int a, int b) {
      return spanMatrix[a][b];
   }
   
   public void buildMatrix(LectureBean lbean) {//matrix에 정보 저장
      int day = lbean.getDay();
      int time = lbean.getTime();
      
      if(day < 0 || time < 0)
         return;
      else {
         typeMatrix[time - 1][day] = lbean.getType();
         titleMatrix[time - 1][day] = lbean.getTitle();
         spanMatrix[time - 1][day] = lbean.getConsecutive();   
         if(lbean.getConsecutive() > 1) {
            for(i = 0; i < lbean.getConsecutive() - 1; i++)
               spanMatrix[time + i][day] = 0;
         }
      }
   }
}