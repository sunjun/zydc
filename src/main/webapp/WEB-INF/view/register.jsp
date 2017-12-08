<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/common/tagPage.jsp" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Document</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
    <style>
        html,
        body {
            height: 100%;
            background-color: #00BFA5;
        }

        html {
            display: table;
            margin: auto;
        }

        body {
            display: table-cell;
            vertical-align: middle;
            color: #404d5b;
        }

        .margin {
            margin: 0 !important;
        }

        .card-panel {
            min-width: 350px;
        }

        #usertiger,
        #emailtiger,
        #pwtiger,
        #pwagaintiger,
        #phonetiger {
            font-style: normal;
            font-size: 14px;
            font-family: "微软雅黑";
            color: red;
        }
    </style>
    <!--[if IE]>
    <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
    <![endif]-->
</head>

<body>
<div id="login-page" class="row" style="width:30%;">
    <div class="col s12 z-depth-6 card-panel">
        <form class="login-form">
            <div class="row">
                <div class="input-field col s12 center">
                    <!--  <img src="http://w3lessons.info/logo.png" alt="" class="responsive-img valign profile-image-login"> -->
                    <!--  <p class="center login-form-text" style="padding-top:20px;">请注册你的个人信息</p> -->
                </div>
            </div>
            <div class="row margin">
                <div class="input-field col s8">
                    <i class="mdi-social-person-outline prefix"></i>
                    <input id="username" type="text" class="validate">
                    <label for="username" class="center-align">用户名</label>
                </div>
                <i class="input-field col s4" id="usertiger"></i>
            </div>
            <div class="row margin">
                <div class="input-field col s8">
                    <i class="mdi-communication-email prefix"></i>
                    <input id="email" type="email" class="validate">
                    <label for="email" class="center-align">邮箱Email</label>
                </div>
                <i class="input-field col s4" id="emailtiger"></i>
            </div>
            <div class="row margin">
                <div class="input-field col s8">
                    <i class="mdi-action-lock-outline prefix"></i>
                    <input id="password" type="password" class="validate">
                    <label for="password">密码</label>
                </div>
                <i class="input-field col s4" id="pwtiger"></i>
            </div>
            <div class="row margin">
                <div class="input-field col s8">
                    <i class="mdi-action-lock-outline prefix"></i>
                    <input id="password-again" class="pass_again" type="password">
                    <label for="password-again">再次输入密码</label>
                </div>
                <i class="input-field col s4" id="pwagaintiger"></i>
            </div>
            <div class="row margin">
                <div class="input-field col s8">
                    <i class="material-icons prefix">vpn_key</i>
                    <input id="password-again" class="password_again" type="password">
                    <label for="password-again">输入手机验证码</label>
                </div>
                <i class="input-field col s4" id="phonetiger"></i>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <a class="btn waves-effect waves-light col s12" id="newclick">立刻注册</a>
                </div>
                <div class="input-field col s12">
                    <!--   <p class="margin center medium-small sign-up">已经有了账号? <a href="index.html">登录</a></p> -->
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>

<!--materialize js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
<script src="../htgljs/zc.js"></script>
<script>
    !function (window, document, $, undefined) {
        var init = function () {
            bindevent()
            donwfocus()
            passblur()
        };

        var bindevent = function () {
            $("#newclick").on('click', onnewbtnclick);
        }
        var donwfocus = function () {
            $('#username,#email,#password,.password_again').focus(donwtxt);
        }
        var passblur = function () {
            $(".pass_again").blur(passblurtxt)
            $("#username").keyup(passblurtxt)
        }

        var onnewbtnclick = function () {

            // var url ="";
            // var data = username:$("#username").val;
            // $('#gooddlg').modal();
            var name = $("#username").val();
            var email = $("#email").val();
            var password = $("#password").val();
            var pass_again = $(".pass_again").val();
            var password_again = $(".password_again").val();
            if (name.length == 0) {
                $("#usertiger").text("用户名不能为空");
            }
            // var zheng =/^[\w\.]+@[\w\.]+(\.\w+)+$/;
            //           if(!zheng.test(email)&&!email.length==0){
            //               $("#emailtiger").text("邮箱格式错误");
            //           }else{
            //  $("#emailtiger").text("请输入邮箱名");

            //           }
            if (email.length == 0) {
                $("#emailtiger").text("请输入邮箱名")
            }
            if (password.length == 0) {
                $("#pwtiger").text("请输入密码")
            }
            if (pass_again.length == 0) {
                $("#pwagaintiger").text("请再次输入密码")
            }
            if (password_again == 0) {
                $("#phonetiger").text("输入手机验证码")
            }
            // $("#username").focus(function(){

            //      $("#usertiger").text("输入中")

            // })


            $.ajax({
                type: 'POST',
                url: '/supplierUserController/register',
                data: JSON.stringify ({
                    "supplier_user_name": name,
                    "email": email,
                    "pass_word": password
                }),
                success: function(data) { alert('data: ' + data); },
                contentType: "application/json",
                dataType: 'json'
            });
        }
        var passblurtxt = function () {
            var password = $("#password").val();
            var pass_again = $(".pass_again").val();
            var name = $("#username").val();
            if (password !== pass_again) {
                $("#pwagaintiger").text("输入密码不一致")
            }
            if (name.length > 10) {
                $("#usertiger").text("用户名不得超过十位")
            } else {
                $("#usertiger").text("")
            }
        }

        var donwtxt = function () {
            var name = $("#username").val();
            var password = $("#password").val();
            var pass_again = $(".pass_again").val();
            var password_again = $(".password_again").val();
            $("#usertiger").text("")
            $("#emailtiger").text("")
            $("#pwtiger").text("")
            $("#pwagaintiger").text("")
            $("#phonetiger").text("")
        }
        $(document).ready(init);
    }(window, document, jQuery);
</script>
</body>

</html>