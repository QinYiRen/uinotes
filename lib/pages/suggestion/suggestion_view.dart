import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'suggestion_controller.dart';

class SuggestionPage extends GetView<SuggestionController> {
  const SuggestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('意见反馈',
              style: TextStyle(
                  fontSize: 18,
                  color: S.colors.appColor,
                  fontWeight: FontWeight.normal)),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(R.icons.back)),
        ),
        body: WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onPageStarted: (String url) {
                    EasyLoading.show(status: '加载中...');
                  },
                  onPageFinished: (String url) {
                    EasyLoading.dismiss();
                  },
                ),
              )
              ..loadRequest(Uri.parse('https://wj.qq.com/s2/10380761/3e98'))));
  }
}
