import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'privacy_controller.dart';

class PrivacyPage extends GetView<PrivacyController> {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('隐私政策',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'UI Notes 隐私政策',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.h),
            const Text(
              '     欢迎您访问我们的产品。UI Notes（包括App等产品提供的服务，以下简称“产品和服务”）是由 UI Notes（以下简称“我们”）开发并运营的。确保用户的数据安全和隐私保护是我们的首要任务，本隐私政策载明了您访问和使用我们的产品和服务时所收集的数据及其处理方式。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '     请您在继续使用我们的产品前务必认真仔细阅读并确认充分理解本隐私政策全部规则和要点，一旦您选择使用，即视为您同意本隐私政策的全部内容，同意我们按其收集和使用您的相关信息。如您在在阅读过程中，对本政策有任何疑问，可联系我们的客服咨询，请通过 support@uinotes.com 或产品中的反馈方式与我们取得联系。如您不同意相关协议或其中的任何条款的，您应停止使用我们的产品和服务。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '本隐私政策帮助您了解以下内容：',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '一、我们如何收集和使用您的个人信息；\n'
              '二、我们如何存储和保护您的个人信息；\n'
              '三、我们如何共享、转让、公开披露您的个人信息；\n'
              '四、我们如何使用 Cookie 和其他追踪技术；',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '一、我们如何收集和使用您的个人信息',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '     个人信息是指以电子或者其他方式记录的能够单独或者与其他信息结合识别特定自然人身份或者反映特定自然人活动情况的各种信息。我们根据《中华人民共和国网络安全法》和《信息安全技术个人信息安全规范》（GB/T 35273-2017）以及其它相关法律法规的要求，并严格遵循正当、合法、必要的原则，出于您使用我们提供的服务和/或产品等过程中而收集和使用您的个人信息，包括但不限于电子邮箱地址等。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '二、我们如何存储和保护您的个人信息',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '     作为一般规则，我们仅在实现信息收集目的所需的时间内保留您的个人信息。我们会在对于管理与您之间的关系严格必要的时间内保留您的个人信息（例如，当您开立帐户，从我们的产品获取服务时）。出于遵守法律义务或为证明某项权利或合同满足适用的诉讼时效要求的目的，我们可能需要在上述期限到期后保留您存档的个人信息，并且无法按您的要求删除。当您的个人信息对于我们的法定义务或法定时效对应的目的或档案不再必要时，我们确保将其完全删除或匿名化。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '三、我们如何共享、转让、公开披露您的个人信息',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '     在管理我们的日常业务活动所需要时，为追求合法利益以更好地服务客户，我们将合规且恰当的使用您的个人信息。出于对业务和各个方面的综合考虑，我们仅自身使用这些数据，不与任何第三方分享。我们可能会根据法律法规规定，或按政府主管部门的强制性要求，对外共享您的个人信息。在符合法律法规的前提下，当我们收到上述披露信息的请求时，我们会要求必须出具与之相应的法律文件，如传票或调查函。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '四、我们如何使用 Cookie 和其他追踪技术',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '     为确保产品正常运转，我们会在您的计算机或移动设备上存储名为 Cookie 的小数据文件。Cookie 通常包含标识符、产品名称以及一些号码和字符。借助于 Cookie，我们能够存储您的偏好或商品等数据，并用以判断注册用户是否已经登录，提升服务和产品质量及优化用户体验。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.h),
            const Text(
              '     我们出于不同的目的使用各种Cookie，包括：严格必要型Cookie、性能Cookie、营销Cookie和功能Cookie。某些Cookie可能由外部第三方提供，以向我们的产品提供其它功能。我们不会将 Cookie 用于本政策所述目的之外的任何用途。您可根据自己的偏好管理或删除 Cookie。您可以清除计算机上或手机中保存的所有 Cookie，大部分网络浏览器都设有阻止或禁用 Cookie 的功能，您可对浏览器进行配置。阻止或禁用 Cookie 功能后，可能影响您使用或不能充分使用我们的产品和服务。',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.h),
            const Text(
              '联系方式',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '如您对本隐私政策有任何疑问或需要与我们联系，请通过以下方式与我们联系：\nEmail: support@uinotes.com',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 24.h),
            const Text(
              '更新日期',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            const Text(
              '本隐私政策最后更新于2024年8月27日。',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
