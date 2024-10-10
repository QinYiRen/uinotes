import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uinotes/common/style.dart';
import 'package:uinotes/utils/global.dart';

import 'router/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (GetPlatform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark);

    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  await Global().init();

  Future.delayed(const Duration(seconds: 1), () {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (context.isPhone) {
      ScreenUtil.init(context, designSize: const Size(375, 812));
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    } else if (context.isTablet) {
      if (context.isLandscape) {
        ScreenUtil.init(context, designSize: const Size(1194, 834));
      } else {
        ScreenUtil.init(context, designSize: const Size(834, 1194));
      }
    } else {
      ScreenUtil.init(context, designSize: const Size(375, 812));
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
      title: 'UI Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(accentColor: S.colors.appColor),
        splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        splashFactory: NoSplash.splashFactory,
        appBarTheme: const AppBarTheme(
            elevation: 0, scrolledUnderElevation: 0.0, color: Colors.white),
        tabBarTheme: const TabBarTheme(splashFactory: NoSplash.splashFactory),
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(elevation: 0),
        useMaterial3: false,
      ),
      builder: EasyLoading.init(),
      initialRoute: '/main',
      getPages: Routes.routePage,
      onInit: () async {
        final pref = await SharedPreferences.getInstance();
        final hasAcceptedPolicy = pref.getBool('accepted_policy') ?? false;

        if (!hasAcceptedPolicy) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.defaultDialog(
                barrierDismissible: false,
                titlePadding: EdgeInsets.only(top: 20.h),
                titleStyle: TextStyle(fontSize: 21, color: S.colors.appColor),
                contentPadding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 24.h),
                title: '用户协议与隐私政策',
                confirm: RawMaterialButton(
                  constraints: BoxConstraints(minWidth: 110.w, minHeight: 44.h),
                  fillColor: S.colors.appColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () async {
                    await pref.setBool('accepted_policy', true);
                    Get.back();
                  },
                  child: const Text(
                    '同意',
                    style: TextStyle(
                        fontSize: 17, letterSpacing: 1, color: Colors.white),
                  ),
                ),
                cancel: RawMaterialButton(
                  constraints: BoxConstraints(minWidth: 110.w, minHeight: 44.h),
                  fillColor: const Color.fromARGB(255, 240, 240, 240),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text(
                    '拒绝',
                    style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                        color: Color.fromARGB(158, 35, 36, 36)),
                  ),
                ),
                content: SizedBox(
                    width: 320.w,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '请你务必审慎阅读、充分理解用户协议和隐私协议各条款，包含但不限于用户注意事项、用户行为规范以及为你提供服务而收集、使用、存储你个人信息的情况等。你可阅读',
                            style: TextStyle(
                              color: S.colors.appColor,
                            ),
                          ),
                          TextSpan(
                            text: '《隐私政策》',
                            style: const TextStyle(
                              color: Colors.blueAccent,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed('/privacy');
                              },
                          ),
                          TextSpan(
                            text: '和',
                            style: TextStyle(
                              color: S.colors.appColor,
                            ),
                          ),
                          TextSpan(
                            text: '《用户协议》',
                            style: const TextStyle(
                              color: Colors.blueAccent,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed('/userAgreement');
                              },
                          ),
                          TextSpan(
                            text: '了解详细信息。如你同意，请点击下方按钮开始接受我们的服务。',
                            style: TextStyle(
                              color: S.colors.appColor,
                            ),
                          ),
                        ],
                      ),
                    )));
          });
        }
      },
    );
  }
}
