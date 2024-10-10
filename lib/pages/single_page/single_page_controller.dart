import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spinner_box/spinner_box.dart';
import '../../http/request_api.dart';
import '../../model/search_pin_model.dart';

class SinglePageController extends GetxController {
  SharedPreferences pref = Get.find();
  final functionList = [
    SpinnerEntity(
      key: '全部',
      title: '全部',
      items: [SpinnerItem(name: '全部', result: 0, selected: true)],
    ),
    SpinnerEntity(
      key: '引导类',
      title: '引导类',
      items: [
        SpinnerItem(name: '步骤', result: 43, selected: false),
        SpinnerItem(name: '瓷片区', result: 35, selected: false),
        SpinnerItem(name: '分类', result: 36, selected: false),
        SpinnerItem(name: '分享', result: 44, selected: false),
        SpinnerItem(name: '功能引导', result: 41, selected: false),
        SpinnerItem(name: '金刚区', result: 34, selected: false),
        SpinnerItem(name: '启动页', result: 39, selected: false),
        SpinnerItem(name: '图标', result: 33, selected: false),
        SpinnerItem(name: '小红点', result: 45, selected: false),
        SpinnerItem(name: '引导页', result: 37, selected: false),
        SpinnerItem(name: '应用图标', result: 38, selected: false),
        SpinnerItem(name: '用户授权', result: 42, selected: false),
        SpinnerItem(name: '注册登录', result: 40, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '内容类',
      title: '内容类',
      items: [
        SpinnerItem(name: 'VR和3D', result: 110, selected: false),
        SpinnerItem(name: '动态', result: 51, selected: false),
        SpinnerItem(name: '发现', result: 58, selected: false),
        SpinnerItem(name: '话题圈子', result: 52, selected: false),
        SpinnerItem(name: '视频列表', result: 46, selected: false),
        SpinnerItem(name: '视频详情', result: 54, selected: false),
        SpinnerItem(name: '首页', result: 50, selected: false),
        SpinnerItem(name: '书籍列表', result: 48, selected: false),
        SpinnerItem(name: '书籍详情', result: 55, selected: false),
        SpinnerItem(name: '图片详情', result: 56, selected: false),
        SpinnerItem(name: '推荐', result: 49, selected: false),
        SpinnerItem(name: '文章详情', result: 53, selected: false),
        SpinnerItem(name: '音乐音频播放', result: 57, selected: false),
        SpinnerItem(name: '音乐音频列表', result: 47, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '操作类',
      title: '操作类',
      items: [
        SpinnerItem(name: '编辑', result: 59, selected: false),
        SpinnerItem(name: '编辑视频', result: 61, selected: false),
        SpinnerItem(name: '编辑图片', result: 60, selected: false),
        SpinnerItem(name: '扫描拍照', result: 62, selected: false),
        SpinnerItem(name: '删除', result: 63, selected: false),
        SpinnerItem(name: '搜索结果', result: 66, selected: false),
        SpinnerItem(name: '搜索入口', result: 64, selected: false),
        SpinnerItem(name: '搜索页面', result: 65, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '展示类',
      title: '展示类',
      items: [
        SpinnerItem(name: '暗色模式', result: 113, selected: false),
        SpinnerItem(name: '标签', result: 67, selected: false),
        SpinnerItem(name: '表情包', result: 68, selected: false),
        SpinnerItem(name: '成就等级徽章', result: 73, selected: false),
        SpinnerItem(name: '地图', result: 69, selected: false),
        SpinnerItem(name: '二维码', result: 70, selected: false),
        SpinnerItem(name: '个人中心', result: 71, selected: false),
        SpinnerItem(name: '个人主页', result: 72, selected: false),
        SpinnerItem(name: '结果页面', result: 74, selected: false),
        SpinnerItem(name: '历史和收藏夹', result: 75, selected: false),
        SpinnerItem(name: '排行榜', result: 76, selected: false),
        SpinnerItem(name: '时间线', result: 77, selected: false),
        SpinnerItem(name: '数据统计', result: 78, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '互动类',
      title: '互动类',
      items: [
        SpinnerItem(name: '关注', result: 82, selected: false),
        SpinnerItem(name: '聊天对话', result: 79, selected: false),
        SpinnerItem(name: '评分评价', result: 80, selected: false),
        SpinnerItem(name: '评论', result: 81, selected: false),
        SpinnerItem(name: '通知和消息', result: 85, selected: false),
        SpinnerItem(name: '喜欢点赞收藏', result: 84, selected: false),
        SpinnerItem(name: '新建发布', result: 83, selected: false),
        SpinnerItem(name: '虚拟人物', result: 112, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '交易类',
      title: '交易类',
      items: [
        SpinnerItem(name: '订单', result: 90, selected: false),
        SpinnerItem(name: '购物车', result: 87, selected: false),
        SpinnerItem(name: '会员功能解锁', result: 89, selected: false),
        SpinnerItem(name: '会员中心', result: 88, selected: false),
        SpinnerItem(name: '门店', result: 111, selected: false),
        SpinnerItem(name: '钱包和收支', result: 93, selected: false),
        SpinnerItem(name: '商店', result: 91, selected: false),
        SpinnerItem(name: '商品详情', result: 92, selected: false),
        SpinnerItem(name: '优惠券', result: 86, selected: false),
        SpinnerItem(name: '支付', result: 94, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '活动类',
      title: '活动类',
      items: [
        SpinnerItem(name: '横幅', result: 95, selected: false),
        SpinnerItem(name: '签到和打卡', result: 96, selected: false),
        SpinnerItem(name: '任务中心', result: 97, selected: false),
        SpinnerItem(name: '邀请好友', result: 98, selected: false),
        SpinnerItem(name: '运营活动', result: 99, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '辅助类',
      title: '辅助类',
      items: [
        SpinnerItem(name: '帮助反馈', result: 100, selected: false),
        SpinnerItem(name: '关于', result: 101, selected: false),
        SpinnerItem(name: '加载', result: 102, selected: false),
        SpinnerItem(name: '缺省页', result: 103, selected: false),
        SpinnerItem(name: '认证', result: 104, selected: false),
        SpinnerItem(name: '设置', result: 105, selected: false),
        SpinnerItem(name: '说明页面', result: 108, selected: false),
        SpinnerItem(name: '下拉点击刷新', result: 106, selected: false),
        SpinnerItem(name: '主题装扮', result: 107, selected: false),
      ],
    ),
  ].obs;
  final componentsList = [
    SpinnerEntity(
        key: '全部',
        title: '全部',
        items: [SpinnerItem(name: '全部', result: 0, selected: true)]),
    SpinnerEntity(
      key: '导航类',
      title: '导航类',
      items: [
        SpinnerItem(name: '标签页Tab', result: 5, selected: false),
        SpinnerItem(name: '查看更多', result: 3, selected: false),
        SpinnerItem(name: '底部导航栏', result: 1, selected: false),
        SpinnerItem(name: '顶部导航栏', result: 2, selected: false),
        SpinnerItem(name: '分段控制器', result: 6, selected: false),
        SpinnerItem(name: '工具栏', result: 7, selected: false),
        SpinnerItem(name: '筛选排序', result: 4, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '弹出类',
      title: '弹出类',
      items: [
        SpinnerItem(name: 'Snackbar', result: 14, selected: false),
        SpinnerItem(name: 'Toast', result: 13, selected: false),
        SpinnerItem(name: '侧边弹窗', result: 9, selected: false),
        SpinnerItem(name: '弹窗', result: 8, selected: false),
        SpinnerItem(name: '底部弹窗', result: 12, selected: false),
        SpinnerItem(name: '气泡弹窗', result: 10, selected: false),
        SpinnerItem(name: '下拉弹窗', result: 11, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '控制类',
      title: '控制类',
      items: [
        SpinnerItem(name: '按钮', result: 17, selected: false),
        SpinnerItem(name: '表单', result: 22, selected: false),
        SpinnerItem(name: '步进器', result: 20, selected: false),
        SpinnerItem(name: '单选多选', result: 18, selected: false),
        SpinnerItem(name: '滑动条', result: 19, selected: false),
        SpinnerItem(name: '开关', result: 21, selected: false),
        SpinnerItem(name: '输入框', result: 23, selected: false),
        SpinnerItem(name: '悬浮按钮', result: 15, selected: false),
        SpinnerItem(name: '展开折叠', result: 24, selected: false),
        SpinnerItem(name: '主次按钮', result: 16, selected: false),
      ],
    ),
    SpinnerEntity(
      key: '展示类',
      title: '展示类',
      items: [
        SpinnerItem(name: '横向滑动卡片', result: 27, selected: false),
        SpinnerItem(name: '进度条', result: 25, selected: false),
        SpinnerItem(name: '卡片', result: 26, selected: false),
        SpinnerItem(name: '列表布局', result: 28, selected: false),
        SpinnerItem(name: '瀑布流', result: 31, selected: false),
        SpinnerItem(name: '日期日历', result: 32, selected: false),
        SpinnerItem(name: '头图加内容', result: 30, selected: false),
        SpinnerItem(name: '网格布局', result: 29, selected: false),
      ],
    ),
  ].obs;
  final dataList = <Result>[].obs;
  final isLoading = false.obs;
  final page = 1.obs;
  final hasMore = 0.obs;
  final functions = 0.obs;
  final components = 0.obs;
  final showButton = false.obs;
  final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  getDataList({bool reset = false}) async {
    var newList = <Result>[];
    try {
      isLoading.value = true;
      if (reset) {
        dataList.clear();
        page.value = 1;
      }
      var res = await RequestRepository.searchPinApi(
          functions.value, components.value, page.value);

      bool isLogin = pref.containsKey('isVip');
      bool isVip = pref.getInt('isVip') == 1 ? true : false;

      if (res.data != null && res.statusCode != 204) {
        var data = SearchPinModel.fromJson(res.data);

        newList = data.result ?? [];
        dataList.addAll(newList);
        page.value++;
      }

      if (res.statusCode == 204) {
        hasMore.value = 3; // 数据为空或者状态码为204时，未登录
        if (!isLogin) {
          hasMore.value = 1; // 未登录
        } else if (isLogin && !isVip) {
          hasMore.value = 2; // 已登录但不是VIP
        } else if (isLogin && isVip) {
          hasMore.value = 3; // 已登录且是VIP
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  likeAction(String uuid, String status) async {
    await RequestRepository.detailLikesActionApi(uuid, status);
  }

  void scrollListener() {
    if (scrollController.offset >= 400) {
      showButton.value = true;
    } else {
      showButton.value = false;
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
