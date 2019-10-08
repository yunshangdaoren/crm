package crm;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.luckylas.crm.entity.User;
import com.luckylas.crm.entity.UserExample;
import com.luckylas.crm.mapper.UserMapper;

public class TestUser {
	private UserMapper mapper;
	
	@Test
	public void test() {
		UserExample example = new UserExample();
		example.or().andUAccountEqualTo("admin");
		System.out.println(mapper);
		System.out.println(example);
		List<User> users = mapper.selectByExample(example);
		for (User user : users) {
			System.out.println(user);
		}
//		example.or().andUIdEqualTo(1);
//		List<User> users = mapper.selectByExample(example);
//		for (User user : users) {
//			System.out.println(user);
//		}
		
	}

}
