package com.spring.moon.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;

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
import com.spring.moon.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	EventService eventService;
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@RequestMapping(value = "/event/event")
	public String selectEvent(Model model) {
		logger.info("selectEvent");

		model.addAttribute("eventList", eventService.selectEvent());

		return "event/event";
	}
	
	@RequestMapping(value = "/event/insertEvent", method = {RequestMethod.GET})
	@ResponseBody
	public String insertEvent(Locale locale, EventDTO eventDTO) throws Exception {
		logger.info("insertEvent");

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = eventService.insertEvent(eventDTO);

		System.out.println("insert e_id : " + eventDTO.getE_id());
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		result.put("e_id", Integer.toString(eventDTO.getE_id()));

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/event/deleteEvent", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String productGroupDelete(Locale locale, EventDTO eventDTO) throws Exception {
		
		logger.info("deleteEvent");
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = eventService.deleteEvent(eventDTO);

		result.put("success", (resultCnt > 0) ? "Y" : "N");

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	 //productGroupInfo ���̺� prdgrIdx ���� ���� ���ڵ� ����
	@RequestMapping(value = "/event/updateEventAction", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String updateEventAction(Locale locale, EventDTO eventDTO)
			throws Exception {
		logger.info("updateEventAction");

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = eventService.updateEvent(eventDTO);

		System.out.println("update e_id : " + eventDTO.getE_id());

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		result.put("e_id", Integer.toString(eventDTO.getE_id()));

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}
	
	// productInfo ���̺� �߰��� ������������� ������ ���� ������ ���ε���
	@RequestMapping(value = "/event/{e_id}/fileUpload", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String fileUpload(MultipartHttpServletRequest multi, @PathVariable("e_id") int e_id) throws Exception {
		logger.info("fileUpload");
		
		// ��μ���
		String path = "C:"
				+ "/users/answh/Desktop/Spring"
				+ "/Moon/moon/src/main/webapp/resources/eventFileUpload/";
		
		System.out.println("path :: " + path);

		String fileReName = "";

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		String callbackMsg = "";

		File dir = new File(path);
		// ���丮�� ������� ����
		if (!dir.isDirectory()) {
			dir.mkdir();
			System.out.println("dir :: " + dir);
		} // end if

		Iterator<String> files = multi.getFileNames();

		// ������������ ������ŭ
		while (files.hasNext()) {

			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			System.out.println("���� ���� �̸� : " + fileName);
			fileReName = e_id + "_" + fileName;
			System.out.println("fileReName : " + fileReName);
			try {

				mFile.transferTo(new File(path + fileReName));
				result.put("success", "Y");
				result.put("fileName", fileReName);
				result.put("e_id", Integer.toString(e_id));
			} catch (Exception e) {// end try

				e.printStackTrace();
				result.put("success", "N");
			} // end catch
		} // end while

		callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);
		return callbackMsg;
	}

	// productInfo ���ڵ� ������ ���� ������ ���ε� �Ǿ��ִ� �ش� ���ϵ� ���� ����
	@RequestMapping(value = "/event/fileRemove", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String fileRemove(Locale locale, EventDTO eventDTO) throws Exception {
		
		logger.info("fileRemove");
		
		// ��μ���
		String path = "C:"
				+ "/users/answh/Desktop/Spring"
				+ "/Moon/moon/src/main/webapp/resources/eventFileUpload/";
		System.out.println("path :: " + path);

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		String callbackMsg = "";

		// ������ ���ϸ��� ������
		System.out.println(eventDTO.getE_img());
		File fileRemove = new File(path + eventDTO.getE_img());

		// ������ Y ���н� N �� HashMap�� ����
		if (fileRemove.delete()) {
			result.put("success", "Y");
		} else {// end if
			result.put("success", "N");
		} // end else

		callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);
		return callbackMsg;
	}

	// productInfo ���̺� ���ڵ� �߰��� �Ŀ� ���ε�� fileName �߰�
	@RequestMapping(value = "/event/{e_id}/{fileName}/fileNameUpdate", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String fileNameUpdate(Locale locale, @PathVariable("e_id") int e_id,
			@PathVariable("fileName") String fileName) throws Exception {
		logger.info("fileNameUpdate");

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		// prdIdx�� ���� ���� prdImg���� fileName������ ����
		int resultCnt = eventService.fileNameUpdate(e_id, fileName);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		result.put("e_id", Integer.toString(e_id));

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}
}
