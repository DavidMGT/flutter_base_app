import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application.dart';
import 'pages/splash_page.dart';
import 'provider/user_model.dart';
import 'router/navigate_service.dart';
import 'router/routes.dart';
import 'utils/log_util.dart';

void main() {
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;
  Application.setupLocator();
  LogUtil.init(tag: 'app init');
//  AudioPlayer.logEnabled = true;
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserModel>(
        create: (_) => UserModel(),
      ),
//      ChangeNotifierProvider<UserModel>(
//        create: (_) => PlaySongsModel()..init(),
//      ),
//      ChangeNotifierProvider<PlayListModel>(
//        create: (_) => PlayListModel(),
//      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter项目初始化',
      navigatorKey: Application.getIt<NavigateService>().key,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          splashColor: Colors.transparent,
          tooltipTheme: TooltipThemeData(verticalOffset: -100000)),
      home: SplashPage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
