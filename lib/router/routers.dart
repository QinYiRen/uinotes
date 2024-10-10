import 'package:get/get.dart';
import 'package:uinotes/pages/about/about_view.dart';
import 'package:uinotes/pages/account/account_binding.dart';
import 'package:uinotes/pages/account/account_view.dart';
import 'package:uinotes/pages/app_single_page/app_single_page_binding.dart';
import 'package:uinotes/pages/app_single_page/app_single_page_view.dart';
import 'package:uinotes/pages/exchange/exchange_binding.dart';
import 'package:uinotes/pages/exchange/exchange_view.dart';
import 'package:uinotes/pages/home/home_binding.dart';
import 'package:uinotes/pages/login/login_binding.dart';
import 'package:uinotes/pages/main/main_binding.dart';
import 'package:uinotes/pages/my/my_binding.dart';
import 'package:uinotes/pages/nickname/nickname_binding.dart';
import 'package:uinotes/pages/password/password_binding.dart';
import 'package:uinotes/pages/search_box/search_box_binding.dart';
import 'package:uinotes/pages/search_list/search_list_binding.dart';
import 'package:uinotes/pages/setting/setting_binding.dart';
import 'package:uinotes/pages/single_page/single_page_view.dart';
import 'package:uinotes/pages/single_page_detail/single_page_detail_binding.dart';

import '../pages/app_list/app_list_view.dart';
import '../pages/home/home_view.dart';
import '../pages/main/main_view.dart';
import '../pages/login/login_view.dart';
import '../pages/my/my_view.dart';
import '../pages/nickname/nickname_view.dart';
import '../pages/password/password_view.dart';
import '../pages/privacy/privacy_view.dart';
import '../pages/register/register_binding.dart';
import '../pages/register/register_view.dart';
import '../pages/search_box/search_box_view.dart';
import '../pages/search_list/search_list_view.dart';
import '../pages/setting/setting_view.dart';
import '../pages/single_page_detail/single_page_detail_view.dart';
import '../pages/suggestion/suggestion_view.dart';
import '../pages/upgrade/upgrade_view.dart';
import '../pages/user_agreement/user_agreement_view.dart';

class Routes {
  static const String mainPage = '/main';
  static const String homePage = '/home';
  static const String aboutPage = '/about';
  static const String appListPage = '/appList';
  static const String appSinglePage = '/appSinglePage';
  static const String exchangePage = '/exchange';
  static const String loginPage = '/login';
  static const String myPage = '/my';
  static const String nicknamePage = '/nickname';
  static const String passwordPage = '/password';
  static const String privacyPage = '/privacy';
  static const String registerPage = '/register';
  static const String searchBoxPage = '/searchBox';
  static const String searchListPage = '/searchList';
  static const String settingPage = '/setting';
  static const String singlePage = '/single';
  static const String singlePageDetailPage = '/singleDetail';
  static const String suggestionPage = '/suggestion';
  static const String upgradePage = '/upgrade';
  static const String userAgreementPage = '/userAgreement';
  static const String accountPage = '/account';

  static final routePage = [
    GetPage(
        name: mainPage, page: () => const MainPage(), binding: MainBinding()),
    GetPage(
        name: homePage, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: aboutPage, page: () => const AboutPage()),
    GetPage(name: appListPage, page: () => AppListPage()),
    GetPage(
        name: appSinglePage,
        page: () =>  AppSinglePagePage(),
        binding: AppSinglePageBinding()),
    GetPage(
        name: exchangePage,
        page: () => ExchangePage(),
        binding: ExchangeBinding()),
    GetPage(name: loginPage, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: myPage, page: () => MyPage(), binding: MyBinding()),
    GetPage(
        name: nicknamePage,
        page: () => NicknamePage(),
        binding: NicknameBinding()),
    GetPage(
        name: passwordPage,
        page: () =>  PasswordPage(),
        binding: PasswordBinding()),
    GetPage(name: privacyPage, page: () => const PrivacyPage()),
    GetPage(
        name: registerPage,
        page: () =>  RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: searchBoxPage,
        page: () =>  SearchBoxPage(),
        binding: SearchBoxBinding()),
    GetPage(name: searchListPage, page: () => const SearchListPage(),binding: SearchListBinding()),
    GetPage(
        name: settingPage,
        page: () => const SettingPage(),
        binding: SettingBinding()),
    GetPage(name: singlePage, page: () => SinglePagePage()),
    GetPage(name: singlePageDetailPage, page: () => SinglePageDetailPage(),binding: SinglePageDetailBinding()),
    GetPage(name: suggestionPage, page: () => const SuggestionPage()),
    GetPage(name: upgradePage, page: () => const UpgradePage()),
    GetPage(name: userAgreementPage, page: () => const UserAgreementPage()),
    GetPage(
        name: accountPage,
        page: () => AccountPage(),
        binding: AccountBinding()),
  ];
}
