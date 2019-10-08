package com.luckylas.crm.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luckylas.crm.entity.User;
import com.luckylas.crm.service.LoginService;

@Controller
@RequestMapping("login")
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("toLogin.do")
	public String toLogin() {
		return "loginPage";
	}
	
	@RequestMapping("login.do")
	public String login(User u, HttpServletRequest request, HttpServletResponse response, ModelMap map) {
		User user = loginService.getUser(u.getuAccount(), u.getuPassword());
		if (user != null) {
			//数据库有该用户
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", user);
			if (u.getRemember() != null) {
				if (u.getRemember() == 1) {
					//记住用户账户和密码
					Cookie aCookie = new Cookie("uAccount", u.getuAccount());
					Cookie pCookie = new Cookie("uPassword", u.getuPassword());
					response.addCookie(aCookie);
					response.addCookie(pCookie);
				}
			}else {
				//不记住用户账户和密码，清除浏览器储存的用户账户和密码
				//获取到浏览器所有Cookie
				Cookie[] cookies = request.getCookies();
				for (Cookie c : cookies) {
					if (c.getName().equals("uAccount") || c.getName().equals("uPassword")) {
						System.out.println("================== ：删除Cookie");
						//删除该cookie
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			}
			return "redirect:/saleChance/listNotDisSC.do";
		}
		//账户密码错误，返回登录页面
		map.put("msg_loginFail", "账号或密码错误!");
		return "loginPage";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "forward:/login/toLogin.do";
	}
	
}
