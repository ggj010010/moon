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

import com.spring.moon.HomeController;
import com.spring.moon.common.CommonUtil;
import com.spring.moon.dto.RoomDTO;
import com.spring.moon.service.RoomService;

@Controller
public class RoomController {

	@Autowired
	RoomService roomService;

	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);

	@RequestMapping(value = "/room/room")
	public String selectRoom(Model model) {
		logger.info("selectRoom");

		model.addAttribute("roomList", roomService.selectRoom());

		return "room/room";
	}
	
	@RequestMapping(value = "/room/insertRoom", method = {RequestMethod.GET})
	@ResponseBody
	public String insertRoom(Locale locale, RoomDTO roomDTO) throws Exception {
		logger.info("insertRoom");

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		int resultCnt = roomService.insertRoom(roomDTO);

		System.out.println("insert r_id : " + roomDTO.getR_id());
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		result.put("r_id", Integer.toString(roomDTO.getR_id()));

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	@RequestMapping(value = "/room/deleteRoom", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String productGroupDelete(Locale locale, RoomDTO roomDTO) throws Exception {
		
		logger.info("deleteRoom");
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = roomService.deleteRoom(roomDTO);

		result.put("success", (resultCnt > 0) ? "Y" : "N");

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}

	 //productGroupInfo ���̺� prdgrIdx ���� ���� ���ڵ� ����
	@RequestMapping(value = "/room/updateRoomAction", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String updateRoomAction(Locale locale, RoomDTO roomDTO)
			throws Exception {
		logger.info("updateRoomAction");

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = roomService.updateRoom(roomDTO);

		System.out.println("update r_id : " + roomDTO.getR_id());

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		result.put("r_id", Integer.toString(roomDTO.getR_id()));

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}
	
	// productInfo ���̺� �߰��� ������������� ������ ���� ������ ���ε���
	@RequestMapping(value = "/room/{r_id}/fileUpload", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String fileUpload(MultipartHttpServletRequest multi, @PathVariable("r_id") int r_id) throws Exception {
		logger.info("fileUpload");
		
		// ��μ���
		String path = "C:"
				+ "/users/answh/Desktop/Spring"
				+ "/Moon/moon/src/main/webapp/resources/roomFileUpload/";
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
			fileReName = r_id + "_" + fileName;
			System.out.println("fileReName : " + fileReName);
			try {

				mFile.transferTo(new File(path + fileReName));
				result.put("success", "Y");
				result.put("fileName", fileReName);
				result.put("r_id", Integer.toString(r_id));
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
	@RequestMapping(value = "/room/fileRemove", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String fileRemove(Locale locale, RoomDTO roomDTO) throws Exception {
		
		logger.info("fileRemove");
		
		// ��μ���
		String path = "C:"
				+ "/users/answh/Desktop/Spring"
				+ "/Moon/moon/src/main/webapp/resources/roomFileUpload/";
		System.out.println("path :: " + path);

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		String callbackMsg = "";

		// ������ ���ϸ��� ������
		System.out.println(roomDTO.getR_img());
		File fileRemove = new File(path + roomDTO.getR_img());

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
	@RequestMapping(value = "/room/{r_id}/{fileName}/fileNameUpdate", method = RequestMethod.GET, produces = "application/json; charset=utf8")
	@ResponseBody
	public String fileNameUpdate(Locale locale, @PathVariable("r_id") int r_id,
			@PathVariable("fileName") String fileName) throws Exception {
		logger.info("fileNameUpdate");

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		// prdIdx�� ���� ���� prdImg���� fileName������ ����
		int resultCnt = roomService.fileNameUpdate(r_id, fileName);

		result.put("success", (resultCnt > 0) ? "Y" : "N");
		result.put("r_id", Integer.toString(r_id));

		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}


}
