# 接口文档说明

 [1.注册](#1)

 [2.登录](#2)


## <span id="1">注册接口</span>

* 地址 

```
/supplierUserController/register
```

* 传入参数类型POST

```
{
    "supplier_user_name": "供应商名称",
    "email": "111@qq.com",
    "pass_word": "123456"
}
```

* 测试

```
curl -H "Content-Type: application/json" -X POST -d '{"supplier_user_name":"sunjun"}' http://localhost:8080/supplierUserController/register
```

* 注册接口返回Json

```
{
    "success": true,
    "user_exist": false,
    "phone_exist": false
}
```


##  <span id="2">登录接口</span>

* 地址 

```
/supplierUserController/login
```

* 传入参数类型POST
 
```
{
    "user_name": "用户名",
    "password": "123456"
}
```

* 测试

```
curl -H "Content-Type: application/json" -X POST -d '{"user_name":"sunjun", "password":"123456"}' http://localhost:8080/supplierUserController/login
```

* 登录接口返回Json

```
{
    "success": true,
    "detail": "用户不存在或密码不正确"
}
```

