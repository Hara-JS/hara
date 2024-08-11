package com.homepage.hara;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// MVC 패턴에서 Controller를 담당하는 클래스

@Controller
public class LoginController {
	// 로그를 찍어주는 인터페이스
	private final Logger log = LoggerFactory.getLogger(getClass());
	
	@GetMapping("/")
	private String redirectSignInJsp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		log.info("==================== [ request : hello ] start ====================");
		return "redirect:/user/sign-in.jsp";
	}
	
	@GetMapping("user/join")
	private String redirectJoinJsp(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		log.info("==================== [ request : hello ] start ====================");
		return "redirect:/user/join.jsp";
	}

}
