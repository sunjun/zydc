package com.zydc.ssm.module.user.controller;

import com.zydc.ssm.module.user.pojo.SupplierUser;
import com.zydc.ssm.module.user.service.SupplierUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.annotation.Resource;

@CrossOrigin(origins = "*", maxAge = 3600)
@Controller
@RequestMapping("/supplierUserController")
public class SupplierUserController {

    private static final Logger LOG = LoggerFactory.getLogger(SysUserController.class);


    @Resource
    private SupplierUserService supplierUserService;

    @RequestMapping("/index/{username}")
    public String index(@PathVariable("username") String username){
        //TODO::简单验证此用户是否有sessionid，待完善http://www.infoq.com/cn/articles/apache-shiro
		return "index";
	}

    @RequestMapping("/userCenter")
	public String userCenter(){
		return "index";
	}

    @RequestMapping("/register")
    public String register(){
        return "register";
    }
	@RequestMapping("/showUserToJspByName/{userName}")
	public String showUser(Model model,@PathVariable("userName") String userName){
		SupplierUser user = this.supplierUserService.getByName(userName);
		model.addAttribute("user", user);
		return "showUser";
	}

	@RequestMapping("/showUserToJsonByName/{userName}")
	@ResponseBody
	public SupplierUser showUser(@PathVariable("userName") String userName){
		SupplierUser user = this.supplierUserService.getByName(userName);
		return user;
	}

	@RequestMapping("/userInfo/{userName}")
	@ResponseBody
	public SupplierUser userInfo(@PathVariable("userName") String userName){
		SupplierUser user = this.supplierUserService.getByName(userName);
		return user;
	}

	@RequestMapping(value = "userInfo", method = RequestMethod.POST)
	@ResponseBody
	public String userInfoUpdate(@RequestBody String userJson){
        return "";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(@RequestBody String userJson) {
        try {
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(userJson);
            json = (JSONObject) parser.parse(userJson);

            LOG.debug(json.toJSONString());

            //TODO::检查用户是否存在，存在返回错误提示

            SupplierUser user = new SupplierUser();
            user.setSupplierUserName((String)json.get("supplier_user_name"));
            user.setEmail((String)json.get("email"));
            user.setPassWord((String)json.get("pass_word"));
            this.supplierUserService.insert(user);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "{\"success\":1}";
    }


	@RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestBody String userJson) {
        try {
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(userJson);
            json = (JSONObject) parser.parse(userJson);

            LOG.debug(json.toJSONString());

            //TODO::检查用户名密码是否正确，正确后更新或者插入session_id,登录成功，重定向到主页

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return "index";
    }

    //TODO::完善信息接口
}
