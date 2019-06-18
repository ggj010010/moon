package com.spring.moon.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.moon.common.CommonUtil;
import com.spring.moon.dto.EventDTO;
import com.spring.moon.dto.EventDetailDTO;
import com.spring.moon.dto.PatternDetailDTO;
import com.spring.moon.service.EventDetailService;
import com.spring.moon.service.PatternDetailService;

@Controller
public class PatternDetailController {
	
	@Autowired
	EventDetailService eventDetailService;
	@Autowired
	PatternDetailService patternDetailService;

	private static final Logger logger = LoggerFactory.getLogger(PatternDetailController.class);

	@RequestMapping("/pattern/patternDetail")
	@ResponseBody
	public String selectPatternDetail(Model model,EventDetailDTO ed) throws Exception{
		logger.info("selectPatternDetail" + ed.getEd_id());
		
		HashMap<String, Object> result = new HashMap<String,Object>();
		CommonUtil commonUtil = new CommonUtil(); 
		
		EventDetailDTO eventDetailDTO = new EventDetailDTO();
		List<PatternDetailDTO> patternDetailList = new ArrayList<PatternDetailDTO>();
		
		eventDetailDTO = eventDetailService.selectEventDetailOne(String.valueOf(ed.getEd_id()));
		patternDetailList = patternDetailService.selectPatternDetail(String.valueOf(ed.getEd_id()));
		
		model.addAttribute("eventDetailDTO",eventDetailDTO);
		model.addAttribute("patternDetailList",patternDetailList);

		result.put("eventDetailDTO",eventDetailDTO);
		result.put("patternDetailList",patternDetailList);
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/pattern/insertPatternDetail", method = {RequestMethod.GET})
	@ResponseBody
	public String insertPatternDetail(PatternDetailDTO patternDetailDTO,HttpServletRequest request) throws Exception {
		logger.info("insertPatternDetail");

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		String pd_sort = request.getParameter("pd_sort");
		if(pd_sort == "0") {
			pd_sort = "1";
		}
		
		patternDetailDTO.setPd_sort(Integer.parseInt(pd_sort));
		
		int resultCnt = patternDetailService.insertPatternDetail(patternDetailDTO);

		System.out.println("insert ed_id : " + patternDetailDTO.getEd_id());
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		result.put("ed_id", Integer.toString(patternDetailDTO.getEd_id()));
		result.put("pd_id", Integer.toString(patternDetailDTO.getPd_id()));

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}
	
	// productInfo 테이블에 추가시 파일이있을경우 파일을 서버 폴더에 업로드함
		@RequestMapping(value = "/pattern/{pd_id}/fileUpload", method = { RequestMethod.POST, RequestMethod.GET })
		@ResponseBody
		public String fileUpload(MultipartHttpServletRequest multi, @PathVariable("pd_id") int pd_id) throws Exception {
			logger.info("fileUpload");
			
			// 경로설정
			String path = "C:"
					+ "/users/answh/Desktop/Spring"
					+ "/Moon/moon/src/main/webapp/resources/patternDetailFileUpload/";
			
			System.out.println("path :: " + path);

			String fileReName = "";

			HashMap<String, String> result = new HashMap<String, String>();
			CommonUtil commonUtil = new CommonUtil();
			String callbackMsg = "";

			File dir = new File(path);
			// 디렉토리가 없을경우 생성
			if (!dir.isDirectory()) {
				dir.mkdir();
				System.out.println("dir :: " + dir);
			} // end if

			Iterator<String> files = multi.getFileNames();

			// 가져온파일의 갯수만큼
			while (files.hasNext()) {

				String uploadFile = files.next();
				MultipartFile mFile = multi.getFile(uploadFile);
				String fileName = mFile.getOriginalFilename();
				System.out.println("실제 파일 이름 : " + fileName);
				fileReName = pd_id + "_" + fileName;
				System.out.println("fileReName : " + fileReName);
				try {

					mFile.transferTo(new File(path + fileReName));
					result.put("success", "Y");
					result.put("fileName", fileReName);
					result.put("pd_id", Integer.toString(pd_id));
				} catch (Exception e) {// end try

					e.printStackTrace();
					result.put("success", "N");
				} // end catch
			} // end while

			callbackMsg = commonUtil.getJsonCallBackString(" ", result);

			System.out.println("callbackMsg::" + callbackMsg);
			return callbackMsg;
		}

		// productInfo 레코드 삭제시 서버 폴더에 업로드 되어있던 해당 파일도 같이 삭제
		@RequestMapping(value = "/pattern/fileRemove", method = { RequestMethod.POST, RequestMethod.GET })
		@ResponseBody
		public String fileRemove(Locale locale, PatternDetailDTO patternDetailDTO) throws Exception {
			
			logger.info("fileRemove");
			
			// 경로설정
			String path = "C:"
					+ "/users/answh/Desktop/Spring"
					+ "/Moon/moon/src/main/webapp/resources/patternDetailFileUpload/";
			System.out.println("path :: " + path);

			HashMap<String, String> result = new HashMap<String, String>();
			CommonUtil commonUtil = new CommonUtil();
			String callbackMsg = "";

			// 삭제할 파일명을 가져옴
			System.out.println(patternDetailDTO.getPd_img());
			File fileRemove = new File(path + patternDetailDTO.getPd_img());

			// 삭제시 Y 실패시 N 을 HashMap에 삽입
			if (fileRemove.delete()) {
				result.put("success", "Y");
			} else {// end if
				result.put("success", "N");
			} // end else

			callbackMsg = commonUtil.getJsonCallBackString(" ", result);

			System.out.println("callbackMsg::" + callbackMsg);
			return callbackMsg;
		}

		// productInfo 테이블에 레코드 추가시 후에 업로드된 fileName 추가
		@RequestMapping(value = "/pattern/{pd_id}/{fileName}/fileNameUpdate", method = RequestMethod.GET, produces = "application/json; charset=utf8")
		@ResponseBody
		public String fileNameUpdate(Locale locale, @PathVariable("pd_id") int pd_id,
				@PathVariable("fileName") String fileName) throws Exception {
			logger.info("fileNameUpdate");

			HashMap<String, String> result = new HashMap<String, String>();
			CommonUtil commonUtil = new CommonUtil();
			// prdIdx가 같은 곳에 prdImg값을 fileName값으로 수정
			int resultCnt = patternDetailService.fileNameUpdate(pd_id, fileName);

			result.put("success", (resultCnt > 0) ? "Y" : "N");
			result.put("pd_id", Integer.toString(pd_id));

			String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

			System.out.println("callbackMsg::" + callbackMsg);

			return callbackMsg;
		}
}
