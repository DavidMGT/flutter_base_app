import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/pages/login_page.dart';
import 'package:flutter_base_app/router/route_handles.dart';


class Routes {
  static String root = "/";
  static String home = "/home";
  static String login = "/login";
  static String dailySongs = "/daily_songs";
  static String playList = "/play_list";
  static String topList = "/top_list";
  static String playSongs = "/play_songs";
  static String comment = "/comment";
  static String search = "/search";
  static String lookImg = "/look_img";
  static String userDetail = "/user_detail";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
      return LoginPage();
    });
    router.define(root, handler: splashHandler);
    router.define(login, handler: loginHandler);
  }
}
