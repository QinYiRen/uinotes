import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'about_controller.dart';

class AboutPage extends GetView<AboutController> {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('关于我们',
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
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        children: <Widget>[
          const Text(
            '关于 UI Notes',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          const Text(
            'UI Notes (uinotes.com) 由 UI 设计师 mx 设计并开发，于 2021 年底上线，目标是成为国内最完整最实用的 UI 设计灵感网站，为你节省寻找灵感的时间。',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20.h),
          const Text(
            'UI Notes 诞生的原因',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          const Text(
            '作为一个 UI 设计师，每天都会在寻找 UI 灵感上花费大量时间，然而在现有的主流设计网站上寻找 UI 方面的灵感时，可能会遇到下面的情况。',
            style: TextStyle(fontSize: 16),
          ),
          // 列出问题
          bulletedText('Dribbble、Behance 等网站飞机稿很多，能实实在在用到项目中的案例少；'),
          bulletedText('Pinterest 搜索 UI 灵感，结果中的绝大部分依然是从各大设计网站 Pin 下的飞机稿；'),
          bulletedText('花瓣上有很多真实项目的 UI 灵感，但毕竟是综合性的网站，在细分度和实时性上差点意思；'),
          bulletedText(
              '各种公众号、文章里的「100G UI 素材包」等素材，大部分都是过时的，无论是风格还是使用场景，很难满足实际应用；'),
          bulletedText('国外的 UI 灵感网站，比如 Mobbin、Pttrns 等，放眼望去几乎找不到中文应用。'),
          SizedBox(height: 20.h),
          const Text(
            'UI Notes 有什么',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          // 列出特点
          bulletedText('专注于 UI 设计方面的灵感；'),
          bulletedText('网站没有飞机稿，灵感可快速应用到工作中；'),
          bulletedText('可以按照 App 的维度浏览项目，方便参考完整的功能；'),
          bulletedText('每周更新线上最新鲜的 App，帮你把握最新设计趋势；'),
          bulletedText('对界面进行了较为详尽的分类，可以通过搜索功能快速找到灵感。'),
          SizedBox(height: 20.h),
          const Text(
            '联系方式',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          const Text(
            '邮箱：support@uinotes.com',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4.h),
          const Text(
            'QQ：2275740397',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

Widget bulletedText(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('▪ ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
