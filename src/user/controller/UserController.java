package user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.bean.UserDTO;
import user.dao.UserDAO;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value="/writeForm.do", method=RequestMethod.GET)
	public String writeForm() {
		return "/user/writeForm";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write(@ModelAttribute UserDTO userDTO) {
		//DB
		userDAO.write(userDTO);
		return "/user/write";
	}
	
	@RequestMapping(value="/getUserList.do", method=RequestMethod.GET)
	public String getUserList() {
		return "/user/getUserList";
	}
	
	@RequestMapping(value="/getList.do", method=RequestMethod.POST)
	public ModelAndView getList() {
		List<UserDTO> list = userDAO.getUserList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;		 
	}
	
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	public @ResponseBody String checkId(@RequestParam String id) {
		if(id.equals("")) return "empty";
		
		UserDTO userDTO = userDAO.checkId(id);
		if(userDTO==null) return "not_exist";
		else return "exist";
	}
	
	@RequestMapping(value="/modifyForm.do", method=RequestMethod.GET)
	public String modifyForm() {
		return "/user/modifyForm";
	}
	
	@RequestMapping(value="/getUser.do", method=RequestMethod.POST)
	public ModelAndView getUser(@RequestParam String id) {
		Map<String,String> map = userDAO.getUser(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public @ResponseBody void modify(@RequestParam Map<String,String> map) {
		userDAO.modify(map);
	}
	
	@RequestMapping(value="/deleteForm.do", method=RequestMethod.GET)
	public String deleteForm() {
		return "/user/delete";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public @ResponseBody void delete(@RequestParam String id) {
		userDAO.delete(id);
	}
}
















