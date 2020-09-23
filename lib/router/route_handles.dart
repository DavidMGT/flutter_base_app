import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/pages/login_page.dart';
import 'package:flutter_base_app/pages/splash_page.dart';


// splash 页面
var splashHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return SplashPage();
    });

// 登录页
var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return LoginPage();
    });

