package excel;


import java.awt.HeadlessException;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import seoul.admin.vo.AnswersVO;
import seoul.admin.vo.MemberManagerVO;
import seoul.admin.vo.MonitorApplyVO;
import seoul.admin.vo.MonitorsVO;
import seoul.admin.vo.QuestionVO;





public class ExcelView extends AbstractXlsView{

	/***
	 * 엑셀 파일을 만들때 자동으로 컬럼의 넓이를 조절하도록 수정
	 * 2017 12 15 JD
	 * @param sheetData worksheet
	 * @param maxColNum start of 0
	 */
	private void autoSizeColumns(Sheet sheetData, int maxColNum) {
		try {
			// Autosize columns
			int width = 0;
			for (int col = 0; col <= maxColNum; col++) {
				sheetData.autoSizeColumn(col);
				int cwidth = sheetData.getColumnWidth(col);
				cwidth += 500;
				cwidth = cwidth > 10000 ? 10000 : cwidth;
				sheetData.setColumnWidth(col, cwidth);
				width += cwidth;
				//width = width > 250 ? 150 : width;
				//System.out.println("설정중인 컬럼의 번호 : " + col);
			}

			// calculate zoom factor
			//int nominator = 45000 * 100 / width;
			//if (nominator < 100)
				//sheetData.setZoom(nominator, 100);

		} catch (HeadlessException he) {
			// No UI, no autosize :(
		}
	}
	
	String img_temp_path = "/var/tmp/seoul";
	

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
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

	 String excelName = model.get("target").toString();
	 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
     String data = df.format(new Date());
	 
	 switch(excelName) {
	 case "applicant":
		 workbook = (Workbook)buildApplicant(model, workbook);
		 excelName = "모니터 신청자목록";
		 break;
	 case "applicant_apply":
		 workbook = (Workbook)buildApplicantApply(model, workbook);
		 excelName = "모니터 선정결과";
		 break;
	 case "answers":
		 workbook = (Workbook)buildAnswer(model, workbook);
		 excelName = "응답 목록_";
		 break;
	 case "memberManager":
		 workbook = (Workbook)buildMemberManage(model, workbook);
		 excelName = "회원 관리_";
		 break;
	 case "money":
		 workbook = (Workbook)buildMoney(model, workbook);
		 excelName = "활동비_";   
		 break;
	 case "unfin":
		 workbook = (Workbook)buildUnFinished(model, workbook);
		 excelName = "미제출자_";   
		 break;	 
	 default:
		 break;
	 }
																			
	 response.setHeader("Content-disposition", "attachment; filename="+new String((excelName).getBytes("KSC5601"),"8859_1")+data+".xls");
	}
	
	
	/***
	 * applicant 엑셀 생성 model 
	 * @param model
	 * @param workbook
	 * @throws Exception
	 */
	protected Object buildApplicant(Map<String, Object> model, Workbook workbook) throws Exception {
	
	 String excelName = model.get("target").toString();
	 Sheet worksheet = null;
	 Row row = null;
	 
	 worksheet = workbook.createSheet(excelName+ " WorkSheet");
	 	 
	 CellStyle center = workbook.createCellStyle();
	 center.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
	 center.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
	 //center.setWrapText(true);
	 CellStyle vCenter = workbook.createCellStyle();
	 vCenter.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
	 
		 	 
	 @SuppressWarnings("unchecked")
	 List<MonitorsVO> list = (List<MonitorsVO>)((List<Object>)model.get("excelList")).get(0);
	 
	 // 셀별 위드 정하기 헤더 그리기
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
     	 
     Cell t_cell16 = row.createCell(16);
     t_cell16.setCellValue("한줄메모");
     t_cell16.setCellStyle(center);                                 
     
     Cell t_cell17 = row.createCell(17);
     t_cell17.setCellValue("이메일");
     t_cell17.setCellStyle(center);                                 
     
     
	 for(int i=1;i<list.size()+1;i++){
	     row = worksheet.createRow(i);
	
	     Cell cell0 = row.createCell(0);
	     cell0.setCellValue(i);
	     cell0.setCellStyle(center);
	
	     Cell cell1 = row.createCell(1);
	     SimpleDateFormat forR = new SimpleDateFormat("MM-dd kk:mm");
	     cell1.setCellValue((String)forR.format(list.get(i-1).getRegdate()));
	     cell1.setCellStyle(center);
	     
	     Cell cell2 = row.createCell(2);
	     cell2.setCellValue(list.get(i-1).getMember_id());
	     cell2.setCellStyle(center);
	     
	     Cell cell3 = row.createCell(3);
	     cell3.setCellValue(list.get(i-1).getMember_name());
	     cell3.setCellStyle(center);
	     
	     Cell cell4 = row.createCell(4);
	     String bData = list.get(i-1).getBirth();
	     cell4.setCellValue(bData.substring(0, bData.length() -1));
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
	
	     Cell cell16 = row.createCell(16);
	     String gM = ObjectUtils.isEmpty(list.get(i-1).getMemo()) ? "" : list.get(i-1).getMemo(); 
	     cell16.setCellValue(gM);
	     cell16.setCellStyle(center);
	     
	     Cell cell17 = row.createCell(17);
	     cell17.setCellValue(list.get(i-1).getEmail());
	     cell17.setCellStyle(center);
	     
	     
	     row.setHeight((short)1000);
	 }
	 
	 autoSizeColumns(worksheet, 17);
	 
	 excelName = "모니터 신청자목록";
	 return workbook;
	}
	
	
	/***
	 * 
	 * @param model
	 * @param workbook
	 * @return
	 * @throws Exception
	 */
	protected Object buildApplicantApply(Map<String, Object> model, Workbook workbook) throws Exception {
		
		 String excelName = model.get("target").toString();
		 Sheet worksheet = null;
		 Row row = null;
		 
		 worksheet = workbook.createSheet(excelName+ " WorkSheet");
		 	 
		 CellStyle center = workbook.createCellStyle();
		 center.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		 center.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
		 //center.setWrapText(true);
		 CellStyle vCenter = workbook.createCellStyle();
		 vCenter.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		 
		 @SuppressWarnings("unchecked")
		 List<MonitorsVO> list = (List<MonitorsVO>)((List<Object>)model.get("excelList")).get(0);
		 
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
		     cell0.setCellValue(i);
		     cell0.setCellStyle(center);
		
		     Cell cell1 = row.createCell(1);
		     cell1.setCellValue(list.get(i-1).getMember_name());
		     cell1.setCellStyle(center);
		     
		     Cell cell3 = row.createCell(2);
		     cell3.setCellValue(list.get(i-1).getPhone());
		     cell3.setCellStyle(center);
		     
		     row.setHeight((short)1000);
		 }
		 
		 autoSizeColumns(worksheet, 2);
		 
		 return workbook;
		 
	}

	/***
	 * 응답목록 엑셀 만들기	 
	 * @param model
	 * @param workbook
	 * @return
	 * @throws Exception
	 */
	protected Object buildAnswer(Map<String, Object> model, Workbook workbook) throws Exception {
		
		 String excelName = model.get("target").toString();
		 Sheet worksheet = null;
		 Row row = null;
		 
		 worksheet = workbook.createSheet(excelName+ " WorkSheet");
		 	 
		 CellStyle center = workbook.createCellStyle();
		 center.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		 center.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
		 //center.setWrapText(true);
		 CellStyle vCenter = workbook.createCellStyle();
		 vCenter.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		 
		 
		 @SuppressWarnings("unchecked")
		 List<AnswersVO> a_list = (List<AnswersVO>)((List<Object>)model.get("excelList")).get(0);

		 
		 //이런식으로 넣었던 번지수에 접근해서 가져와야한다.
		 @SuppressWarnings("unchecked")
		 List<QuestionVO> q_list = (List<QuestionVO>)((List<Object>)model.get("excelList")).get(1); 
		 
		 int temp_num = 4;
		 int colNums = 0;
		 
		                     
	     row = worksheet.createRow(0);                                  
	   
	     Cell t_cell0 = row.createCell(0);
	     t_cell0.setCellValue("번호");
	     t_cell0.setCellStyle(center);
	     
	     Cell t_cell1 = row.createCell(1);
	     colNums = colNums + 1;
	     t_cell1.setCellValue("재출일");
	     t_cell1.setCellStyle(center);

	     Cell t_cell2 = row.createCell(2);
	     colNums = colNums + 1;
	     t_cell2.setCellValue("아이디");
	     t_cell2.setCellStyle(center);

	     Cell t_cell3 = row.createCell(3);
	     colNums = colNums + 1;
	     t_cell3.setCellValue("이름");
	     t_cell3.setCellStyle(center);

	     Cell t_cell4 = row.createCell(4);
	     colNums = colNums + 1;
	     t_cell4.setCellValue("신청조");
	     t_cell4.setCellStyle(center);                
	     
	     // 신청조 다음으로 N개의 문항이 시작돼서 이런식으로 해야한다.

		 temp_num = 4;
		 
		 //컬럼갯수 기본값 설정
		 
		 // 상단 문항번호 n개 만들기 
		 for (int i = 0 ; i < q_list.size() ; i++)
		 {
		 	if ( q_list.get(i).getType().equals("R") )
		 	{
				for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
				{
		            Cell t_cell5 = row.createCell(++temp_num);
		            colNums = colNums + 1;
		            String cVal = "문(척도)"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num();
		       
		            t_cell5.setCellValue(cVal);
		            t_cell5.setCellStyle(center);	
		            
				}
			} else if ( q_list.get(i).getType().equals("W") )
			{
				for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
				{
		            Cell t_cell5 = row.createCell(++temp_num);
		            colNums = colNums + 1;
		            String cVal = "문(서술)"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num();
		       
		            t_cell5.setCellValue(cVal);
		            t_cell5.setCellStyle(center);                	
				}
			}else if ( q_list.get(i).getType().equals("M") )
			{
				for(int j = 0 ; j < q_list.get(i).getOptionVO().size() ; j++)
				{
		            Cell t_cell5 = row.createCell(++temp_num);
		            colNums = colNums + 1;
		            String cVal = "문(중복)"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num();
		       
		            t_cell5.setCellValue(cVal);
		            t_cell5.setCellStyle(center);
		            
		            for (int s_temp = 0 ; s_temp < q_list.get(i).getOptionVO().size() ; s_temp ++)
				    {
		            	
		            	String descYn = q_list.get(i).getOptionVO().get(s_temp).getDescyn(); 
				       	if ( !ObjectUtils.isEmpty(descYn) && "Y".equals(descYn))
				       	{
		                   Cell t_cell6 = row.createCell(++temp_num);
		                   colNums = colNums + 1;
		                   cVal = "문(중복)"+q_list.get(i).getQuestion_num()+"서술";
		                   
		                   t_cell6.setCellValue(cVal);
		                   t_cell6.setCellStyle(center);
		               
				        }
				    }
				}
			}
			else if ( q_list.get(i).getType().equals("O") )
			{
				for(int j = 0 ; j < q_list.get(i).getRequired_cnt() ; j++)
				{
		            Cell t_cell5 = row.createCell(++temp_num);
		            colNums = colNums + 1;
		            String cVal = "문(서열)"+q_list.get(i).getQuestion_num()+"_"+q_list.get(i).getOptionVO().get(j).getOptions_num();
		               
		            t_cell5.setCellValue(cVal);
		            t_cell5.setCellStyle(center);                	
				}
			}                 	
			else if ( q_list.get(i).getType().equals("S") )
			{
		       Cell t_cell5 = row.createCell(++temp_num);
		       colNums = colNums + 1;
		       String cVal = "문(단일)"+q_list.get(i).getQuestion_num();
		       
		       t_cell5.setCellValue(cVal);
		       t_cell5.setCellStyle(center);  
		       
		       for (int s_temp = 0 ; s_temp < q_list.get(i).getOptionVO().size() ; s_temp ++)
		       {
		       	if (q_list.get(i).getOptionVO().get(s_temp).getDescyn() != null)
		       	{
		               if (q_list.get(i).getOptionVO().get(s_temp).getDescyn().equals("Y"))
		               {
		                   Cell t_cell6 = row.createCell(++temp_num);
		                   colNums = colNums + 1;
		                   cVal = "문(단일)"+q_list.get(i).getQuestion_num()+"서술";
		                   
		                   t_cell6.setCellValue(cVal);
		                   t_cell6.setCellStyle(center);
		               }
		
		       	}                        		                        	
		       }
		
			}
			else if ( q_list.get(i).getType().equals("T") )
			{
		
				Cell t_cell5 = row.createCell(++temp_num);
				colNums = colNums + 1;
				String cVal = "문(첨부)"+q_list.get(i).getQuestion_num()+"_서술";
		        
		        t_cell5.setCellValue(cVal);
		        t_cell5.setCellStyle(center);                	
		        
		        
		        if (q_list.get(i).getOptionVO().get(0).getLabel_1().equals("img") )
		        {
		    		Cell t_cell6 = row.createCell(++temp_num);
		    		colNums = colNums + 1;
		            t_cell6.setCellValue("문(첨부)"+q_list.get(i).getQuestion_num()+"_이미지");
		            t_cell6.setCellStyle(center);                	                        	
		        }else{
		    		Cell t_cell6 = row.createCell(++temp_num);
		    		colNums = colNums + 1;
		            t_cell6.setCellValue("문(첨부)"+q_list.get(i).getQuestion_num()+"_파일");
		            t_cell6.setCellStyle(center);                	
		        	
		        }
		        
		        
			}
			else{
		        Cell t_cell5 = row.createCell(++temp_num);
		        colNums = colNums + 1;
		        t_cell5.setCellValue("문"+q_list.get(i).getQuestion_num());
		        t_cell5.setCellStyle(center);                
			}
		}

		 
		 //응답처리부
		 for(int i=1;i<a_list.size()+1;i++){
			 
			 String cVal = ""; 
		     row = worksheet.createRow(i);
		
		     Cell cell0 = row.createCell(0);
		     cell0.setCellValue(i);
		     cell0.setCellStyle(center);
		
		     Cell cell1 = row.createCell(1);
		     
	     if (a_list.get(i-1).getRegdate() == null) 
	     {
	     	cell1.setCellValue("");
		 }
		 else
		 {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		 	cell1.setCellValue(sdf.format(a_list.get(i-1).getRegdate()));
		 }
		 cell1.setCellStyle(center);
		 
		 Cell cell2 = row.createCell(2);
		 cVal = a_list.get(i-1).getMember_id();
		 cVal = ObjectUtils.isEmpty(cVal) ? "" : cVal;
		 cell2.setCellValue(cVal);
		 cell2.setCellStyle(center);
		 
		 Cell cell3 = row.createCell(3);
		 cVal = a_list.get(i-1).getMember_name();
		 cVal = ObjectUtils.isEmpty(cVal) ? "" : cVal;
		 cell3.setCellValue(cVal);
		 cell3.setCellStyle(center);
		 
		 Cell cell4 = row.createCell(4);
		 cVal = a_list.get(i-1).getTeam_num();
		 cVal = ObjectUtils.isEmpty(cVal) ? "" : cVal;
		 cell4.setCellValue(cVal);
		 cell4.setCellStyle(center);
		 
		 temp_num = 4;
		 
		 //답변이 비어 있을때를 대비하여 초기화를 시행하고 있을때만 스플릿을 한다.
		 String[] temp_arr = null;
		 
		 if(!ObjectUtils.isEmpty(a_list.get(i-1).getAnswers())){
		 	temp_arr = a_list.get(i-1).getAnswers().split("\\|");
		 }
		 int a_index = 0;
		 
		 for (int z = 0 ; z < q_list.size() ;z++ )
		 {
		 	if (temp_arr == null || temp_arr.length <= a_index)
		 	{
		 	// OutOfbounds 에러 때문에 index 가 증가되는것을 사전에 보고 없는 배열번지수를 참조할 수 없게 만듦.
	     		break;
			}
			
			if (temp_arr == null || temp_arr[a_index].length() <= 1)
			{
				// 응답을 시작해놓고 답변을 하나도 작성하지않은 유저를 걸러냄.
		 		a_index++;
				continue;
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
				    cVal = s_temp_arr[j];
				    cVal = ObjectUtils.isEmpty(cVal) ? "" : cVal;
				    cell5.setCellValue(cVal.replaceAll("<br>", "\r\n"));
				    
				    cell5.setCellStyle(temp_type.equals("W") ? vCenter : center);
				}
			}
			else if (temp_type.equals("O"))
			{                            
				String[] s_temp_arr = temp_arr[a_index].split("#");
			
				for (int j = 1 ; j < temp_arr[a_index].split("#").length ; j++)
				{                        		                      		
			        Cell cell5 = row.createCell(++temp_num);
			        cVal = s_temp_arr[j];
				    cVal = ObjectUtils.isEmpty(cVal) ? "" : cVal;
			        cell5.setCellValue(cVal);
			        cell5.setCellStyle(center);
				} 	                    		
			}
			else if (temp_type.equals("M"))
			{                            
				String[] s_temp_arr = temp_arr[a_index].split("#");
				int m_index = 1;
			
				for (int j = 1 ; j < q_list.get(z).getOptionVO().size()+1 ; j ++)
				{
				
					if (s_temp_arr.length > m_index)
					{
						if ( Integer.parseInt(s_temp_arr[m_index]) == j)
						{
							Cell cell5 = row.createCell(++temp_num);
							cell5.setCellValue("1");
							cell5.setCellStyle(center); 	  
							m_index++;
						}else{
							Cell cell5 = row.createCell(++temp_num);
							cell5.setCellValue("");
							cell5.setCellStyle(center); 	                        		
						}
					}else{
						Cell cell5 = row.createCell(++temp_num);
						cell5.setCellValue("");
						cell5.setCellStyle(center); 	                        		
					}
					
					String descYn = q_list.get(z).getOptionVO().get(j).getDescyn();
					//서술형 답변일 경우 데이터 처리부분
					if (!ObjectUtils.isEmpty(descYn) && "Y".equals(descYn))
			      	{
		      		
						if ( temp_arr[a_index].contains("^") ){
							Cell cell6 = row.createCell(++temp_num);
							String eVal = temp_arr[a_index]; //전체답변
							cVal = eVal.substring(eVal.indexOf("^") + 1 ); //전체답변에서 보기번호를제외한 것
							
							cell6.setCellValue(cVal);
							cell6.setCellStyle(center);
						}else{
							Cell cell6 = row.createCell(++temp_num);
							cell6.setCellValue("");
						    cell6.setCellStyle(center);
		      			}
		
		      		
			      	}
					
				}
				
			} 	                         
			else if (temp_type.equals("B"))
			{
			    Cell cell5 = row.createCell(++temp_num);
			    cell5.setCellValue("게시판 형 질문");
			    cell5.setCellStyle(center);
			}
			else if (temp_type.equals("S")) //단일응답형 처리
			{
				String s_type_string = temp_arr[a_index].substring(temp_arr[a_index].indexOf(":")+1, temp_arr[a_index].indexOf(":")+2);
				 	                        	
				Cell cell5 = row.createCell(++temp_num);
				cell5.setCellValue(s_type_string);
				cell5.setCellStyle(center);
				//System.out.println(" 단일응답형 자로 : " + s_type_string);
			   //옵션검색	
			   for (int s_temp = 0 ; s_temp < q_list.get(z).getOptionVO().size() ; s_temp ++)
			   {
			      	if (q_list.get(z).getOptionVO().get(s_temp).getDescyn() != null)
			      	{
			      		if (q_list.get(z).getOptionVO().get(s_temp).getDescyn().equals("Y")) {
							if ( temp_arr[a_index].contains("#") ){
								Cell cell6 = row.createCell(++temp_num);
								String eVal = temp_arr[a_index]; //전체답변
								String eNos = eVal.substring(eVal.indexOf(":")+1, eVal.indexOf("#")); //보기번호
								cVal = eVal.substring(eVal.indexOf("#") + 1, eVal.length() ); //전체답변에서 보기번호를제외한 것
								System.out.println(eVal);
								System.out.println(eNos);
								System.out.println(cVal);
								
								cell6.setCellValue(cVal);
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
				
				Cell cell5_ = row.createCell(++temp_num);
				//첨부된 파일의 내용이 있을때 처리 없으면 ""
				String t_type_temp = null;
				
				int sIndex = temp_arr[a_index].indexOf("#")+1;
				int eIndex = temp_arr[a_index].indexOf("Ω");
				if (eIndex > 1 && sIndex != eIndex){ //파일을 포함할 경우
					t_type_temp = temp_arr[a_index].substring(sIndex, eIndex);
				}else if(sIndex == eIndex){ //서술 데이터가 없는 경우
					t_type_temp = "";
				}else { //기타 파일첨부 안한 경우
					t_type_temp = temp_arr[a_index].substring(sIndex, temp_arr[a_index].length());	
				}
				
				t_type_temp = !ObjectUtils.isEmpty(t_type_temp) ? t_type_temp.replaceAll("<br>", "\r\n") : "";
				//System.out.println(" 삽입하는 값은 : " + t_type_temp);
				
				cell5_.setCellValue(t_type_temp);
				cell5_.setCellStyle(vCenter);
					                            
				
				//첨부 스타일이 이미지 일때
				if ( q_list.get(z).getOptionVO().get(0).getLabel_1().equals("img") )
				{	                            				                            	                           
				    if ( eIndex > 1)
				    {
				    	Cell cell6 = row.createCell(++temp_num);	
						cell6.setCellValue("이미지");
					    cell6.setCellStyle(center);
					        						   	              
					}else{
					    Cell cell6 = row.createCell(++temp_num);
					    cell6.setCellValue("");
				        cell6.setCellStyle(center);
				    }
				}else{
				    Cell cell6 = row.createCell(++temp_num);
				    if( eIndex > 1) {
				    	cell6.setCellValue("일반파일");
				    }else {
				    	cell6.setCellValue("");
				    }
				        cell6.setCellStyle(center);
				}
				    
			}else{
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
					        
							if (q_list.get(z).getOptionVO().get(p).getDescyn() != null)
							{
						    	if (q_list.get(z).getOptionVO().get(p).getDescyn().equals("Y"))
								{
									Cell cell6 = row.createCell(++temp_num);
								    cell6.setCellValue("");
					                cell6.setCellStyle(center);
					        	}
					    	}
					        
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
		                                                           
		     //row.setHeight((short)1000);
		 }
		 
		 File img_temp_del = new File(img_temp_path);
		 deleteFolder(img_temp_del);
		 autoSizeColumns(worksheet, colNums);
					 
		 return workbook;
	}
	
	
	protected Object buildMemberManage(Map<String, Object> model, Workbook workbook) throws Exception {
		
		 String excelName = model.get("target").toString();
		 Sheet worksheet = null;
		 Row row = null;
		 
		 worksheet = workbook.createSheet(excelName+ " WorkSheet");
		 	 
		 CellStyle center = workbook.createCellStyle();
		 center.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		 center.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
		 //center.setWrapText(true);
		 CellStyle vCenter = workbook.createCellStyle();
		 vCenter.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		 
		 @SuppressWarnings("unchecked")
			List<MemberManagerVO> list = (List<MemberManagerVO>)((List<Object>)model.get("excelList")).get(0);
		 

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
		 cell0.setCellValue(i);
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
		 String bday = list.get(i-1).getBirthday();
		 bday = bday.length() >= 8 ? bday.substring(0, 8) : bday;
		 cell4.setCellValue(bday);                     
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
		
		
		 
		 //가입일자
		 if (list.get(i-1).getRegdate() == null)
		 {
		     Cell cell16 = row.createCell(16);
		     cell16.setCellValue("");
		         cell16.setCellStyle(center);
		     }
		     else{
		    	 
		    	 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		    	 String regdate = df.format(list.get(i-1).getRegdate());
		                          
		    	 Cell cell16 = row.createCell(16);
		    	 cell16.setCellValue(regdate);
		    	 cell16.setCellStyle(center);
		     }
		     
		 }

		 autoSizeColumns(worksheet, 16);
		 
		 return workbook;
		 
	}
	
	
	protected Object buildMoney(Map<String, Object> model, Workbook workbook) throws Exception {
		
		 String excelName = model.get("target").toString();
		 Sheet worksheet = null;
		 Row row = null;
		 
		 worksheet = workbook.createSheet(excelName+ " WorkSheet");
		 	 
		 CellStyle center = workbook.createCellStyle();
		 center.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		 center.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
		 //center.setWrapText(true);
		 CellStyle vCenter = workbook.createCellStyle();
		 vCenter.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		 
		 @SuppressWarnings("unchecked")
		 List<MonitorApplyVO> list = (List<MonitorApplyVO>)((List<Object>)model.get("excelList")).get(0);

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
	     t_cell3.setCellValue("거래처구분");
	     t_cell3.setCellStyle(center);
	     	     
	     Cell t_cell4 = row.createCell(4);
	     t_cell4.setCellValue("생년월일");
	     t_cell4.setCellStyle(center);                

	     Cell t_cell5 = row.createCell(5);
	     t_cell5.setCellValue("입금유형");
	     t_cell5.setCellStyle(center);                

	     Cell t_cell6 = row.createCell(6);
	     t_cell6.setCellValue("은행");
	     t_cell6.setCellStyle(center);                                                

	     Cell t_cell8 = row.createCell(7);
	     t_cell8.setCellValue("계좌번호");
	     t_cell8.setCellStyle(center);                                 

	     Cell t_cell9 = row.createCell(8);
	     t_cell9.setCellValue("공급가액");
	     t_cell9.setCellStyle(center);                                                  
	     
	     Cell t_cell10 = row.createCell(9);
	     t_cell10.setCellValue("휴대폰번호");
	     t_cell10.setCellStyle(center);
	     
	     Cell t_cell11 = row.createCell(10);
	     t_cell11.setCellValue("제출수");
	     t_cell11.setCellStyle(center);
	     
	     
		 for(int i=1;i<list.size()+1;i++){
		     row = worksheet.createRow(i);
		
		     Cell cell0 = row.createCell(0);
		     cell0.setCellValue(i);
		     cell0.setCellStyle(center);
		     
		     Cell cell1 = row.createCell(1);
		     cell1.setCellValue(list.get(i-1).getMember_id());
		     cell1.setCellStyle(center);
		     
		     Cell cell2 = row.createCell(2);
		     cell2.setCellValue(list.get(i-1).getMember_name());
		     cell2.setCellStyle(center);
		     
		     Cell cell3 = row.createCell(3);
		     cell3.setCellValue("30:개인");
		     cell3.setCellStyle(center);
		     
		     
		     Cell cell4 = row.createCell(4);
		     String b_temp = list.get(i-1).getBirth().substring(0 , 8);
		     cell4.setCellValue(b_temp);
		     cell4.setCellStyle(center);
		     
		     Cell cell5 = row.createCell(5);
		     cell5.setCellValue("10:계좌이체");
	         cell5.setCellStyle(center);
	         
	         Cell cell6 = row.createCell(6);
	         cell6.setCellValue(list.get(i-1).getBank());
	         cell6.setCellStyle(center);
	         
	         Cell cell8 = row.createCell(7);
	         cell8.setCellValue(list.get(i-1).getBank_num());
	         cell8.setCellStyle(center);
	         
	         int t_pay = Integer.valueOf(list.get(i-1).getPay());	         
	         int t_cnt = Integer.valueOf(list.get(i-1).getSend_cnt());
	         
	         Cell cell9 = row.createCell(8);
	         cell9.setCellValue(String.valueOf((t_pay * t_cnt)));
	         cell9.setCellStyle(center);
	         
	         Cell cell10 = row.createCell(9);
	         cell10.setCellValue(list.get(i-1).getPhone());
	         cell10.setCellStyle(center);
	         
	         Cell cell11 = row.createCell(10);
	         cell11.setCellValue(list.get(i-1).getSend_cnt());
	         cell11.setCellStyle(center);
	         
	     }
	 
	 	autoSizeColumns(worksheet, 11);   
	 
	 	return workbook;
		 
	}
	
	
	protected Object buildUnFinished(Map<String, Object> model, Workbook workbook) throws Exception {
		
		 String excelName = model.get("target").toString();
		 Sheet worksheet = null;
		 Row row = null;
		 
		 worksheet = workbook.createSheet(excelName+ " WorkSheet");
		 	 
		 CellStyle center = workbook.createCellStyle();
		 center.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		 center.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
		 //center.setWrapText(true);
		 CellStyle vCenter = workbook.createCellStyle();
		 vCenter.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		 
		 @SuppressWarnings("unchecked")
		 List<MonitorsVO> list = (List<MonitorsVO>)((List<Object>)model.get("excelList")).get(0);
		 
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
	     t_cell3.setCellValue("연락처");
	     t_cell3.setCellStyle(center);                

	     
		 for(int i=1;i<list.size()+1;i++){
		     row = worksheet.createRow(i);
		
		     Cell cell0 = row.createCell(0);
		     cell0.setCellValue(i);
		     cell0.setCellStyle(center);
		
		     Cell cell1 = row.createCell(1);
		     cell1.setCellValue(list.get(i-1).getMember_id());
		     cell1.setCellStyle(center);
		     
		     Cell cell2 = row.createCell(2);
		     cell2.setCellValue(list.get(i-1).getMember_name());
		     cell2.setCellStyle(center);
		     
		     Cell cell3 = row.createCell(3);
		     cell3.setCellValue(list.get(i-1).getPhone());
		     cell3.setCellStyle(center);
		  
		 }
		 
		 autoSizeColumns(worksheet, 4);
		 
		 return workbook;
		 
	}
	
	
	protected Object buildExtra(Map<String, Object> model, Workbook workbook) throws Exception {
		
		 String excelName = model.get("target").toString();
		 Sheet worksheet = null;
		 Row row = null;
		 
		 worksheet = workbook.createSheet(excelName+ " WorkSheet");
		 	 
		 CellStyle center = workbook.createCellStyle();
		 center.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		 center.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); 
		 //center.setWrapText(true);
		 CellStyle vCenter = workbook.createCellStyle();
		 vCenter.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		 
		 
		 
		 return workbook;
		 
	}
		 
}