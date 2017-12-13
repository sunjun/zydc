package com.zydc.ssm.module.user.controller;

import com.zydc.ssm.module.user.dao.DictionaryDataDao;
import com.zydc.ssm.module.user.pojo.DataDictionary;
import com.zydc.ssm.module.user.pojo.DictionaryName;
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
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

@CrossOrigin(origins = "*", maxAge = 3600)
@Controller
@RequestMapping("/supplierUserController")
public class SupplierUserController {

    private static final Logger LOG = LoggerFactory.getLogger(SysUserController.class);


    @Resource
    private SupplierUserService supplierUserService;

    private DictionaryDataDao dictionaryDataDao;

    public SupplierUserController() {
        dictionaryDataDao = new DictionaryDataDao();
    }

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

    @RequestMapping(value = "/attachmentInfo", method=RequestMethod.GET, produces={"application/json; charset=UTF-8"})
    @ResponseBody
    public String attachmentInfo() {
        int dictionaryId = 1;
        //DictionaryName dName = this.supplierUserService.getAttachmentTitle(dictionaryId);
        DictionaryName dName = dictionaryDataDao.getDictionNameById(dictionaryId);
        String attachmentTitle = dName.getDictionaryName();

        JSONObject json = new JSONObject();
        json.put("attachmentTitle", attachmentTitle);
        List<DataDictionary> dataList = dictionaryDataDao.getAllData();

        int i = 0;
        for (DataDictionary dataDictionary : dataList) {
            json.put("attachment" + Integer.toString(i), dataDictionary.getDictionaryContent());
            i++;
        }
        return json.toJSONString();
    }

    //TODO::完善信息接口
    @RequestMapping(value="/multipleSave", method=RequestMethod.POST )
    public @ResponseBody String multipleSave(@RequestParam("file") MultipartFile[] files){
        String fileName = null;
        String msg = "";
        if (files != null && files.length >0) {
            for(int i =0 ;i< files.length; i++){
                try {
                    fileName = files[i].getOriginalFilename();
                    byte[] bytes = files[i].getBytes();
                    BufferedOutputStream buffStream =
                            new BufferedOutputStream(new FileOutputStream(new File("~/cp/" + fileName)));
                    buffStream.write(bytes);
                    buffStream.close();
                    msg += "You have successfully uploaded " + fileName +"<br/>";
                } catch (Exception e) {
                    return "You failed to upload " + fileName + ": " + e.getMessage() +"<br/>";
                }
            }
            return msg;
        } else {
            return "Unable to upload. File is empty.";
        }
    }
}
