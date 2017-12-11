<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/view/common/tagPage.jsp" %>
<!doctype html>
<html lang="en">
<head>
	 <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="images/android-desktop.png">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/css/materialize.min.css">
    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="images/favicon.png">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
    <link rel="stylesheet" href="htgl.css">
    <style>
    #view-source {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 40px;
      z-index: 900;
    }
    html {
      display: table;
      margin: auto;
  }
/*  body {
      display: table-cell;
      vertical-align: middle;
    color:#404d5b;
  }*/
  .margin {
    margin: 0 !important;
  }
  .card-panel{ min-width:350px;}
    #view-source {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 40px;
      z-index: 900;
    }
    </style>
  </head>
  <body>
    <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
      <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
        <div class="mdl-layout__header-row">
          <span class="mdl-layout-title">首页</span>
          <div class="mdl-layout-spacer"></div>
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
            <label class="mdl-button mdl-js-button mdl-button--icon" for="search">
              <i class="material-icons">search</i>
            </label>
            <div class="mdl-textfield__expandable-holder">
              <input class="mdl-textfield__input" type="text" id="search">
              <label class="mdl-textfield__label" for="search">Enter your query...</label>
            </div>
          </div>
          <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
            <i class="material-icons">more_vert</i>
          </button>
          <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
            <li class="mdl-menu__item">About</li>
            <li class="mdl-menu__item">Contact</li>
            <li class="mdl-menu__item">Legal information</li>
          </ul>
        </div>
      </header>
      <div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-80">
        <header class="demo-drawer-header">
          <img src="images/user.jpg" class="demo-avatar">
          <div class="demo-avatar-dropdown">
            <span>hello@example.com</span>
            <div class="mdl-layout-spacer"></div>
            <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
              <i class="material-icons" role="presentation">arrow_drop_down</i>
              <span class="visuallyhidden">Accounts</span>
            </button>
            <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
              <li class="mdl-menu__item"><a href="user_zl.html">完善信息</a></li>
              <li class="mdl-menu__item">info@example.com</li>
              <li class="mdl-menu__item"><i class="material-icons">add</i>Add another account...</li>
            </ul>
          </div>
        </header>
        <nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>首页</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">inbox</i>系统组织管理</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">delete</i>角色用户管理</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">report</i>权限资源管理 </a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">forum</i>其他数据管理</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">flag</i>Updates</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">local_offer</i>Promos</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">shopping_cart</i>Purchases</a>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">people</i>Social</a>
          <div class="mdl-layout-spacer"></div>
          <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
        </nav>
      </div>
      <main class="mdl-layout__content mdl-color--grey-100">
        <div id="login-page" class="row" style="width:35%;">
      <div class="col s12 z-depth-6 card-panel">
        <form class="login-form">
          <div class="row">
            <div class="input-field col s12 center">
             <!--  <img src="http://w3lessons.info/logo.png" alt="" class="responsive-img valign profile-image-login"> -->
             <!--  <p class="center login-form-text" style="padding-top:20px;">请注册你的个人信息</p> -->
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-social-person-outline prefix"></i>
              <input id="username" type="text" class="validate">
              <label for="username" class="center-align" id="usename">公司名称</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-communication-email prefix"></i>
              <input id="email" type="email" class="validate">
              <label for="email" class="center-align">组织机构代码</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="mdi-action-lock-outline prefix"></i>
              <input id="password" type="password" class="validate">
              <label for="password">税务登记证号</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">border_color</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">公司性质</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">location_on</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">公司所在地</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">domain</i>
             <!--  <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">公司住所</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">people_outline</i>
             <!--  <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">法人代表</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">attach_money</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">注册资金</label>
            </div>
          </div><div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">today</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">成立日期</label>
            </div>
          </div><div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">query_builder</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">营业期限</label>
            </div>
          </div><div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">view_carousel</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">经营范围</label>
            </div>
          </div><div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">local_convenience_store</i>
             <!--  <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">开户银行</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">iso</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">银行账号</label>
            </div>
          </div><div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">confirmation_number</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">服务类型</label>
            </div>
          </div>
         <!--  <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">present_to_all</i>
              <input id="password-again" type="password">
              <label for="password-again">附件1 上传扫描件 营业执照 组织机构代码证 税务登记证 银行开户许可证</label>
            </div>
          </div> -->
           <div class="file-field input-field">
            <div class="btn">
              <span>附件1(上传扫描件)</span>
              <input type="file">
            </div>
            <div class="file-path-wrapper">
              <input type="text" class="file-path validate">
            </div>
          </div>
         <!--  <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">clear_all</i>
              <input id="password-again" type="password">
              <label for="password-again">附件信息2 其他资质扫描件:(非必输项)</label>
            </div>
          </div> -->
         <!--  <ul class="collapsible" data-collapsible="accordion">
            <li>
              <div class="collapaible-header"><i class="material-icons">filter _drama</i></div>
              <div class="collapaible-body"><p>Lorem ipsum dolor sit amet</p></div>
            </li>
            <li>
              <div class="collapaible-header"><i class="material-icons">place</i>Second</div>
              <div class="collapaible-body"><p>Lorem ipsum dolor sit amet</p></div>
            </li>
            <li>
              <div class="collapaible-header"><i class="material-icons">whatshot</i>Third</div>
              <div class="collapaible-body"><p>Lorem ipsum dolor sit amet</p></div>
            </li>
          </ul> -->
          <div class="file-field input-field">
            <div class="btn">
              <span>上传营业执照</span>
              <input type="file">
            </div>
            <div class="file-path-wrapper">
              <input type="text" class="file-path validate">
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">contacts</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">联系人姓名</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">group_add</i>
             <!--  <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">联系人性别</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">contact_mail</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">常用邮箱</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">contact_phone</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">常用手机</label>
            </div>
          </div>
          <div class="row margin">
            <div class="input-field col s12">
              <i class="material-icons prefix">vpn_key</i>
              <!-- <i class="mdi-action-lock-outline prefix"></i> -->
              <input id="password-again" type="password">
              <label for="password-again">手机验证码</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <a href="register.html" class="btn waves-effect waves-light col s12">立刻注册</a>
            </div>
            <div class="input-field col s12">
            <!--   <p class="margin center medium-small sign-up">已经有了账号? <a href="index.html">登录</a></p> -->
            </div>
          </div>
        </form>
      </div>
    </div>
      </main>
    </div>
      <svg xmlns="http://www.w3.org/2000/svg" version="1.1" style="position: fixed; left: -1000px; height: -1000px;">
        <defs>
          <mask id="piemask" maskContentUnits="objectBoundingBox">
            <circle cx=0.5 cy=0.5 r=0.49 fill="white" />
            <circle cx=0.5 cy=0.5 r=0.40 fill="black" />
          </mask>
          <g id="piechart">
            <circle cx=0.5 cy=0.5 r=0.5 />
            <path d="M 0.5 0.5 0.5 0 A 0.5 0.5 0 0 1 0.95 0.28 z" stroke="none" fill="rgba(255, 255, 255, 0.75)" />
          </g>
        </defs>
      </svg>
      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 500 250" style="position: fixed; left: -1000px; height: -1000px;">
        <defs>
          <g id="chart">
            <g id="Gridlines">
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="27.3" x2="468.3" y2="27.3" />
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="66.7" x2="468.3" y2="66.7" />
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="105.3" x2="468.3" y2="105.3" />
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="144.7" x2="468.3" y2="144.7" />
              <line fill="#888888" stroke="#888888" stroke-miterlimit="10" x1="0" y1="184.3" x2="468.3" y2="184.3" />
            </g>
            <g id="Numbers">
              <text transform="matrix(1 0 0 1 485 29.3333)" fill="#888888" font-family="'Roboto'" font-size="9">500</text>
              <text transform="matrix(1 0 0 1 485 69)" fill="#888888" font-family="'Roboto'" font-size="9">400</text>
              <text transform="matrix(1 0 0 1 485 109.3333)" fill="#888888" font-family="'Roboto'" font-size="9">300</text>
              <text transform="matrix(1 0 0 1 485 149)" fill="#888888" font-family="'Roboto'" font-size="9">200</text>
              <text transform="matrix(1 0 0 1 485 188.3333)" fill="#888888" font-family="'Roboto'" font-size="9">100</text>
              <text transform="matrix(1 0 0 1 0 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">1</text>
              <text transform="matrix(1 0 0 1 78 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">2</text>
              <text transform="matrix(1 0 0 1 154.6667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">3</text>
              <text transform="matrix(1 0 0 1 232.1667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">4</text>
              <text transform="matrix(1 0 0 1 309 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">5</text>
              <text transform="matrix(1 0 0 1 386.6667 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">6</text>
              <text transform="matrix(1 0 0 1 464.3333 249.0003)" fill="#888888" font-family="'Roboto'" font-size="9">7</text>
            </g>
            <g id="Layer_5">
              <polygon opacity="0.36" stroke-miterlimit="10" points="0,223.3 48,138.5 154.7,169 211,88.5
              294.5,80.5 380,165.2 437,75.5 469.5,223.3 	"/>
            </g>
            <g id="Layer_4">
              <polygon stroke-miterlimit="10" points="469.3,222.7 1,222.7 48.7,166.7 155.7,188.3 212,132.7
              296.7,128 380.7,184.3 436.7,125 	"/>
            </g>
          </g>
        </defs>
      </svg>
      <a href="https://github.com/google/material-design-lite/blob/mdl-1.x/templates/dashboard/" target="_blank" id="view-source" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored mdl-color-text--white">View Source</a>
    <script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>
  
    <!--materialize js-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>

    <script >
    // $( document ).ready(function(){
    	$.ajax({
    		url: "/supplierUserController/showUserToJsonByName/sun",
    		type: "GET",
    		dataType: 'JSON',

    		success: function(result){
    			$.each(result, function(i, field){
    			if (i == "supplierUserName") {
    				$("#usename").text(field);
    			}
    			})
    		},
    		error: function(XMLHttpRequest, textStatus, errorThrown) { 
    			alert("Status: " + textStatus);
    			alert("Error: " + errorThrown); 
    		     
    	}
    		 })


    	// $deta{
    	// 	supplierUserName:$('#username').val()
    	// }
// }


    	// $.ajax({
    	// 	url: "http://192.168.88.42:8080/supplierUserController/showUserToJsonByName/sun",
    	// 	type: "GET",
    	// 	dataType: 'JSONP',
    	// 	success: function(result){
    	// 		$.each(result, function(i, field){
    	// 		if (i == "supplierUserName") {
    	// 			$("#usename").text(field);
    	// 		}

    	// 	});
    	// 	},
    	// 	error:function(result){
    	// 		$.each(result, function(i, field){
    	// 		if (i == "supplierUserName") {
    	// 			$("#usename").text(field);
    	// 		}
    	// });
    	// 	}

    		    // 	$.getJSON("http://192.168.88.42:8080/supplierUserController/showUserToJsonByName/sun",function(result){
    // 		$.each(result, function(i, field){
    // 			if (i == "supplierUserName") {
    // 				$("#usename").text(field);
    // 			}
    // 		});
    // 	});
   

    </script>

	<!-- <div style="margin-left: 30px; margin-top: 30px">
    <form action="">
      {% csrf_token %}
    <h3>用户注册</h3>
    <p>用户名：<input type="text" name="userName"></p>
    <p>密码：<input type="password" name="password"></p>
    <p>邮箱：<input type="text" name="email"></p>
      <input id="avatar" type="text" value="/static/images/sample.png" name="avatar" style="width: 400px"> {# 实际应用中要将该input标签隐藏，display:none; #}
      <p><input type="submit" value="注册"></p>
      </form>
    <div style="position: absolute; top: 85px; left: 300px;">
    <input id="avatarSlect" type="file" style="position: absolute;float: left; z-index: 10; opacity: 0;width: 100px; height: 100px;">
    <img id="avatarPreview" src="/static/images/sample.png" title="点击更换图片" style="position: absolute; z-index: 9; float: left; width: 100px; height: 100px">
      </div>
  </div> -->

  </body>
</html>
