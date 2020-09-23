import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_app/pages/look_img_page.dart';
import 'package:flutter_base_app/router/routes.dart';
import 'package:flutter_base_app/router/transparent_route.dart';


import '../application.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }

  /// 登录页
  static void goLoginPage(BuildContext context) {
    _navigateTo(context, Routes.login, clearStack: true);
  }

  /// 首页
  static void goHomePage(BuildContext context) {
    _navigateTo(context, Routes.home, clearStack: true);
  }

  /// 每日推荐歌曲
  static void goDailySongsPage(BuildContext context) {
    _navigateTo(context, Routes.dailySongs);
  }


  /// 排行榜首页
  static void goTopListPage(BuildContext context) {
    _navigateTo(context, Routes.topList);
  }

  /// 播放歌曲页面
  static void goPlaySongsPage(BuildContext context) {
    _navigateTo(context, Routes.playSongs);
  }



  /// 搜索页面
  static void goSearchPage(BuildContext context) {
    _navigateTo(context, Routes.search);
  }

  /// 查看图片页面
  static void goLookImgPage(
      BuildContext context, List<String> imgs, int index) {
//    Application.router.navigateTo(context, '${Routes.lookImg}?imgs=${FluroConvertUtils.object2string(imgs.join(','))}&index=$index', transitionBuilder: (){});
//    _navigateTo(context, '${Routes.lookImg}?imgs=${FluroConvertUtils.object2string(imgs.join(','))}&index=$index');
//    _navigateTo(context, '${Routes.lookImg}');
    Navigator.push(
      context,
        TransparentRoute(builder: (_) => LookImgPage(imgs, index),),
    );
  }

  /// 用户详情页面
  static void goUserDetailPage(BuildContext context, int userId) {
    _navigateTo(context, "${Routes.userDetail}?id=$userId");
  }

}
