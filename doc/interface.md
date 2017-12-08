# 接口说明

## 注册接口

* 类型POST
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

##注册接口返回Json

```
{
    "success": true,
    "user_exist": false,
    "phone_exist": false
}
```