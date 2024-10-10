import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uinotes/widget/responsive.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'search_ocr_controller.dart';

class SearchOcrPage extends GetView<SearchOcrController> {
  SearchOcrPage({Key? key, required this.wd}) : super(key: key);

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
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 16,
                                        crossAxisSpacing: 16,
                                        childAspectRatio: 0.46),
                                itemBuilder: (BuildContext context, int index) {
                                  final data = controller.dataList[index];
                                  RxInt collection = data.isCollection;

                                  return GestureDetector(
                                    onTap: () async {
                                      collection = await Get.toNamed(
                                          '/singleDetail',
                                          arguments: {
                                            "uuid": data.uuid,
                                            'id': data.id,
                                            "collection": collection
                                          });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  '${R.images.thumbnailBaseUrl}${data.uuid!}.webp',
                                                  headers: const {
                                                    'Referer':
                                                        'https://uinotes.com',
                                                  }),
                                              fit: BoxFit.cover,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Color(0x03000000),
                                                      BlendMode.multiply))),
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            highlightColor: Colors.transparent,
                                            onPressed: () {
                                              if (controller.pref.getString(
                                                          'uinotes_jwt') !=
                                                      '' &&
                                                  controller.pref.getString(
                                                          'uinotes_jwt') !=
                                                      null) {
                                                String status;
                                                if (collection.value == 0) {
                                                  status = 'like';
                                                  collection.value = 1;
                                                } else {
                                                  status = 'liked';
                                                  collection.value = 0;
                                                }
                                                controller.likeAction(
                                                    data.id!, status);
                                              } else {
                                                Get.toNamed('/login');
                                              }
                                            },
                                            icon: Obx(() => SvgPicture.asset(
                                                collection.value == 0
                                                    ? R.icons.heartUnselected
                                                    : R.icons.heartSelected))),
                                      ),
                                    ),
                                  );
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
                                  RxInt collection = data.isCollection;

                                  return GestureDetector(
                                    onTap: () async {
                                      collection = await Get.toNamed(
                                          '/singleDetail',
                                          arguments: {
                                            "uuid": data.uuid,
                                            'id': data.id,
                                            "collection": collection
                                          });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  '${R.images.thumbnailBaseUrl}${data.uuid!}.webp',
                                                  headers: const {
                                                    'Referer':
                                                        'https://uinotes.com',
                                                  }),
                                              fit: BoxFit.cover,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Color(0x03000000),
                                                      BlendMode.multiply))),
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            highlightColor: Colors.transparent,
                                            onPressed: () {
                                              if (controller.pref.getString(
                                                          'uinotes_jwt') !=
                                                      '' &&
                                                  controller.pref.getString(
                                                          'uinotes_jwt') !=
                                                      null) {
                                                String status;
                                                if (collection.value == 0) {
                                                  status = 'like';
                                                  collection.value = 1;
                                                } else {
                                                  status = 'liked';
                                                  collection.value = 0;
                                                }
                                                controller.likeAction(
                                                    data.id!, status);
                                              } else {
                                                Get.toNamed('/login');
                                              }
                                            },
                                            icon: Obx(() => SvgPicture.asset(
                                                collection.value == 0
                                                    ? R.icons.heartUnselected
                                                    : R.icons.heartSelected))),
                                      ),
                                    ),
                                  );
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
                                  RxInt collection = data.isCollection;

                                  return GestureDetector(
                                    onTap: () async {
                                      collection = await Get.toNamed(
                                          '/singleDetail',
                                          arguments: {
                                            "uuid": data.uuid,
                                            'id': data.id,
                                            "collection": collection
                                          });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  '${R.images.thumbnailBaseUrl}${data.uuid!}.webp',
                                                  headers: const {
                                                    'Referer':
                                                        'https://uinotes.com',
                                                  }),
                                              fit: BoxFit.cover,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Color(0x03000000),
                                                      BlendMode.multiply))),
                                      child: Container(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            highlightColor: Colors.transparent,
                                            onPressed: () {
                                              if (controller.pref.getString(
                                                          'uinotes_jwt') !=
                                                      '' &&
                                                  controller.pref.getString(
                                                          'uinotes_jwt') !=
                                                      null) {
                                                String status;
                                                if (collection.value == 0) {
                                                  status = 'like';
                                                  collection.value = 1;
                                                } else {
                                                  status = 'liked';
                                                  collection.value = 0;
                                                }
                                                controller.likeAction(
                                                    data.id!, status);
                                              } else {
                                                Get.toNamed('/login');
                                              }
                                            },
                                            icon: Obx(() => SvgPicture.asset(
                                                collection.value == 0
                                                    ? R.icons.heartUnselected
                                                    : R.icons.heartSelected))),
                                      ),
                                    ),
                                  );
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
