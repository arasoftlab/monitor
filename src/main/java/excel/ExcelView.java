package excel;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MemberManagerVO;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.QuestionVO;
import util.BaseUtil;

public class ExcelView extends AbstractXlsView{

	String img_temp_path = "/var/tmp/seoul";
	
	private static int loadPicture(String path, Workbook wb)
			throws IOException {
		int pictureIndex;
		FileInputStream fis = null;
		ByteArrayOutputStream bos = null;

		try {
			fis = new FileInputStream(path);
			bos = new ByteArrayOutputStream();
			int c;
			while ((c = fis.read()) != -1) {
				bos.write(c);
			}
			pictureIndex = wb.addPicture(bos.toByteArray(),
					HSSFWorkbook.PICTURE_TYPE_JPEG);
		} finally {
			if (fis != null)
				fis.close();
			if (bos != null)
				bos.close();
		}
		return pictureIndex;
	}

	public boolean deleteFolder(File targetFolder){
		 
		try{
		
	      File[] childFile = targetFolder.listFiles();
	      boolean confirm = false;
	      int size = childFile.length;
	 
	      if (size > 0) {
	 
	          for (int i = 0; i < size; i++) {
	 
	              if (childFile[i].isFile()) {
	 
	                  confirm = childFile[i].delete();
	 
	                  System.out.println(childFile[i]+":"+confirm + " 삭제");
	                  
	              } else {
	 
	                  deleteFolder(childFile[i]);
	 
	              }
	 
	          }
	 
	      }
	 
	   
	 
	      targetFolder.delete();
		}catch (Exception ex) {
         
        }	
	    return (!targetFolder.exists());
	  
	    
	 }//deleteFolder
	

protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
//protected void buildExcelDocument(Map<String,Object> ModelMap,HSSFWorkbook workbook, 
//            HttpServletRequest request, HttpServletResponse response) throws Exception{

	
	
	 String excelName = model.get("target").toString();
	 Sheet worksheet = null;
	 Row row = null;
             
             @SuppressWarnings("unchecked")
             String textex = "test";
             worksheet = workbook.createSheet(excelName+ " WorkSheet");
             
             DateFormat format1 = DateFormat.getDateInstance(DateFormat.MEDIUM);
             
             DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
             String data = df.format(new Date());
             
             CellStyle center = workbook.createCellStyle();
             center.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
             center.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
             center.setWrapText(true);
             

                         
             if(excelName.equals("applicant")){
             
                 @SuppressWarnings("unchecked")
                 List<MonitorsVO> list = (List<MonitorsVO>)((List<Object>)model.get("excelList")).get(0);
                 
                 // 셀별 위드 정하기 헤더 그리기    
                 worksheet.setColumnWidth(0,3000);   
                 worksheet.setColumnWidth(1, 5000);   
                 worksheet.setColumnWidth(2, 7000);   
                 worksheet.setColumnWidth(3, 5000);   
                 worksheet.setColumnWidth(4, 3000);   
                 worksheet.setColumnWidth(5, 3000);   
                 worksheet.setColumnWidth(6, 5000);   
                 worksheet.setColumnWidth(7, 5000);   
                 worksheet.setColumnWidth(8, 5000);   
                 worksheet.setColumnWidth(9, 5000);   
                 worksheet.setColumnWidth(10, 2000);   
                 worksheet.setColumnWidth(11, 2000);                    
                 worksheet.setColumnWidth(12, 2000);   
                 worksheet.setColumnWidth(13, 2000);
                 worksheet.setColumnWidth(14, 2000);   
                 worksheet.setColumnWidth(15, 2000);
                 
                 row = worksheet.createRow(0);                                  

                 Cell t_cell0 = row.createCell(0);
                 t_cell0.setCellValue("번호");
                 t_cell0.setCellStyle(center);
                 
                 Cell t_cell1 = row.createCell(1);
                 t_cell1.setCellValue("신청일");
                 t_cell1.setCellStyle(center);

                 Cell t_cell2 = row.createCell(2);
                 t_cell2.setCellValue("아이디");
                 t_cell2.setCellStyle(center);

                 Cell t_cell3 = row.createCell(3);
                 t_cell3.setCellValue("이름");
                 t_cell3.setCellStyle(center);

                 Cell t_cell4 = row.createCell(4);
                 t_cell4.setCellValue("생년월일");
                 t_cell4.setCellStyle(center);                

                 Cell t_cell5 = row.createCell(5);
                 t_cell5.setCellValue("직업");
                 t_cell5.setCellStyle(center);                

                 Cell t_cell6 = row.createCell(6);
                 t_cell6.setCellValue("연락처");
                 t_cell6.setCellStyle(center);
                 
                 Cell t_cell7 = row.createCell(7);
                 t_cell7.setCellValue("시");
                 t_cell7.setCellStyle(center);                

                 Cell t_cell8 = row.createCell(8);
                 t_cell8.setCellValue("구");
                 t_cell8.setCellStyle(center);                
                 
                 Cell t_cell9 = row.createCell(9);
                 t_cell9.setCellValue("동");
                 t_cell9.setCellStyle(center);                
                 
                 Cell t_cell10 = row.createCell(10);
                 t_cell10.setCellValue("기타사항");
                 t_cell10.setCellStyle(center);                                 

                 Cell t_cell11 = row.createCell(11);
                 t_cell11.setCellValue("신청조");
                 t_cell11.setCellStyle(center);                                 

                 Cell t_cell12 = row.createCell(12);
                 t_cell12.setCellValue("응모횟수");
                 t_cell12.setCellStyle(center);                                 

                 Cell t_cell13 = row.createCell(13);
                 t_cell13.setCellValue("선정횟수");
                 t_cell13.setCellStyle(center);              
                 
                 Cell t_cell14 = row.createCell(14);
                 t_cell14.setCellValue("미응답");
                 t_cell14.setCellStyle(center);

                 Cell t_cell15 = row.createCell(15);
                 t_cell15.setCellValue("선정여부");
                 t_cell15.setCellStyle(center);                                 
                 
                 
                 for(int i=1;i<list.size()+1;i++){
                     row = worksheet.createRow(i);

                     Cell cell0 = row.createCell(0);
                     cell0.setCellValue(list.get(i-1).getRn());
                     cell0.setCellStyle(center);

                     Cell cell1 = row.createCell(1);
                     cell1.setCellValue((String)df.format(list.get(i-1).getRegdate()).substring(0,7));
                     cell1.setCellStyle(center);
                     
                     Cell cell2 = row.createCell(2);
                     cell2.setCellValue(list.get(i-1).getMember_id());
                     cell2.setCellStyle(center);
                     
                     Cell cell3 = row.createCell(3);
                     cell3.setCellValue(list.get(i-1).getMember_name());
                     cell3.setCellStyle(center);
                     
                     Cell cell4 = row.createCell(4);
                     cell4.setCellValue(list.get(i-1).getBirth());
                     cell4.setCellStyle(center);

                     Cell cell5 = row.createCell(5);
                     cell5.setCellValue(list.get(i-1).getJob());
                     cell5.setCellStyle(center);

                     Cell cell6 = row.createCell(6);
                     cell6.setCellValue(list.get(i-1).getPhone());
                     cell6.setCellStyle(center);
                                                               
                     Cell cell7 = row.createCell(7);
                     cell7.setCellValue(list.get(i-1).getSido());
                     cell7.setCellStyle(center);

                     Cell cell8 = row.createCell(8);
                     cell8.setCellValue(list.get(i-1).getGugun());
                     cell8.setCellStyle(center);
                     
                     Cell cell9 = row.createCell(9);
                     cell9.setCellValue(list.get(i-1).getDong());
                     cell9.setCellStyle(center);
                     
                                          
                     Cell cell10 = row.createCell(10);
                     cell10.setCellValue(list.get(i-1).getDescription());
                     cell10.setCellStyle(center);
                     
                     Cell cell11 = row.createCell(11);
                     cell11.setCellValue(list.get(i-1).getTeam_num());
                     cell11.setCellStyle(center);
                     
                     Cell cell12 = row.createCell(12);
                     cell12.setCellValue(list.get(i-1).getApply_cnt());
                     cell12.setCellStyle(center);
                     
                     Cell cell13 = row.createCell(13);
                     cell13.setCellValue(list.get(i-1).getSelected_cnt());
                     cell13.setCellStyle(center);
                     
                     Cell cell14 = row.createCell(14);
                     cell14.setCellValue(list.get(i-1).getTmp_sum1());
                     cell14.setCellStyle(center);
                     
                     Cell cell15 = row.createCell(15);
                     cell15.setCellValue(list.get(i-1).getIs_selection());
                     cell15.setCellStyle(center);


                     row.setHeight((short)3000);
                 }
                 
                 excelName = "모니터 신청자목록";
             }
             else if(excelName.equals("applicant_apply")){
                 
                 @SuppressWarnings("unchecked")
                 List<MonitorsVO> list = (List<MonitorsVO>)((List<Object>)model.get("excelList")).get(0);
                 
                 // 셀별 위드 정하기 헤더 그리기    
                 worksheet.setColumnWidth(0,3000);   
                 worksheet.setColumnWidth(1, 5000);   
                 worksheet.setColumnWidth(2, 7000);   

                 
                 row = worksheet.createRow(0);                                  

                 Cell t_cell0 = row.createCell(0);
                 t_cell0.setCellValue("번호");
                 t_cell0.setCellStyle(center);
                 
                 Cell t_cell1 = row.createCell(1);
                 t_cell1.setCellValue("이름");
                 t_cell1.setCellStyle(center);

                 Cell t_cell2 = row.createCell(2);
                 t_cell2.setCellValue("연락처");
                 t_cell2.setCellStyle(center);                
                 
                 
                 
                 
                 for(int i=1;i<list.size()+1;i++){
                     row = worksheet.createRow(i);

                     Cell cell0 = row.createCell(0);
                     cell0.setCellValue(list.get(i-1).getRn());
                     cell0.setCellStyle(center);

                     Cell cell1 = row.createCell(1);
                     cell1.setCellValue(list.get(i-1).getMember_name());
                     cell1.setCellStyle(center);
                     
                     Cell cell3 = row.createCell(2);
                     cell3.setCellValue(list.get(i-1).getPhone());
                     cell3.setCellStyle(center);
                     
                     row.setHeight((short)3000);
                 }
                 excelName = "모니터 선정결과";
             }
             else if (excelName.equals("answers")){
            	 
                 @SuppressWarnings("unchecked")
                 List<AnswersVO> a_list = (List<AnswersVO>)((List<Object>)model.get("excelList")).get(0);
                 
                 worksheet.setColumnWidth(0,5000);   
                 worksheet.setColumnWidth(1, 5000);   
                 worksheet.setColumnWidth(2, 7000);   
                 worksheet.setColumnWidth(3, 5000);   
                 worksheet.setColumnWidth(4, 3000);   
                  
                 //이런식으로 넣었던 번지수에 접근해서 가져와야한다.
                 @SuppressWarnings("unchecked")
                 List<QuestionVO> q_list = (List<QuestionVO>)((List<Object>)model.get("excelList")).get(1); 
                 
                 int temp_num = 4;
                 
                 for (int i = 0 ; i < q_list.size() ; i++)
                 {
                 	if ( q_list.get(i).getType().equals("R") )
                 	{
                 		for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
                 		{
                             worksheet.setColumnWidth(++temp_num, 4000);                			
                 		}
                         
                 	}                	
                 	else if(q_list.get(i).getType().equals("W"))
                 	{
                 		for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
                 		{
                 			worksheet.setColumnWidth(++temp_num, 9000);                		
                 		}
                 	}
                 	else if(q_list.get(i).getType().equals("M"))
                 	{
                 		for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
                 		{
                 			worksheet.setColumnWidth(++temp_num, 5000);                		
                 		}
                 	}
                 	else if(q_list.get(i).getType().equals("O"))
                 	{
                 		for(int j = 0 ; j < q_list.get(i).getRequired_cnt() ; j++)
                 		{
                 			worksheet.setColumnWidth(++temp_num, 4000);                		
                 		}
                 	}
                 	else if(q_list.get(i).getType().equals("T"))
                 	{
                         worksheet.setColumnWidth(++temp_num, 4000);   
                         
                         worksheet.setColumnWidth(++temp_num, 4000);
                 	}
                 	else if(q_list.get(i).getType().equals("S"))
                 	{
                         worksheet.setColumnWidth(++temp_num, 4000);   
                                                  
                         for (int s_temp = 0 ; s_temp < q_list.get(i).getOptionVO().size() ; s_temp ++)
                         {
                         	if (q_list.get(i).getOptionVO().get(s_temp).getDescyn() != null)
                         	{
                                 if (q_list.get(i).getOptionVO().get(s_temp).getDescyn().equals("Y"))
                                 {
                                     worksheet.setColumnWidth(++temp_num, 5000);
                                 }
                         	}                        		                        	
                         }
                         
                 	}
                 	else if(q_list.get(i).getType().equals("B"))
                 	{
                         worksheet.setColumnWidth(++temp_num, 4000);   
                 	}
                 	else{
                         worksheet.setColumnWidth(++temp_num, 4000);   
                 	}
                 }
                                 
                 row = worksheet.createRow(0);                                  
               
                 Cell t_cell0 = row.createCell(0);
                 t_cell0.setCellValue("번호");
                 t_cell0.setCellStyle(center);
                 
                 Cell t_cell1 = row.createCell(1);
                 t_cell1.setCellValue("재출일");
                 t_cell1.setCellStyle(center);

                 Cell t_cell2 = row.createCell(2);
                 t_cell2.setCellValue("아이디");
                 t_cell2.setCellStyle(center);

                 Cell t_cell3 = row.createCell(3);
                 t_cell3.setCellValue("이름");
                 t_cell3.setCellStyle(center);

                 Cell t_cell4 = row.createCell(4);
                 t_cell4.setCellValue("신청조");
                 t_cell4.setCellStyle(center);                
                 
                 // 신청조 다음으로 N개의 문항이 시작돼서 이런식으로 해야한다.
                 temp_num = 4;
                 
                 // 상단 문항번호 n개 만들기 
                 for (int i = 0 ; i < q_list.size() ; i++)
                 {
                 	if ( q_list.get(i).getType().equals("R") )
                 	{
                 		for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
                 		{
                             Cell t_cell5 = row.createCell(++temp_num);
                             t_cell5.setCellValue("문(척도)"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num());
                             t_cell5.setCellStyle(center);                	
                 		}
                 	}
                 	else if ( q_list.get(i).getType().equals("W") )
                 	{
                 		for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
                 		{
                             Cell t_cell5 = row.createCell(++temp_num);
                             t_cell5.setCellValue("문(서술)"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num());
                             t_cell5.setCellStyle(center);                	
                 		}
                 	}
                 	else if ( q_list.get(i).getType().equals("M") )
                 	{
                 		for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
                 		{
                             Cell t_cell5 = row.createCell(++temp_num);
                             t_cell5.setCellValue("문(중복)"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num());
                             t_cell5.setCellStyle(center);                	
                 		}
                 	}
                 	else if ( q_list.get(i).getType().equals("O") )
                 	{
                 		for(int j = 0 ; j < q_list.get(i).getRequired_cnt() ; j++)
                 		{
                             Cell t_cell5 = row.createCell(++temp_num);
                             t_cell5.setCellValue("문(서열)"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num());
                             t_cell5.setCellStyle(center);                	
                 		}
                 	}                 	
                 	else if ( q_list.get(i).getType().equals("S") )
                 	{
                        Cell t_cell5 = row.createCell(++temp_num);
                        t_cell5.setCellValue("문(단일)"+q_list.get(i).getQuestion_num());
                        t_cell5.setCellStyle(center);  
                        
                        for (int s_temp = 0 ; s_temp < q_list.get(i).getOptionVO().size() ; s_temp ++)
                        {
                        	if (q_list.get(i).getOptionVO().get(s_temp).getDescyn() != null)
                        	{
                                if (q_list.get(i).getOptionVO().get(s_temp).getDescyn().equals("Y"))
                                {
                                    Cell t_cell6 = row.createCell(++temp_num);
                                    t_cell6.setCellValue("문(단일)"+q_list.get(i).getQuestion_num()+"서술");
                                    t_cell6.setCellStyle(center);
                                }

                        	}                        		                        	
                        }

                 	}
                 	else if ( q_list.get(i).getType().equals("T") )
                 	{

                 		Cell t_cell5 = row.createCell(++temp_num);
                         t_cell5.setCellValue("문(첨부)"+q_list.get(i).getQuestion_num()+"_서술");
                         t_cell5.setCellStyle(center);                	
                         
                         
                         if (q_list.get(i).getOptionVO().get(0).getLabel_1().equals("img") )
                         {
                     		Cell t_cell6 = row.createCell(++temp_num);
                             t_cell6.setCellValue("문(첨부)"+q_list.get(i).getQuestion_num()+"_이미지");
                             t_cell6.setCellStyle(center);                	                        	
                         }else{
                     		Cell t_cell6 = row.createCell(++temp_num);
                             t_cell6.setCellValue("문(첨부)"+q_list.get(i).getQuestion_num()+"_파일");
                             t_cell6.setCellStyle(center);                	
                         	
                         }
                         
                         
                 	}
                 	else{
                         Cell t_cell5 = row.createCell(++temp_num);
                         t_cell5.setCellValue("문"+q_list.get(i).getQuestion_num());
                         t_cell5.setCellStyle(center);                
                 	}
                 }
                 
                 
                 
                 for(int i=1;i<a_list.size()+1;i++){
                     row = worksheet.createRow(i);

                     Cell cell0 = row.createCell(0);
                     cell0.setCellValue(a_list.get(i-1).getRn());
                     cell0.setCellStyle(center);

                     Cell cell1 = row.createCell(1);
                     
                     if (a_list.get(i-1).getRegdate() == null) 
                     {
                     	cell1.setCellValue("");
                     }
                     else
                     {
                     	cell1.setCellValue(format1.format(a_list.get(i-1).getRegdate()));
                     }
                     cell1.setCellStyle(center);
                     
                     Cell cell2 = row.createCell(2);
                     cell2.setCellValue(a_list.get(i-1).getMember_id());
                     cell2.setCellStyle(center);
                     
                     Cell cell3 = row.createCell(3);
                     cell3.setCellValue(a_list.get(i-1).getMember_name());
                     cell3.setCellStyle(center);
                     
                     Cell cell4 = row.createCell(4);
                     cell4.setCellValue(a_list.get(i-1).getTeam_num());
                     cell4.setCellStyle(center);
                     
                     temp_num = 4;
                     
                     if (a_list.get(i-1).getAnswers().isEmpty()){
                    	 continue;
                    	 
                     }
                     
                     String[] temp_arr = a_list.get(i-1).getAnswers().split("\\|");
                     
                     int a_index = 1;
                     
                     for (int z = 0 ; z < q_list.size() ;z++ )
                     {
                     	if (temp_arr.length <= a_index)
                     	{
                     		// OutOfbounds 에러 때문에 index 가 증가되는것을 사전에 보고 없는 배열번지수를 참조할 수 없게 만듦.
                     		break;
                     	}
                     	
                         String temp_type = temp_arr[a_index].substring(1, 2);                    	
                         String temp_a_num = temp_arr[a_index].substring(2, temp_arr[a_index].indexOf(":"));

                         if (q_list.get(z).getQuestion_num() == Integer.valueOf(temp_a_num))
                         {
                         
 	                        if (temp_type.equals("R") || temp_type.equals("W") )
 	                        {
 	                    		String[] s_temp_arr = temp_arr[a_index].split("#");
 	                        	
 	                        	for (int j = 1 ; j < temp_arr[a_index].split("#").length ; j++)
 	                        	{                        		                      		
 	                                Cell cell5 = row.createCell(++temp_num);
 	                                cell5.setCellValue(s_temp_arr[j].replaceAll("<br>", "\r\n"));
 	                                cell5.setCellStyle(center);
 	                        	}
 	                        }
 	                        else if (temp_type.equals("O"))
 	                        {                            
 	                    		String[] s_temp_arr = temp_arr[a_index].split("#");
 	                        	
 	                        	for (int j = 1 ; j < temp_arr[a_index].split("#").length ; j++)
 	                        	{                        		                      		
 	                                Cell cell5 = row.createCell(++temp_num);
 	                                cell5.setCellValue(s_temp_arr[j]);
 	                                cell5.setCellStyle(center);
 	                        	} 	                    		
 	                        }
 	                        else if (temp_type.equals("M"))
 	                        {                            
 	                        	String[] s_temp_arr = temp_arr[a_index].split("#");
 	                        	
 	                        	for (int j = 1 ; j < q_list.get(i).getOptionVO().size() ; j ++)
 	                        	{
 	                        		if (s_temp_arr.length > j)
 	                        		{
 	                        			Cell cell5 = row.createCell(++temp_num);
 	                        			cell5.setCellValue(s_temp_arr[j]);
 	                        			cell5.setCellStyle(center); 	                        		
 	                        		}
 	                        		else{
 	                        			Cell cell5 = row.createCell(++temp_num);
 	                        			cell5.setCellValue("");
 	                        			cell5.setCellStyle(center); 	                        		
 	                        		}
 	                        	}

 	                        } 	                         
 	                        else if (temp_type.equals("B"))
 	                        {
 	                            Cell cell5 = row.createCell(++temp_num);
 	                            cell5.setCellValue("게시판 형 질문");
 	                            cell5.setCellStyle(center);
 	                        }
 	                        else if (temp_type.equals("S"))
 	                        {
 	                        	String s_type_string = temp_arr[a_index].substring(temp_arr[a_index].indexOf(":")+1, temp_arr[a_index].indexOf(":")+2);
 	                        	 	                        	
 	                        	Cell cell5 = row.createCell(++temp_num);
 	                        	cell5.setCellValue(s_type_string);
 	                        	cell5.setCellStyle(center);
 	                            
 	                           for (int s_temp = 0 ; s_temp < q_list.get(z).getOptionVO().size() ; s_temp ++)
 	                           {
	 	                          	if (q_list.get(z).getOptionVO().get(s_temp).getDescyn() != null)
	 	                          	{
	 	                          		if (q_list.get(z).getOptionVO().get(s_temp).getDescyn().equals("Y")) {
	 	                          			if ( temp_arr[a_index].contains("#") ){
	 	                          				Cell cell6 = row.createCell(++temp_num);
	 	                          				cell6.setCellValue(temp_arr[a_index].substring(temp_arr[a_index].indexOf("#")+1, temp_arr[a_index].length()));
	 	                          				cell6.setCellStyle(center);
	 	                          			}else{
	 	                          				Cell cell6 = row.createCell(++temp_num);
	 	                          				cell6.setCellValue("");
	 	                          				cell6.setCellStyle(center);
	 	                          			}

	 	                          		}
	 	                          	}                        		                        	
 	                           }
 	                            	                            
 	                        }	                        
 	                        else if (temp_type.equals("T"))
 	                        {	
 	                            int img_position = temp_num+2;
 	                            
 		   	                    HSSFPatriarch patriarch = (HSSFPatriarch) worksheet.createDrawingPatriarch();
 			                     
 		   	                    HSSFClientAnchor anchor;
 		   	                    anchor = new HSSFClientAnchor(0,0,0,255,(short)img_position,i,(short)(img_position+1),i); // 이미지 크기조절은 여기서..
 		   	                    String uploadPath = request.getSession().getServletContext().getRealPath("/upload/"+BaseUtil.currentYear()+BaseUtil.addZeroString(BaseUtil.currentMonth()));
 		   	                    
 		   	                    //이거를 상대경로로 끌어와야한다. 시청에서 잘보자. 
 		   	                    //이클립스로 아무리 돌려봐야 실제 경로에서 못끌어온다.
 		   	                    		   	                    
 		   	                    int l_pic = 0;
 			   	                
 		                        String t_temp = temp_arr[a_index].substring(temp_arr[a_index].indexOf("Ω")+1, temp_arr[a_index].length());
 		   	                    
 		                        String []t_temp_arr = t_temp.split("/");

 		                        String []t_a_temp_arr = t_temp.split("Ω");


 	                            Cell cell5_ = row.createCell(++temp_num);
 		                        if (t_temp_arr.length > 1)
 		                        {
 		                        	cell5_.setCellValue(temp_arr[a_index].substring(temp_arr[a_index].indexOf("#")+1, temp_arr[a_index].indexOf("Ω")));
 		                        }else{
 		                        	cell5_.setCellValue(temp_arr[a_index].substring(temp_arr[a_index].indexOf("#")+1, temp_arr[a_index].length()));
 		                        }
 	                            cell5_.setCellStyle(center);
 		                        	                            
 		                        
 	                            //첨부 스타일이 이미지 일때
 	                            if ( q_list.get(z).getOptionVO().get(0).getLabel_1().equals("img") )
 	                            {	                            	
 	                            	
 	                            		                            	                            	
 			                        if (t_temp_arr.length > 1)
 			                        {
 				                        	URL imageUrl;
 				                            try{
 				                        	
 				                            	System.out.println("URL connection enter"+t_temp);
 				                			                        		
 				                                imageUrl = new URL("https://smonitor_web/"+t_temp);
 				                                HttpURLConnection connection = (HttpURLConnection) imageUrl.openConnection();
 				                                        connection.setRequestProperty(
 				                                                "User-Agent",
 				                                                "Mozilla/5.0 (Windows NT 6.3; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0");
 				                                BufferedImage propertImage = ImageIO.read(connection.getInputStream());
 				                                // 버퍼에 이미지 받아왔다 . 어쩔수없으면 웹에서 다운로드 해오고 temp 경로에 업로드 했다가 이미지 뜨면 지워버리는식으로 해야한다.

 				                            	System.out.println("URL connection out");
 				                                
 				                                File file = new File(img_temp_path+"/"+t_temp_arr[5]);
 				                                				                                				                                
 				                                File file_dir = new File(img_temp_path);
 				                                
 				                            	if(!file_dir.exists()){
 				                            		  //없다면 생성
 				                            		file_dir.mkdirs(); 
 	 				                            	System.out.println("dir enter");
 				                            	}
 				                            	else
 				                            	{
 				                            			/*
 				                            			 * 
 				                            			//있다면 현재 디렉토리 파일을 삭제 
 				                            			File[] destroy = desti.listFiles(); 
 				                            				for(File des : destroy){
 				                            				des.delete(); 
 				                            			}
 				                            			
 				                            			*/				                            				
 		                            			}
 				                                
 				                            	System.out.println("dir out");
 				                            	
 				                                ImageIO.write(propertImage, "jpg", file);
 				                                
 				                            	System.out.println("file write ok");
 				                                
 						   	                	l_pic = loadPicture(img_temp_path+"/"+t_temp_arr[5], workbook );				   	                
 							   	                patriarch.createPicture(anchor, l_pic); // 삽입 할 이미지

 				                            	System.out.println("file load ok");
 							   	                
 						   	                   	++temp_num;
 							   	                
 				                            } catch (Exception ex) {
 				                            	
 				                            	ex.printStackTrace(); 				                            	
 					                            Cell cell6 = row.createCell(++temp_num);
 					                            
 					                            cell6.setCellValue("첨부 없음.");
 					                            cell6.setCellStyle(center);
 				                            }				                        	
 						   	                						   	              
 				                    }else{
 				                            Cell cell6 = row.createCell(++temp_num);
 				                            cell6.setCellValue("첨부 없음.");
 				                            cell6.setCellStyle(center);
 				                    }
 	                            }else{
 	                                Cell cell6 = row.createCell(++temp_num);
 		                            cell6.setCellValue("텍스트 파일형");
 		                            cell6.setCellStyle(center);
 	                            }
 	                            
 		   	                     		
 		   	                    row.setHeight((short)3000);
 	                            
 	                        }                        
 	                        else{
 	                            Cell cell5 = row.createCell(++temp_num);
 	                            cell5.setCellValue(temp_arr[a_index].substring(temp_arr[a_index].indexOf(":")+1, temp_arr[a_index].length()));
 	                            cell5.setCellStyle(center);
 	                        }
 	                        
 	                        a_index++;
                         }else{
                         	
                         	
 	                        if ( q_list.get(z).getType().equals("C") || q_list.get(z).getType().equals("B"))
 	                        {
 	                            Cell cell5 = row.createCell(++temp_num);
 	                            cell5.setCellValue("");
 	                            cell5.setCellStyle(center);
 	                        }
                         	
 	                        if (q_list.get(z).getType().equals("R") || q_list.get(z).getType().equals("W") )
 	                        {
 	                        	for( int p = 0 ; p < q_list.get(z).getOptionVO().size() ; p++ )
 	                        	{
 	                        		Cell cell5 = row.createCell(++temp_num);
 		                            cell5.setCellValue("");
 		                            cell5.setCellStyle(center);
 	                        	}	                        	
 	                        }
 	                        if (q_list.get(z).getType().equals("O"))
 	                        {
 	                        	for( int p = 0 ; p < q_list.get(z).getRequired_cnt() ; p++ )
 	                        	{
 	                        		Cell cell5 = row.createCell(++temp_num);
 		                            cell5.setCellValue("");
 		                            cell5.setCellStyle(center); 	                        		
 	                        	}
 	                        } 	 
 	                        
 	                        if (q_list.get(z).getType().equals("S") )
 	                        {
	                        	Cell cell5 = row.createCell(++temp_num);
 		                        cell5.setCellValue("");
 		                        cell5.setCellStyle(center);
 		                        
 		                        for (int l = 0 ; l < q_list.get(z).getOptionVO().size() ; l ++)
 		                        {
 		                        	if (q_list.get(z).getOptionVO().get(l).getDescyn() != null)
 		                        	{
	 		                        	if (q_list.get(z).getOptionVO().get(l).getDescyn().equals("Y"))
	 		                        	{
	 			                        	Cell cell6 = row.createCell(++temp_num);
	 		 		                        cell6.setCellValue("");
	 		 		                        cell6.setCellStyle(center);
	 		                        	}
 		                        	}
 		                        }
 		                        
 	                        }
 	                        
 	                        if (q_list.get(z).getType().equals("M"))
 	                        {
 	                        	for( int p = 0 ; p < q_list.get(z).getOptionVO().size() ; p++ )
 	                        	{
 	                        		Cell cell5 = row.createCell(++temp_num);
 		                            cell5.setCellValue("");
 		                            cell5.setCellStyle(center); 	                        		
 	                        	}
 	                        }
 	                        if (q_list.get(z).getType().equals("T"))
 	                        {
 	                            Cell cell5 = row.createCell(++temp_num);
 	                            cell5.setCellValue("");
 	                            cell5.setCellStyle(center);
 	                            
 	                            Cell cell6 = row.createCell(++temp_num);
 	                            cell6.setCellValue("");
 	                            cell6.setCellStyle(center);
 	                        }
                         	
                         }
                     }
                                                                           
                     row.setHeight((short)2000);
                 }
                 

                 File img_temp_del = new File(img_temp_path);
                 
                 deleteFolder(img_temp_del);

                 excelName = "응답 목록_";

             }
             else if (excelName.equals("memberManager"))
             {
                 @SuppressWarnings("unchecked")
                 List<MemberManagerVO> list = (List<MemberManagerVO>)((List<Object>)model.get("excelList")).get(0);
            	 
                 // 셀별 위드 정하기 헤더 그리기    
                 worksheet.setColumnWidth(0,2000);   
                 worksheet.setColumnWidth(1, 4000);   
                 worksheet.setColumnWidth(2, 4000);   
                 worksheet.setColumnWidth(3, 2000);   
                 worksheet.setColumnWidth(4, 4000);   
                 worksheet.setColumnWidth(5, 4000);   
                 worksheet.setColumnWidth(6, 3000);   
                 worksheet.setColumnWidth(7, 3000);   
                 worksheet.setColumnWidth(8, 3000);   
                 worksheet.setColumnWidth(9, 5000);    
                 worksheet.setColumnWidth(10, 3000);   
                 worksheet.setColumnWidth(11, 2000);    
                 worksheet.setColumnWidth(12, 3000);   
                 worksheet.setColumnWidth(13, 2000);    
                 worksheet.setColumnWidth(14, 2000);   
                 worksheet.setColumnWidth(15, 7000);    
                 worksheet.setColumnWidth(16, 5000);   

                 // cell 만들기
                 row = worksheet.createRow(0);                                  
                 
                 Cell t_cell0 = row.createCell(0);
                 t_cell0.setCellValue("번호");
                 t_cell0.setCellStyle(center);
                 
                 Cell t_cell1 = row.createCell(1);
                 t_cell1.setCellValue("아이디");
                 t_cell1.setCellStyle(center);

                 Cell t_cell2 = row.createCell(2);
                 t_cell2.setCellValue("이름");
                 t_cell2.setCellStyle(center);

                 Cell t_cell3 = row.createCell(3);
                 t_cell3.setCellValue("성별");
                 t_cell3.setCellStyle(center);

                 Cell t_cell4 = row.createCell(4);
                 t_cell4.setCellValue("생년월일");
                 t_cell4.setCellStyle(center);                

                 Cell t_cell5 = row.createCell(5);
                 t_cell5.setCellValue("직업");
                 t_cell5.setCellStyle(center);                

                 Cell t_cell6 = row.createCell(6);
                 t_cell6.setCellValue("시");
                 t_cell6.setCellStyle(center);                

                 Cell t_cell7 = row.createCell(7);
                 t_cell7.setCellValue("구");
                 t_cell7.setCellStyle(center);                                 

                 Cell t_cell8 = row.createCell(8);
                 t_cell8.setCellValue("동");
                 t_cell8.setCellStyle(center);                                 

                 Cell t_cell9 = row.createCell(9);
                 t_cell9.setCellValue("연락처");
                 t_cell9.setCellStyle(center);                                                  

                 Cell t_cell10 = row.createCell(10);
                 t_cell10.setCellValue("연락처 구분");
                 t_cell10.setCellStyle(center);
                 
                 Cell t_cell11 = row.createCell(11);
                 t_cell11.setCellValue("기수");
                 t_cell11.setCellStyle(center);                 

                 Cell t_cell12 = row.createCell(12);
                 t_cell12.setCellValue("회원등급");
                 t_cell12.setCellStyle(center);

                 Cell t_cell13 = row.createCell(13);
                 t_cell13.setCellValue("신청횟수");
                 t_cell13.setCellStyle(center);

                 Cell t_cell14 = row.createCell(14);
                 t_cell14.setCellValue("선정횟수");
                 t_cell14.setCellStyle(center);

                 Cell t_cell15 = row.createCell(15);
                 t_cell15.setCellValue("이메일");
                 t_cell15.setCellStyle(center);

                 Cell t_cell16 = row.createCell(16);
                 t_cell16.setCellValue("가입일자");
                 t_cell16.setCellStyle(center);
                 
                 
                 for(int i=1;i<list.size()+1;i++){
                     row = worksheet.createRow(i);
                     	
                     //번호
                     Cell cell0 = row.createCell(0);
                     cell0.setCellValue(list.get(i-1).getRn());
                     cell0.setCellStyle(center);

                     //아이디
                     Cell cell1 = row.createCell(1);
                     cell1.setCellValue(list.get(i-1).getId());
                     cell1.setCellStyle(center);
                     
                     //이름
                     Cell cell2 = row.createCell(2);
                     cell2.setCellValue(list.get(i-1).getName());
                     cell2.setCellStyle(center);
                     
                     
                     //성별
                     Cell cell3 = row.createCell(3);
                     
                     if (list.get(i-1).getSex() != null) 
                     {
	                     if (list.get(i-1).getSex().equals("M"))
	                     {
	                         cell3.setCellValue("남");                    	 
	                     }
	                     else if (list.get(i-1).getSex().equals("W"))
	                     {
	                    	 cell3.setCellValue("여");
	                     }
                     }else{
                    	 cell3.setCellValue(" ");
                     }
                     
                     cell3.setCellStyle(center);
                     
                     //생년월일
                     Cell cell4 = row.createCell(4);
                   	 cell4.setCellValue(list.get(i-1).getBirthday().substring(0,8));                     
                     cell4.setCellStyle(center);
                     
                     //직업
                     Cell cell5 = row.createCell(5);
                     cell5.setCellValue(list.get(i-1).getJob());
                     cell5.setCellStyle(center);
                     
                     //시
                     Cell cell6 = row.createCell(6);
                     cell6.setCellValue(list.get(i-1).getSido());
                     cell6.setCellStyle(center);

                     //구
                     Cell cell7 = row.createCell(7);
                     cell7.setCellValue(list.get(i-1).getGugun());
                     cell7.setCellStyle(center);
                     
                     //동
                     Cell cell8 = row.createCell(8);
                     cell8.setCellValue(list.get(i-1).getDong());
                     cell8.setCellStyle(center);

                     //연락처
                     Cell cell9 = row.createCell(9);
                     cell9.setCellValue(list.get(i-1).getPhone());
                     cell9.setCellStyle(center);
                     
                     //연락처 타입
                     Cell cell10 = row.createCell(10);

                     if (list.get(i-1).getPhone_type().equals("01"))//집
                     {
                         cell10.setCellValue("집");
                     }
                     else if (list.get(i-1).getPhone_type().equals("02"))//직장 
                     {
                         cell10.setCellValue("직장");
                     }
                     else //휴대폰 
                     {
                         cell10.setCellValue("휴대폰");                    	 
                     }

                     cell10.setCellStyle(center);

                     //기수
                     Cell cell11 = row.createCell(11);
                     cell11.setCellValue(list.get(i-1).getPoll_num());
                     cell11.setCellStyle(center);

                     //회원등급
                     Cell cell12 = row.createCell(12);                     
                     if (list.get(i-1).getGrade().equals("nomal")) 
                    	 cell12.setCellValue("정회원");
                     else
                    	 cell12.setCellValue("");
                     
                     cell12.setCellStyle(center);
                     
                     //신청횟수
                     Cell cell13 = row.createCell(13);
                     cell13.setCellValue(list.get(i-1).getApply_cnt());
                     cell13.setCellStyle(center);

                     //선정횟수
                     Cell cell14 = row.createCell(14);
                     cell14.setCellValue(list.get(i-1).getSelection_cnt());
                     cell14.setCellStyle(center);

                     
                     //이메일
                     Cell cell15 = row.createCell(15);
                     cell15.setCellValue(list.get(i-1).getEmail());
                     cell15.setCellStyle(center);


                     
                     //가입 일자
                     if (list.get(i-1).getRegdate() == null)
                     {
                         Cell cell16 = row.createCell(16);
                         cell16.setCellValue("");
                         cell16.setCellStyle(center);
                     }
                     else{
                    	 String regdate = df.format(list.get(i-1).getRegdate());
                                          
                    	 Cell cell16 = row.createCell(16);
                    	 cell16.setCellValue(regdate);
                    	 cell16.setCellStyle(center);
                     }
                     
                 }
                 excelName = "회원 관리_";
             }
             else if (excelName.equals("money")){
            	 
                 @SuppressWarnings("unchecked")
                 List<MonitorApplyVO> list = (List<MonitorApplyVO>)((List<Object>)model.get("excelList")).get(0);
            	 
                 // 셀별 위드 정하기 헤더 그리기    
                 worksheet.setColumnWidth(0,5000);   
                 worksheet.setColumnWidth(1, 7000);   
                 worksheet.setColumnWidth(2, 7000);   
                 worksheet.setColumnWidth(3, 3000);   
                 worksheet.setColumnWidth(4, 5000);   
                 worksheet.setColumnWidth(5, 7000);   
                 worksheet.setColumnWidth(6, 7000);   
                 worksheet.setColumnWidth(7, 5000);   
                 worksheet.setColumnWidth(8, 3000);   
                 worksheet.setColumnWidth(9, 3000);  

                 // cell 만들기
                 
                 row = worksheet.createRow(0);                                  

                 Cell t_cell0 = row.createCell(0);
                 t_cell0.setCellValue("번호");
                 t_cell0.setCellStyle(center);
                 
                 Cell t_cell1 = row.createCell(1);
                 t_cell1.setCellValue("아이디");
                 t_cell1.setCellStyle(center);

                 Cell t_cell2 = row.createCell(2);
                 t_cell2.setCellValue("이름");
                 t_cell2.setCellStyle(center);

                 Cell t_cell3 = row.createCell(3);
                 t_cell3.setCellValue("생년월일");
                 t_cell3.setCellStyle(center);

                 Cell t_cell4 = row.createCell(4);
                 t_cell4.setCellValue("전화번호");
                 t_cell4.setCellStyle(center);                

                 Cell t_cell5 = row.createCell(5);
                 t_cell5.setCellValue("입금유형");
                 t_cell5.setCellStyle(center);                

                 Cell t_cell6 = row.createCell(6);
                 t_cell6.setCellValue("은행명");
                 t_cell6.setCellStyle(center);                

                 Cell t_cell7 = row.createCell(7);
                 t_cell7.setCellValue("계좌번호");
                 t_cell7.setCellStyle(center);                                 

                 Cell t_cell8 = row.createCell(8);
                 t_cell8.setCellValue("제출");
                 t_cell8.setCellStyle(center);                                 

                 Cell t_cell9 = row.createCell(9);
                 t_cell9.setCellValue("공급가액");
                 t_cell9.setCellStyle(center);                                                  

                 for(int i=1;i<list.size()+1;i++){
                     row = worksheet.createRow(i);

                     Cell cell0 = row.createCell(0);
                     cell0.setCellValue(list.get(i-1).getRn());
                     cell0.setCellStyle(center);

                     Cell cell1 = row.createCell(1);
                     cell1.setCellValue(list.get(i-1).getMember_id());
                     cell1.setCellStyle(center);
                     
                     Cell cell2 = row.createCell(2);
                     cell2.setCellValue(list.get(i-1).getMember_name());
                     cell2.setCellStyle(center);
                     
                     Cell cell3 = row.createCell(3);

                     String b_temp = list.get(i-1).getBirth().substring(0 , 8);
                     
                     cell3.setCellValue(b_temp);
                     cell3.setCellStyle(center);
                     
                     Cell cell4 = row.createCell(4);
                   	 cell4.setCellValue(list.get(i-1).getPhone());
                     cell4.setCellStyle(center);
                     
                     Cell cell5 = row.createCell(5);
                     cell5.setCellValue("계좌이체");
                     cell5.setCellStyle(center);
                     
                     Cell cell6 = row.createCell(6);
                     cell6.setCellValue(list.get(i-1).getBank());
                     cell6.setCellStyle(center);
                     
                     Cell cell7 = row.createCell(7);
                     cell7.setCellValue(list.get(i-1).getBank_num());
                     cell7.setCellStyle(center);
                                          
                     Cell cell8 = row.createCell(8);
                     cell8.setCellValue(list.get(i-1).getSend_cnt());
                     cell8.setCellStyle(center);
                     
                     int t_pay = Integer.valueOf(list.get(i-1).getPay());
                     
                     int t_cnt = Integer.valueOf(list.get(i-1).getSend_cnt());
                     
                     Cell cell9 = row.createCell(9);
                     cell9.setCellValue(String.valueOf((t_pay * t_cnt)));
                     cell9.setCellStyle(center);
               
                 }

                 excelName = "활동비_";                               
             }


             response.setHeader("Content-disposition", "attachment; filename="+new String((excelName).getBytes("KSC5601"),"8859_1")+data+".xls");
       }
}