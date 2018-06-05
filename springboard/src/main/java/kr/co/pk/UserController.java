package kr.co.pk;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.pk.domain.User;
import kr.co.pk.service.UserService;

@Controller
public class UserController {
	//user/register 라는 요청이 오면 user/register.jsp 파일로 포워딩
	@RequestMapping(value="user/register", method=RequestMethod.GET)
	public String register(Model model) {
		return "user/register";
	}
	@Autowired
	private UserService userService;
	//회원가입을 처리하는 메소드
	@RequestMapping(value="user/register", method=RequestMethod.POST)
	//RedirectAttributes는 redirect로 이동할 때 한번만 전달되는 데이터를 보관하는 Spring의 클래스
	public String register(MultipartHttpServletRequest request, RedirectAttributes attr) {
		userService.register(request);
		attr.addFlashAttribute("msg", "회원가입");
		//삽입, 삭제, 갱신 다음에는 리다이렉트로 이동
		return "redirect:/";
	}
	@RequestMapping(value="user/login", method=RequestMethod.GET)
	public String login(Model model) {
		return "user/login";
	}
	@RequestMapping(value="user/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model model, RedirectAttributes attr, HttpSession session) {
		User user = userService.login(request);
		//로그인에 실패한 경우
		if(user == null) {
			attr.addFlashAttribute("msg", "없는 이메일이거나 잘못된 비밀번호");
			return "redirect:login";
		}
		//로그인에 성공한 경우
		else {
			session.setAttribute("user", user);
			return "redirect:/";
		}
	}
}
