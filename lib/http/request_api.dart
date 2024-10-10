import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uinotes/model/app_detail_count_model.dart';
import 'package:uinotes/model/app_detail_model.dart';
import 'package:uinotes/model/detail_likes_action_model.dart';
import 'package:uinotes/model/likes_model.dart';
import 'package:uinotes/model/member_exchange_model.dart';
import 'package:uinotes/model/nickname_change.dart';
import 'package:uinotes/model/pin_detail_model.dart';
import 'package:uinotes/model/reset_model.dart';
import 'package:uinotes/model/reset_verification_model.dart';
import 'package:uinotes/model/search_app_model.dart';
import 'package:uinotes/model/search_count_model.dart';
import 'package:uinotes/model/search_pin_model.dart';
import 'package:uinotes/model/search_word_model.dart';
import 'package:uinotes/model/sign_out_model.dart';
import 'package:uinotes/model/upload_model.dart';
import 'package:uinotes/utils/http_util.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/parsing.dart';
import '../model/captcha_model.dart';
import '../model/search_model.dart';
import '../model/sign_in_model.dart';
import '../model/sign_up_model.dart';
import '../model/sign_verificatiion_model.dart';

class RequestUrl {
  static const String baseUrl = 'https://uinotes.com';
  static const String signUpUrl = '/signup';
  static const String signVerificatiionUrl = '/sign/verification';
  static const String captchaUrl = '/captcha';
  static const String signInUrl = '/signin';
  static const String searchUrl = '/uinotes-api/search';
  static const String searchCountUrl = '/uinotes-api/search-count';
  static const String searchWordUrl = '/uinotes-api/search-word';
  static const String searchAppUrl = '/uinotes-api/app';
  static const String appDetailUrl = '/uinotes-api/app-detail';
  static const String appDetailCountUrl =
      '/uinotes-api/app-detail-filter-count';
  static const String pinDetailUrl = '/uinotes-api/pin-detail';
  static const String detailLikesActionUrl = '/uinotes-api/detail-likes-action';
  static const String likesUrl = '/uinotes-api/likes';
  static const String memberExchangeUrl = '/member-exchange';
  static const String nicknameChangeUrl = '/setting/nickname-change';
  static const String resetVerificationUrl = '/reset/verification';
  static const String resetUrl = '/reset';
  static const String searchPinUrl = '/uinotes-api/pin';
  static const String uploadUrl = '/setting/uploads';
  static const String signOutUrl = '/signout';
  static const String setting = '/setting/account';
}

class RequestRepository {
  
  static Future<SignUpModel?> signUpApi(
    String email,
    String password,
    String passwordConfirm,
    String verification,
  ) async {
    Response response = await HttpUtil.post(RequestUrl.signUpUrl, {
      'email': email,
      'password': password,
      'passwordConfirm': passwordConfirm,
      'verification': verification
    }, {});

    return SignUpModel.fromJson(response.data);
  }

  static Future signVerificatiionApi(
    String email,
  ) async {
    Response response = await HttpUtil.post(RequestUrl.signVerificatiionUrl, {
      'email': email,
    }, {});
    if (response.data != null) {
      SignVerificatiionModel res =
          SignVerificatiionModel.fromJson(response.data);
      if (res.status == 200) {
        EasyLoading.showSuccess(res.msg!);
      } else {
        EasyLoading.showError(res.msg!);
      }
    }
  }

  static Future<CaptchaModel?> captchaApi() async {
    Response response = await HttpUtil.get(RequestUrl.captchaUrl, {}, {});
    if (response.data != null) {
      return CaptchaModel.fromJson(response.data);
    }
    return null;
  }

  static Future signInApi(
    String email,
    String password,
    String captchaCode,
  ) async {
    Response response = await HttpUtil.post(RequestUrl.signInUrl, {
      'email': email,
      'password': password,
      'captchaCode': captchaCode,
    }, {});
    if (response.data != null) {
      SignInModel res = SignInModel.fromJson(response.data);
      return res;
    }
  }

  static Future<Response> searchApi(
    String wd,
    String type,
    int page,
  ) async {
    Response response = await HttpUtil.get(
        RequestUrl.searchUrl, {}, {'wd': wd, 'type': type, 'page': page});

    if (type == 'app') {
      return response;
    } else {
      return response;
    }
  }

  static Future<SearchCountModel?> searchCountApi(
    String word,
  ) async {
    Response response =
        await HttpUtil.get(RequestUrl.searchCountUrl, {}, {'word': word});

    return SearchCountModel.fromJson(response.data);
  }

  static Future<List<SearchWordModel>?> searchWordApi(
    String wd,
    String type,
  ) async {
    Response response = await HttpUtil.get(
        RequestUrl.searchWordUrl, {}, {'wd': wd, 'type': type});

    return SearchWordModel.fromJsonList(response.data);
  }

  static Future<Response> searchAppApi(
    int company,
    int catalogue,
    int page,
  ) async {
    Map<String, dynamic> params = {
      'page': page,
    };

    if (company != 0) {
      params['company'] = company;
    }

    if (catalogue != 0) {
      params['catalogue'] = catalogue;
    }
    Response response = await HttpUtil.get(RequestUrl.searchAppUrl, {}, params);

    return response;
  }

  static Future<Response> appDetailApi(
    String uuid,
    int page,
  ) async {
    Response response = await HttpUtil.get(
      RequestUrl.appDetailUrl,
      {},
      {'uuid': uuid, 'page': page},
    );

    return response;
  }

  static Future<int?> appDetailCountApi(
    String uuid,
  ) async {
    Response response = await HttpUtil.get(
      RequestUrl.appDetailCountUrl,
      {},
      {'uuid': uuid},
    );
    if (response.data != null) {
      return AppDetailCountModel.fromJson(response.data).num;
    }
    return null;
  }

  static Future<PinDetailModel?> pinDetailApi(
    String uuid,
  ) async {
    Response response = await HttpUtil.get(
      RequestUrl.pinDetailUrl,
      {},
      {'uuid': uuid},
    );
    if (response.data != null) {
      return PinDetailModel.fromJson(response.data);
    }
    return null;
  }

  static Future detailLikesActionApi(
    String uuid,
    String status,
  ) async {
    Response response = await HttpUtil.get(
      RequestUrl.detailLikesActionUrl,
      {},
      {'uuid': uuid, 'status': status},
    );
    if (response.data != null) {
      DetailLikesActionModel res =
          DetailLikesActionModel.fromJson(response.data);
      if (res.status == 200 && res.likesStatus == 1) {
        // EasyLoading.showSuccess(res.msg!);
      } else if (res.status == 200 && res.likesStatus == 0) {
        // EasyLoading.showSuccess(res.msg!);
      }
    }
  }

  static Future<List<LikesModel>> likesApi(
    int page,
  ) async {
    Response response = await HttpUtil.get(
      RequestUrl.likesUrl,
      {},
      {'page': page},
    );

    return LikesModel.fromJsonList(response.data);
  }

  static Future memberExchangeApi(String code) async {
    Response response =
        await HttpUtil.post(RequestUrl.memberExchangeUrl, {'code': code}, {});
    if (response.data != null) {
      MemberExchangeModel res = MemberExchangeModel.fromJson(response.data);
      if (res.status == 200) {
        EasyLoading.showSuccess(res.msg!);
      } else {
        EasyLoading.showError(res.msg!);
      }
    }
  }

  static Future nicknameChangeApi(String nickname) async {
    Response response = await HttpUtil.post(
        RequestUrl.nicknameChangeUrl, {'nickname': nickname}, {});
    if (response.data != null) {
      NicknameChangeModel res = NicknameChangeModel.fromJson(response.data);
      if (res.status == 200) {
        EasyLoading.showSuccess('更换昵称成功');
        return true;
      } else {
        EasyLoading.showError('更换昵称失败');
      }
    }
  }

  static Future resetVerificationApi() async {
    Response response = await HttpUtil.post(
        RequestUrl.resetVerificationUrl, {'type': 'setting-reset'}, {});
    ResetVerificationModel res = ResetVerificationModel.fromJson(response.data);
    if (res.status == 200) {
      EasyLoading.showSuccess(res.msg!);
    } else {
      EasyLoading.showError(res.msg ?? '验证码发送失败');
    }
  }

  static Future resetApi(
    String password,
    String verification,
    String passwordConfirm,
  ) async {
    Response response = await HttpUtil.post(RequestUrl.resetUrl, {
      'password': password,
      'verification': verification,
      'passwordConfirm': passwordConfirm,
      'type': 'setting-reset'
    }, {});
    if (response.data != null) {
      ResetModel res = ResetModel.fromJson(response.data);
      if (res.status == 200) {
        EasyLoading.showSuccess(res.msg!);
      } else {
        EasyLoading.showError(res.msg ?? '重置密码错误');
      }
    }
  }

  static Future<Response> searchPinApi(
    int functions,
    int components,
    int page,
  ) async {
    Map<String, dynamic> params = {
      'page': page,
    };

    if (functions != 0) {
      params['functions'] = functions;
    }

    if (components != 0) {
      params['components'] = components;
    }
    Response response = await HttpUtil.get(RequestUrl.searchPinUrl, {}, params);

    // return SearchPinModel.fromJson(response.data);
    return response;
  }

  static Future<UploadModel?> uploadApi(
    String filePath,
  ) async {
    Response response = await HttpUtil.post(RequestUrl.uploadUrl,
        FormData.fromMap({'file': MultipartFile.fromFile(filePath)}), {});
    if (response.data != null) {
      UploadModel res = UploadModel.fromJson(response.data);
      if (res.status == 200) {
        EasyLoading.showSuccess(res.msg!);
        return res;
      } else {
        EasyLoading.showError(res.msg ?? '上传头像失败');
      }
    }
    return null;
  }

  static Future signOutApi() async {
    Response response = await HttpUtil.get(RequestUrl.signOutUrl, {}, {});
    if (response.data != null) {
      SignOutModel res = SignOutModel.fromJson(response.data);
      if (res.status == 200) {
        EasyLoading.showSuccess(res.msg!);
      }
    }
  }

  static Future settingApi() async {
    Response response = await HttpUtil.get(RequestUrl.setting, {}, {});
    if (response.data != null) {
      var document = parseHtmlDocument(response.data);
      var element = document.querySelector('a.popup-info-nickname') ??
          document.querySelector('a.popup-info-nickname-vip');
      var name = element!.innerText;
      var element1 =
          document.querySelector('a.popup-avatar')!.querySelector('img');
      var avatar = element1!.attributes['src']!;
      var element2 =
          document.querySelector('div.popup-member')!.querySelector('img');
      var isVip = element2!.attributes['alt'] == '非会员' ? 0 : 1;
      var element3 = document.querySelector('a.popup-vip-time');
      var timeVip = '';
      if (element3 != null) {
        timeVip = element3.innerText;
      }
      var element4 = document.querySelector('.reset-email-input');
      var email = element4?.attributes['value'];
      return {
        'name': name,
        'avatar': avatar,
        'isVip': isVip,
        'timeVip': timeVip,
        'email': email
      };
    }
  }
}
