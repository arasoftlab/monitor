package excel;


import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.imageio.ImageIO;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.OptionVO;
import seoul.admin.vo.QuestionSettingsVO;
import seoul.admin.vo.QuestionVO;
import util.BaseUtil;



public class ExcelView_org extends AbstractExcelView{
	
	// for window
	String img_temp_path = "C:\\WINDOSW\\Temp\\seoul";
	// for linux
	//String img_temp_path = "/var/tmp/seoul";
	
	private static int loadPicture(String path, HSSFWorkbook wb)
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
	
@Override
protected void buildExcelDocument(Map<String,Object> ModelMap,HSSFWorkbook workbook, 
                HttpServletRequest request, HttpServletResponse response) throws Exception{
	

	
	
	String excelName = ModelMap.get("target").toString();
             HSSFSheet worksheet = null;
             HSSFRow row = null;
             
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
             
                 List<MonitorsVO> list = (List<MonitorsVO>)((List<Object>)ModelMap.get("excelList")).get(0);
                 
                 // 셀별 위드 정하기 헤더 그리기    
                 worksheet.setColumnWidth(0,5000);   
                 worksheet.setColumnWidth(1, 5000);   
                 worksheet.setColumnWidth(2, 7000);   
                 worksheet.setColumnWidth(3, 5000);   
                 worksheet.setColumnWidth(4, 3000);   
                 worksheet.setColumnWidth(5, 3000);   
                 worksheet.setColumnWidth(6, 8000);   
                 worksheet.setColumnWidth(7, 3000);   
                 worksheet.setColumnWidth(8, 3000);   
                 worksheet.setColumnWidth(9, 3000);   
                 worksheet.setColumnWidth(10, 3000);   
                 worksheet.setColumnWidth(11, 3000);                    
                 worksheet.setColumnWidth(12, 3000);   
                 worksheet.setColumnWidth(13, 6000);    
                 
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
                 t_cell4.setCellValue("기수");
                 t_cell4.setCellStyle(center);                

                 Cell t_cell5 = row.createCell(5);
                 t_cell5.setCellValue("주소");
                 t_cell5.setCellStyle(center);                

                 Cell t_cell6 = row.createCell(6);
                 t_cell6.setCellValue("기타사항");
                 t_cell6.setCellStyle(center);                

                 Cell t_cell7 = row.createCell(7);
                 t_cell7.setCellValue("신청조");
                 t_cell7.setCellStyle(center);                                 

                 Cell t_cell8 = row.createCell(8);
                 t_cell8.setCellValue("응답횟수");
                 t_cell8.setCellStyle(center);                                 

                 Cell t_cell9 = row.createCell(9);
                 t_cell9.setCellValue("선정횟수");
                 t_cell9.setCellStyle(center);                                 

                 Cell t_cell10 = row.createCell(10);
                 t_cell10.setCellValue("미응답");
                 t_cell10.setCellStyle(center);                                 

                 Cell t_cell11 = row.createCell(11);
                 t_cell11.setCellValue("허위응답");
                 t_cell11.setCellStyle(center);                                 

                 Cell t_cell12 = row.createCell(12);
                 t_cell12.setCellValue("선정여부");
                 t_cell12.setCellStyle(center);                                 
                 
                 Cell t_cell13 = row.createCell(13);
                 t_cell13.setCellValue("이미지테스트");
                 t_cell13.setCellStyle(center);
                 
                 for(int i=1;i<list.size()+1;i++){
                     row = worksheet.createRow(i);

                     Cell cell0 = row.createCell(0);
                     cell0.setCellValue(list.get(i-1).getRn());
                     cell0.setCellStyle(center);

                     Cell cell1 = row.createCell(1);
                     cell1.setCellValue(format1.format(list.get(i-1).getRegdate()));
                     cell1.setCellStyle(center);
                     
                     Cell cell2 = row.createCell(2);
                     cell2.setCellValue(list.get(i-1).getMember_id());
                     cell2.setCellStyle(center);
                     
                     Cell cell3 = row.createCell(3);
                     cell3.setCellValue(list.get(i-1).getMember_name());
                     cell3.setCellStyle(center);
                     
                     Cell cell4 = row.createCell(4);
                     cell4.setCellValue(list.get(i-1).getPoll_num());
                     cell4.setCellStyle(center);
                     
                     Cell cell5 = row.createCell(5);
                     cell5.setCellValue(list.get(i-1).getAddress());
                     cell5.setCellStyle(center);
                     
                     Cell cell6 = row.createCell(6);
                     cell6.setCellValue(list.get(i-1).getDescription());
                     cell6.setCellStyle(center);
                     
                     Cell cell7 = row.createCell(7);
                     cell7.setCellValue(list.get(i-1).getTeam_num());
                     cell7.setCellStyle(center);
                     
                     Cell cell8 = row.createCell(8);
                     cell8.setCellValue(list.get(i-1).getApply_cnt());
                     cell8.setCellStyle(center);
                     
                     Cell cell9 = row.createCell(9);
                     cell9.setCellValue(list.get(i-1).getSelected_cnt());
                     cell9.setCellStyle(center);
                     
                     Cell cell10 = row.createCell(10);
                     cell10.setCellValue(list.get(i-1).getTmp_sum1());
                     cell10.setCellStyle(center);
                     
                     Cell cell11 = row.createCell(11);
                     cell11.setCellValue("허위응답");
                     cell11.setCellStyle(center);
                     
                     Cell cell12 = row.createCell(12);
                     cell12.setCellValue(list.get(i-1).getIs_selection());
                     cell12.setCellStyle(center);
                     /*
                     if (i == 3)
                     {
                    	 // 이미지 파일이 있는경우 & 파일의 개수마다 해당 그림의 크기를 다르게 지정 
                    	 // 혹은 맥시멈 3개니까 
                    	 
                    	 for (int j = 0; j < 2 ; j++)
                    	 {
		                     HSSFPatriarch patriarch = worksheet.createDrawingPatriarch();
		                     
		                     HSSFClientAnchor anchor;
		                     anchor = new HSSFClientAnchor( 0,(int)(0+(127.5*j)),0,(int)(127.5+(127.5*j)),(short)13,i,(short)14,i); // 이미지 크기조절은 여기서..
		                     //anchor.setAnchorType( 2 );             
		                     String uploadPath = request.getRealPath("/upload/"+BaseUtil.currentYear()+BaseUtil.addZeroString(BaseUtil.currentMonth()));
		                                  
		                     patriarch.createPicture(anchor, loadPicture(uploadPath+"/1480401220196.png", workbook )); // 삽입 할 이미지
                    	 }
                         row.setHeight((short)6000);
                     }
                     else if (i==2)
                     {
                    	 for (int j = 0; j < 3 ; j++)
                    	 {
		                     HSSFPatriarch patriarch = worksheet.createDrawingPatriarch();
		                     
		                     HSSFClientAnchor anchor;
		                     anchor = new HSSFClientAnchor( 0,(int)(0+(85*j)),0,(int)(85+(85*j)),(short)13,i,(short)14,i); // 이미지 크기조절은 여기서..
		                     //anchor.setAnchorType( 2 );             
		                     String uploadPath = request.getRealPath("/upload/"+BaseUtil.currentYear()+BaseUtil.addZeroString(BaseUtil.currentMonth()));
		                                  
		                     patriarch.createPicture(anchor, loadPicture(uploadPath+"/1480401220196.png", workbook )); // 삽입 할 이미지
                    	 }
                         row.setHeight((short)9000);
                     }
                     else{
	                     HSSFPatriarch patriarch = worksheet.createDrawingPatriarch();
	                     
	                     HSSFClientAnchor anchor;
	                     anchor = new HSSFClientAnchor(0,0,0,255,(short)13,i,(short)14,i); // 이미지 크기조절은 여기서..
	                     //anchor.setAnchorType( 2 );             
	                     String uploadPath = request.getRealPath("/upload/"+BaseUtil.currentYear()+BaseUtil.addZeroString(BaseUtil.currentMonth()));
	                                  
	                     patriarch.createPicture(anchor, loadPicture(uploadPath+"/1480401220196.png", workbook )); // 삽입 할 이미지

	                     row.setHeight((short)3000);
                     }*/

                     row.setHeight((short)3000);
                 }
             }
             else if (excelName.equals("answers")){
            	 
                List<AnswersVO> a_list = (List<AnswersVO>)((List<Object>)ModelMap.get("excelList")).get(0);
                 
                worksheet.setColumnWidth(0,5000);   
                worksheet.setColumnWidth(1, 5000);   
                worksheet.setColumnWidth(2, 7000);   
                worksheet.setColumnWidth(3, 5000);   
                worksheet.setColumnWidth(4, 3000);   
                 
                //이런식으로 넣었던 번지수에 접근해서 가져와야한다.
                List<QuestionVO> q_list = (List<QuestionVO>)((List<Object>)ModelMap.get("excelList")).get(1); 
                
                int temp_num = 4;
                
                for (int i = 0 ; i < q_list.size() ; i++)
                {
                	if ( q_list.get(i).getType().equals("R") )
                	{
                		for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
                		{
                            worksheet.setColumnWidth(++temp_num, 2000);                			
                		}
                        
                	}                	
                	else if(q_list.get(i).getType().equals("W"))
                	{
                		for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
                		{
                			worksheet.setColumnWidth(++temp_num, 9000);                		
                		}
                	}
                	else if(q_list.get(i).getType().equals("T"))
                	{
                        worksheet.setColumnWidth(++temp_num, 4000);   
                        
                        worksheet.setColumnWidth(++temp_num, 4000);
                	}
                	else if(q_list.get(i).getType().equals("B"))
                	{
                        worksheet.setColumnWidth(++temp_num, 4000);   
                	}
                	else{
                        worksheet.setColumnWidth(++temp_num, 2000);   
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
                            t_cell5.setCellValue("문"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num());
                            t_cell5.setCellStyle(center);                	
                		}
                	}
                	else if ( q_list.get(i).getType().equals("W") )
                	{
                		for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
                		{
                            Cell t_cell5 = row.createCell(++temp_num);
                            t_cell5.setCellValue("문"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num());
                            t_cell5.setCellStyle(center);                	
                		}
                	}
                	else if ( q_list.get(i).getType().equals("T") )
                	{

                		Cell t_cell5 = row.createCell(++temp_num);
                        t_cell5.setCellValue("문"+q_list.get(i).getQuestion_num()+"_서술");
                        t_cell5.setCellStyle(center);                	
                        
                        
                        if (q_list.get(i).getOptionVO().get(0).getLabel_1().equals("img") )
                        {
                    		Cell t_cell6 = row.createCell(++temp_num);
                            t_cell6.setCellValue("문"+q_list.get(i).getQuestion_num()+"_이미지");
                            t_cell6.setCellStyle(center);                	                        	
                        }else{
                    		Cell t_cell6 = row.createCell(++temp_num);
                            t_cell6.setCellValue("문"+q_list.get(i).getQuestion_num()+"_파일");
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
                    
                    String[] temp_arr = a_list.get(i-1).getAnswers().split("\\|");
                    
                    int a_index = 0;
                    
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
	                                cell5.setCellValue(s_temp_arr[j]);
	                                cell5.setCellStyle(center);
	                        	}
	                        }
	                        else if (temp_type.equals("M") || temp_type.equals("O"))
	                        {                            
	                            String s_temp ="";
	
	                    		String[] s_temp_arr = temp_arr[a_index].split("#");
	                            
	                        	for (int j = 1 ; j < s_temp_arr.length ; j++)
	                        	{
	                        		s_temp+= "|"+s_temp_arr[j]+"|";
	                        	}
	
	                            Cell cell5 = row.createCell(++temp_num);
	                            cell5.setCellValue(s_temp);
	                            cell5.setCellStyle(center);
	                        	
	                        }
	                        else if (temp_type.equals("B"))
	                        {
	                            Cell cell5 = row.createCell(++temp_num);
	                            cell5.setCellValue("게시판 형 질문");
	                            cell5.setCellStyle(center);
	                        }
	                        else if (temp_type.equals("S"))
	                        {
	                        	String s_type_string = temp_arr[a_index].substring(temp_arr[a_index].indexOf(":")+1, temp_arr[a_index].indexOf(":")+2) + "\r\n";
	                        	
	                        	s_type_string+= temp_arr[a_index].substring(temp_arr[a_index].indexOf("#")+1, temp_arr[a_index].length());
	                        	
	                            Cell cell5 = row.createCell(++temp_num);
	                            cell5.setCellValue(s_type_string);
	                            cell5.setCellStyle(center);
	                        }	                        
	                        else if (temp_type.equals("T"))
	                        {	
	                            int img_position = temp_num+2;
	                            
		   	                    HSSFPatriarch patriarch = worksheet.createDrawingPatriarch();
			                     
		   	                    HSSFClientAnchor anchor;
		   	                    anchor = new HSSFClientAnchor(0,0,0,255,(short)img_position,i,(short)(img_position+1),i); // 이미지 크기조절은 여기서..
		   	                    String uploadPath = request.getRealPath("/upload/"+BaseUtil.currentYear()+BaseUtil.addZeroString(BaseUtil.currentMonth()));
		   	                    
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
				                        	
				                			                        		
				                                imageUrl = new URL("http://localhost:8080"+t_temp);
				                                HttpURLConnection connection = (HttpURLConnection) imageUrl.openConnection();
				                                        connection.setRequestProperty(
				                                                "User-Agent",
				                                                "Mozilla/5.0 (Windows NT 6.3; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0");
				                                BufferedImage propertImage = ImageIO.read(connection.getInputStream());
				                                // 버퍼에 이미지 받아왔다 . 어쩔수없으면 웹에서 다운로드 해오고 temp 경로에 업로드 했다가 이미지 뜨면 지워버리는식으로 해야한다.

				                                File file = new File(img_temp_path+"/"+t_temp_arr[5]);
				                                				                                				                                
				                                File file_dir = new File(img_temp_path);
				                                
				                            	if(!file_dir.exists()){
				                            		  //없다면 생성
				                            		file_dir.mkdirs(); 
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
				                                
				                                ImageIO.write(propertImage, "jpg", file);
				                                
						   	                	l_pic = loadPicture(img_temp_path+"/"+t_temp_arr[5], workbook );				   	                
							   	                patriarch.createPicture(anchor, l_pic); // 삽입 할 이미지
						   	                   	
						   	                   	++temp_num;
							   	                
				                            } catch (Exception ex) {
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
                        	
                        	
	                        if (q_list.get(z).getType().equals("O") || q_list.get(z).getType().equals("M") 
	                        		|| q_list.get(z).getType().equals("S") || q_list.get(z).getType().equals("C") || q_list.get(z).getType().equals("B"))
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
                

             }
             
             File img_temp_del = new File(img_temp_path);
             
             deleteFolder(img_temp_del);


             response.setHeader("Content-disposition", "attachment; filename="+excelName+data+".xls");
       }
}