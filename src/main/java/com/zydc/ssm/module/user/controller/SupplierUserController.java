package com.zydc.ssm.module.user.controller;

import com.zydc.ssm.module.user.pojo.SupplierUser;
import com.zydc.ssm.module.user.service.SupplierUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javax.annotation.Resource;
import java.util.Date;

@Controller
@RequestMapping("/supplierUserController")
public class SupplierUserController {

    private static final Logger LOG = LoggerFactory.getLogger(SysUserController.class);


    @Resource
    private SupplierUserService supplierUserService;

    @RequestMapping("/userCenter")
	public String userCenter(){
		return "userCenter";
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

	@RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(@RequestBody String userJson) {
        try {
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(userJson);
            json = (JSONObject) parser.parse(userJson);

            LOG.debug(json.toJSONString());

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
}
