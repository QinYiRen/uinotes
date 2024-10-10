import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uinotes/widget/responsive.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'search_app_controller.dart';

class SearchAppPage extends GetView<SearchAppController> {
  SearchAppPage({Key? key, required this.wd}) : super(key: key);
  final String wd;
  final refreshController = RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
            body: SmartRefresher(
                header: MaterialClassicHeader(
                        color: S.colors.appColor,
                        height: 60,
                        distance: 50,
                      ),
                controller: refreshController,
                enablePullUp: true,
                onLoading: () async {
                  await controller.getDataList(wd: wd);
                  refreshController.loadComplete();
                  if (controller.hasMore.value != 0) {
                    refreshController.loadNoData();
                  }
                },
                onRefresh: () async {
                  refreshController.resetNoData();
                  await controller.getDataList(reset: true, wd: wd);
                  refreshController.refreshCompleted();
                },
                footer: CustomFooter(
                  builder: (context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text(
                        "上拉加载更多",
                        style: TextStyle(color: S.colors.iconColor),
                      );
                    } else if (mode == LoadStatus.loading) {
                      body = const CircularProgressIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("加载失败！点击重试！",
                          style: TextStyle(color: S.colors.iconColor));
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("松手,加载更多",
                          style: TextStyle(color: S.colors.iconColor));
                    } else {
                      body = controller.pref.containsKey('isVip')
                          ? (controller.pref.getInt('isVip') == 1
                              ? Text("没有更多了",
                                  style: TextStyle(color: S.colors.iconColor))
                              : Text("升级会员查看更多",
                                  style: TextStyle(color: S.colors.iconColor)))
                          : Text("登录查看更多",
                              style: TextStyle(color: S.colors.iconColor));
                    }
                    return SizedBox(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                child: CustomScrollView(
                    controller: controller.scrollController,
                    slivers: [
                      SliverPadding(
                          padding: EdgeInsets.only(
                              top: 6.h, right: 16.w, left: 16.w),
                          sliver: Obx(() {
                            return SliverGrid.builder(
                                itemCount: controller.dataList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 16.w,
                                        crossAxisSpacing: 16.w,
                                        childAspectRatio: 0.46),
                                itemBuilder: (BuildContext context, int index) {
                                  final data = controller.dataList[index];
                                  Map<String, dynamic> values =
                                      json.decode(data.preview!);
                                  String firstImage = values['image'][0];

                                  return GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/appSinglePage',
                                            parameters: {
                                              'uuid': data.uuid!,
                                              'name': data.name!
                                            });
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                    image: CachedNetworkImageProvider(
                                                        '${R.images.thumbnailBaseUrl}$firstImage.webp',
                                                        headers: const {
                                                          'Referer':
                                                              'https://uinotes.com',
                                                        }),
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Color(0x03000000),
                                                            BlendMode
                                                                .multiply))),
                                          ),
                                          SizedBox(
                                            height: context.height * 0.08,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(12)),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 10, sigmaY: 10),
                                                child: Container(
                                                    color: Colors.black
                                                        .withOpacity(0.1)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: context.height * 0.08,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: Image(
                                                      width: 32.w,
                                                      image: CachedNetworkImageProvider(
                                                          '${R.images.thumbnailBaseUrl}${data.logoUuid!}.webp',
                                                          headers: const {
                                                            'Referer':
                                                                'https://uinotes.com',
                                                          })),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      data.name!,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Text(
                                                      '${data.num}张截图',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ));
                                });
                          }))
                    ])),
            floatingActionButton: Obx(() => controller.showButton.value
                ? FloatingActionButton(
                    mini: true,
                    onPressed: () => controller.scrollToTop(),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: const CircleBorder(),
                    elevation: 1,
                    child: const Icon(Icons.arrow_upward),
                  )
                : const SizedBox())),
        tablet: Scaffold(
            body: SmartRefresher(
                header: MaterialClassicHeader(
                        color: S.colors.appColor,
                        height: 60,
                        distance: 50,
                      ),
                controller: refreshController,
                enablePullUp: true,
                onLoading: () async {
                  await controller.getDataList(wd: wd);
                  refreshController.loadComplete();
                  if (controller.hasMore.value != 0) {
                    refreshController.loadNoData();
                  }
                },
                onRefresh: () async {
                  refreshController.resetNoData();
                  await controller.getDataList(reset: true, wd: wd);
                  refreshController.refreshCompleted();
                },
                footer: CustomFooter(
                  builder: (context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text(
                        "上拉加载更多",
                        style: TextStyle(color: S.colors.iconColor),
                      );
                    } else if (mode == LoadStatus.loading) {
                      body = const CircularProgressIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("加载失败！点击重试！",
                          style: TextStyle(color: S.colors.iconColor));
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("松手,加载更多",
                          style: TextStyle(color: S.colors.iconColor));
                    } else {
                      body = controller.pref.containsKey('isVip')
                          ? (controller.pref.getInt('isVip') == 1
                              ? Text("没有更多了",
                                  style: TextStyle(color: S.colors.iconColor))
                              : Text("升级会员查看更多",
                                  style: TextStyle(color: S.colors.iconColor)))
                          : Text("登录查看更多",
                              style: TextStyle(color: S.colors.iconColor));
                    }
                    return SizedBox(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                child: CustomScrollView(
                    controller: controller.scrollController,
                    slivers: [
                      SliverPadding(
                          padding: EdgeInsets.only(
                              top: 6.h, right: 24.w, left: 24.w),
                          sliver: Obx(() {
                            return SliverGrid.builder(
                                itemCount: controller.dataList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 24.w,
                                        crossAxisSpacing: 24.w,
                                        childAspectRatio: 0.46),
                                itemBuilder: (BuildContext context, int index) {
                                  final data = controller.dataList[index];
                                  Map<String, dynamic> values =
                                      json.decode(data.preview!);
                                  String firstImage = values['image'][0];

                                  return GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/appSinglePage',
                                            parameters: {
                                              'uuid': data.uuid!,
                                              'name': data.name!
                                            });
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                    image: CachedNetworkImageProvider(
                                                        '${R.images.thumbnailBaseUrl}$firstImage.webp',
                                                        headers: const {
                                                          'Referer':
                                                              'https://uinotes.com',
                                                        }),
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Color(0x03000000),
                                                            BlendMode
                                                                .multiply))),
                                          ),
                                          SizedBox(
                                            height: context.height * 0.08,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(12)),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 10, sigmaY: 10),
                                                child: Container(
                                                    color: Colors.black
                                                        .withOpacity(0.1)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: context.height * 0.08,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: Image(
                                                      width: 32.w,
                                                      image: CachedNetworkImageProvider(
                                                          '${R.images.thumbnailBaseUrl}${data.logoUuid!}.webp',
                                                          headers: const {
                                                            'Referer':
                                                                'https://uinotes.com',
                                                          })),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      data.name!,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Text(
                                                      '${data.num}张截图',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ));
                                });
                          }))
                    ])),
            floatingActionButton: Obx(() => controller.showButton.value
                ? FloatingActionButton(
                    mini: true,
                    onPressed: () => controller.scrollToTop(),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: const CircleBorder(),
                    elevation: 1,
                    child: const Icon(Icons.arrow_upward),
                  )
                : const SizedBox())),
        landScapeTablet: Scaffold(
            body: SmartRefresher(
                header: MaterialClassicHeader(
                        color: S.colors.appColor,
                        height: 60,
                        distance: 50,
                      ),
                controller: refreshController,
                enablePullUp: true,
                onLoading: () async {
                  await controller.getDataList(wd: wd);
                  refreshController.loadComplete();
                  if (controller.hasMore.value != 0) {
                    refreshController.loadNoData();
                  }
                },
                onRefresh: () async {
                  refreshController.resetNoData();
                  await controller.getDataList(reset: true, wd: wd);
                  refreshController.refreshCompleted();
                },
                footer: CustomFooter(
                  builder: (context, mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text(
                        "上拉加载更多",
                        style: TextStyle(color: S.colors.iconColor),
                      );
                    } else if (mode == LoadStatus.loading) {
                      body = const CircularProgressIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("加载失败！点击重试！",
                          style: TextStyle(color: S.colors.iconColor));
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("松手,加载更多",
                          style: TextStyle(color: S.colors.iconColor));
                    } else {
                      body = controller.pref.containsKey('isVip')
                          ? (controller.pref.getInt('isVip') == 1
                              ? Text("没有更多了",
                                  style: TextStyle(color: S.colors.iconColor))
                              : Text("升级会员查看更多",
                                  style: TextStyle(color: S.colors.iconColor)))
                          : Text("登录查看更多",
                              style: TextStyle(color: S.colors.iconColor));
                    }
                    return SizedBox(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                child: CustomScrollView(
                    controller: controller.scrollController,
                    slivers: [
                      SliverPadding(
                          padding: EdgeInsets.only(
                              top: 6.h, right: 32.w, left: 32.w),
                          sliver: Obx(() {
                            return SliverGrid.builder(
                                itemCount: controller.dataList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        mainAxisSpacing: 32.w,
                                        crossAxisSpacing: 32.w,
                                        childAspectRatio: 0.46),
                                itemBuilder: (BuildContext context, int index) {
                                  final data = controller.dataList[index];
                                  Map<String, dynamic> values =
                                      json.decode(data.preview!);
                                  String firstImage = values['image'][0];

                                  return GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/appSinglePage',
                                            parameters: {
                                              'uuid': data.uuid!,
                                              'name': data.name!
                                            });
                                      },
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                image: DecorationImage(
                                                    image: CachedNetworkImageProvider(
                                                        '${R.images.thumbnailBaseUrl}$firstImage.webp',
                                                        headers: const {
                                                          'Referer':
                                                              'https://uinotes.com',
                                                        }),
                                                    fit: BoxFit.cover,
                                                    colorFilter:
                                                        const ColorFilter.mode(
                                                            Color(0x03000000),
                                                            BlendMode
                                                                .multiply))),
                                          ),
                                          SizedBox(
                                            height: context.height * 0.08,
                                            child: ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                      bottom:
                                                          Radius.circular(12)),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 10, sigmaY: 10),
                                                child: Container(
                                                    color: Colors.black
                                                        .withOpacity(0.1)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: context.height * 0.08,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: Image(
                                                      width: 32.w,
                                                      image: CachedNetworkImageProvider(
                                                          '${R.images.thumbnailBaseUrl}${data.logoUuid!}.webp',
                                                          headers: const {
                                                            'Referer':
                                                                'https://uinotes.com',
                                                          })),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      data.name!,
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    SizedBox(
                                                      height: 4.h,
                                                    ),
                                                    Text(
                                                      '${data.num}张截图',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: const TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w300),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ));
                                });
                          }))
                    ])),
            floatingActionButton: Obx(() => controller.showButton.value
                ? FloatingActionButton(
                    mini: true,
                    onPressed: () => controller.scrollToTop(),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: const CircleBorder(),
                    elevation: 1,
                    child: const Icon(Icons.arrow_upward),
                  )
                : const SizedBox())));
  }
}
