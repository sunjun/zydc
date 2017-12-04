package com.zydc.ssm.module.user.controller;

import com.zydc.ssm.module.user.pojo.SupplierUser;
import com.zydc.ssm.module.user.service.SupplierUserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

@Controller
@RequestMapping("/supplierUserController")
public class SupplierUserController {

    private static final Logger LOG = LoggerFactory.getLogger(SysUserController.class);


    @Resource
    private SupplierUserService supplierUserService;

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

}
