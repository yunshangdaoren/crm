package crm;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.luckylas.crm.entity.Role;
import com.luckylas.crm.entity.User;
import com.luckylas.crm.service.RoleService;
import com.luckylas.crm.service.UserService;

public class TestRole {
	@Autowired
	private RoleService service;
	@Autowired
	private UserService uService;
	
	
	@Test
	public void test() {
		User user = uService.getUserById(1);
		System.out.println(user);
	}

}
