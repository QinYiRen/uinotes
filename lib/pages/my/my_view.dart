import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uinotes/widget/responsive.dart';
import '../../common/res.dart';

import '../../common/style.dart';
import '../single_page/single_page_controller.dart';
import 'my_controller.dart';

class MyPage extends GetView<MyController> {
  MyPage({Key? key}) : super(key: key);
  SharedPreferences pref = Get.find();
  final refreshController = RefreshController(initialRefresh: true);
  SinglePageController singlePageController = Get.find<SinglePageController>();
  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
            body: SmartRefresher(
              header: WaterDropMaterialHeader(
                distance: 40,
                color: S.colors.appColor,
                backgroundColor: Colors.white,
              ),
              controller: refreshController,
              enablePullUp: true,
              onLoading: () async {
                await controller.getDataList();
                refreshController.loadComplete();
              },
              onRefresh: () async {
                await controller.getDataList(reset: true);
                refreshController.refreshCompleted();
              },
              footer: CustomFooter(
                builder: (context, mode) {
                  if (controller.hasMore.value) {
                    mode = LoadStatus.noMore;
                  }
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
                  } else if (mode == LoadStatus.noMore) {
                    body = Text("没有更多了",
                        style: TextStyle(color: S.colors.iconColor));
                  } else {
                    body = const SizedBox(
                      height: 10,
                    );
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
                  SliverAppBar(
                      elevation: 0,
                      scrolledUnderElevation: 0,
                      pinned: true,
                      expandedHeight: 250,
                      leading: Obx(() => controller.isTitleCentered.value
                          ? Container(
                              margin: const EdgeInsets.fromLTRB(14, 7, 0, 7),
                              child: ClipOval(
                                  child: Image(
                                      image: CachedNetworkImageProvider(
                                          pref.getString('avatar') ??
                                              'https://uinotes-img.oss-cn-shanghai.aliyuncs.com/user/avatar/user-default.png',
                                          headers: const {
                                    'Referer': 'https://uinotes.com',
                                  }))))
                          : const SizedBox(
                              width: 10,
                            )),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/setting');
                            },
                            icon: SvgPicture.asset(R.icons.setting))
                      ],
                      flexibleSpace: Obx(
                        () => FlexibleSpaceBar(
                          background: Center(
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: ClipOval(
                                      child: Image(
                                          width: 84,
                                          image: CachedNetworkImageProvider(
                                              pref.getString('avatar') ??
                                                  'https://uinotes-img.oss-cn-shanghai.aliyuncs.com/user/avatar/user-default.png',
                                              headers: const {
                                                'Referer':
                                                    'https://uinotes.com',
                                              })),
                                    )),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 78.h),
                                      // color: Colors.black,
                                      child: SvgPicture.asset(
                                        pref.get('isVip') == 1
                                            ? R.icons.vip
                                            : R.icons.novip,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          expandedTitleScale: 1.1,
                          title: const Text(
                            '我的收藏',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          centerTitle: controller.isTitleCentered.value,
                          titlePadding: EdgeInsets.only(
                              left: controller.isTitleCentered.value ? 0 : 20,
                              bottom: 16),
                        ),
                      )),
                  SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      sliver: Obx(() => SliverGrid.builder(
                          itemCount: controller.dataList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16.w,
                                  crossAxisSpacing: 16.w,
                                  childAspectRatio: 0.46),
                          itemBuilder: (BuildContext context, int index) {
                            final data = controller.dataList[index];
                            RxInt collection = data.isCollection;
                            return GestureDetector(
                              onTap: () async {
                                collection = await Get.toNamed('/singleDetail',
                                    arguments: {
                                      "uuid": data.uuid,
                                      'id': data.id,
                                      "collection": collection
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            '${R.images.thumbnailBaseUrl}${data.uuid!}.webp',
                                            headers: const {
                                              'Referer': 'https://uinotes.com',
                                            }),
                                        fit: BoxFit.cover,
                                        colorFilter: const ColorFilter.mode(
                                            Color(0x03000000),
                                            BlendMode.multiply))),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        if (controller.pref
                                                    .getString('uinotes_jwt') !=
                                                '' &&
                                            controller.pref
                                                    .getString('uinotes_jwt') !=
                                                null) {
                                          String status;
                                          if (collection.value == 0) {
                                            status = 'like';
                                            collection.value = 1;
                                            final cardIndex =
                                                singlePageController.dataList
                                                    .indexWhere(
                                              (card) => card.id == data.id,
                                            );
                                            if (cardIndex != -1) {
                                              singlePageController
                                                  .dataList[cardIndex]
                                                  .isCollection
                                                  .value = 1;
                                            }
                                          } else {
                                            status = 'liked';
                                            collection.value = 0;
                                            final cardIndex =
                                                singlePageController.dataList
                                                    .indexWhere(
                                              (card) => card.id == data.id,
                                            );
                                            if (cardIndex != -1) {
                                              singlePageController
                                                  .dataList[cardIndex]
                                                  .isCollection
                                                  .value = 0;
                                            }
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
                          }))),
                ],
              ),
            ),
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
              header: WaterDropMaterialHeader(
                distance: 40,
                color: S.colors.appColor,
                backgroundColor: Colors.white,
              ),
              controller: refreshController,
              enablePullUp: true,
              onLoading: () async {
                await controller.getDataList();
                refreshController.loadComplete();
              },
              onRefresh: () async {
                await controller.getDataList(reset: true);
                refreshController.refreshCompleted();
              },
              footer: CustomFooter(
                builder: (context, mode) {
                  if (controller.hasMore.value) {
                    mode = LoadStatus.noMore;
                  }
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
                  } else if (mode == LoadStatus.noMore) {
                    body = Text("没有更多了",
                        style: TextStyle(color: S.colors.iconColor));
                  } else {
                    body = const SizedBox(
                      height: 10,
                    );
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
                  SliverAppBar(
                      elevation: 0,
                      scrolledUnderElevation: 0,
                      pinned: true,
                      expandedHeight: 250.h,
                      leading: Obx(() => controller.isTitleCentered.value
                          ? Container(
                              margin: const EdgeInsets.fromLTRB(14, 7, 0, 7),
                              child: ClipOval(
                                child: Image(
                                    image: CachedNetworkImageProvider(
                                        pref.getString('avatar') ??
                                            'https://uinotes-img.oss-cn-shanghai.aliyuncs.com/user/avatar/user-default.png',
                                        headers: const {
                                      'Referer': 'https://uinotes.com',
                                    })),
                              ))
                          : const SizedBox(
                              width: 10,
                            )),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/setting');
                            },
                            icon: SvgPicture.asset(R.icons.setting))
                      ],
                      flexibleSpace: Obx(
                        () => FlexibleSpaceBar(
                          background: Center(
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: ClipOval(
                                      child: Image(
                                          width: 84.w,
                                          image: CachedNetworkImageProvider(
                                              pref.getString('avatar') ??
                                                  'https://uinotes-img.oss-cn-shanghai.aliyuncs.com/user/avatar/user-default.png',
                                              headers: const {
                                                'Referer':
                                                    'https://uinotes.com',
                                              })),
                                    )),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 78.h),
                                      // color: Colors.black,
                                      child: SvgPicture.asset(
                                        pref.get('isVip') == 1
                                            ? R.icons.vip
                                            : R.icons.novip,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          expandedTitleScale: 1.1,
                          title: const Text(
                            '我的收藏',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          centerTitle: controller.isTitleCentered.value,
                          titlePadding: EdgeInsets.only(
                              left: controller.isTitleCentered.value ? 0 : 20,
                              bottom: 16),
                        ),
                      )),
                  SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      sliver: Obx(() => SliverGrid.builder(
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
                                collection = await Get.toNamed('/singleDetail',
                                    arguments: {
                                      "uuid": data.uuid,
                                      'id': data.id,
                                      "collection": collection
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            '${R.images.thumbnailBaseUrl}${data.uuid!}.webp',
                                            headers: const {
                                              'Referer': 'https://uinotes.com',
                                            }),
                                        fit: BoxFit.cover,
                                        colorFilter: const ColorFilter.mode(
                                            Color(0x03000000),
                                            BlendMode.multiply))),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        if (controller.pref
                                                    .getString('uinotes_jwt') !=
                                                '' &&
                                            controller.pref
                                                    .getString('uinotes_jwt') !=
                                                null) {
                                          String status;
                                          if (collection.value == 0) {
                                            status = 'like';
                                            collection.value = 1;
                                            final cardIndex =
                                                singlePageController.dataList
                                                    .indexWhere(
                                              (card) => card.id == data.id,
                                            );
                                            if (cardIndex != -1) {
                                              singlePageController
                                                  .dataList[cardIndex]
                                                  .isCollection
                                                  .value = 1;
                                            }
                                          } else {
                                            status = 'liked';
                                            collection.value = 0;
                                            final cardIndex =
                                                singlePageController.dataList
                                                    .indexWhere(
                                              (card) => card.id == data.id,
                                            );
                                            if (cardIndex != -1) {
                                              singlePageController
                                                  .dataList[cardIndex]
                                                  .isCollection
                                                  .value = 0;
                                            }
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
                          }))),
                ],
              ),
            ),
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
              header: WaterDropMaterialHeader(
                distance: 40,
                color: S.colors.appColor,
                backgroundColor: Colors.white,
              ),
              controller: refreshController,
              enablePullUp: true,
              onLoading: () async {
                await controller.getDataList();
                refreshController.loadComplete();
              },
              onRefresh: () async {
                await controller.getDataList(reset: true);
                refreshController.refreshCompleted();
              },
              footer: CustomFooter(
                builder: (context, mode) {
                  if (controller.hasMore.value) {
                    mode = LoadStatus.noMore;
                  }
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
                  } else if (mode == LoadStatus.noMore) {
                    body = Text("没有更多了",
                        style: TextStyle(color: S.colors.iconColor));
                  } else {
                    body = const SizedBox(
                      height: 10,
                    );
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
                  SliverAppBar(
                      elevation: 0,
                      scrolledUnderElevation: 0,
                      pinned: true,
                      expandedHeight: 250,
                      leading: Obx(() => controller.isTitleCentered.value
                          ? Container(
                              margin: const EdgeInsets.fromLTRB(14, 7, 0, 7),
                              child: ClipOval(
                                child: Image(
                                    image: CachedNetworkImageProvider(
                                        pref.getString('avatar') ??
                                            'https://uinotes-img.oss-cn-shanghai.aliyuncs.com/user/avatar/user-default.png',
                                        headers: const {
                                      'Referer': 'https://uinotes.com',
                                    })),
                              ))
                          : const SizedBox(
                              width: 10,
                            )),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Get.toNamed('/setting');
                            },
                            icon: SvgPicture.asset(R.icons.setting))
                      ],
                      flexibleSpace: Obx(
                        () => FlexibleSpaceBar(
                          background: Center(
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: ClipOval(
                                      child: Image(
                                          width: 84.w,
                                          image: CachedNetworkImageProvider(
                                              pref.getString('avatar') ??
                                                  'https://uinotes-img.oss-cn-shanghai.aliyuncs.com/user/avatar/user-default.png',
                                              headers: const {
                                                'Referer':
                                                    'https://uinotes.com',
                                              })),
                                    )),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 78.h),
                                      // color: Colors.black,
                                      child: SvgPicture.asset(
                                        pref.get('isVip') == 1
                                            ? R.icons.vip
                                            : R.icons.novip,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          expandedTitleScale: 1.1,
                          title: const Text(
                            '我的收藏',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          centerTitle: controller.isTitleCentered.value,
                          titlePadding: EdgeInsets.only(
                              left: controller.isTitleCentered.value ? 0 : 20,
                              bottom: 16),
                        ),
                      )),
                  SliverPadding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      sliver: Obx(() => SliverGrid.builder(
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
                                collection = await Get.toNamed('/singleDetail',
                                    arguments: {
                                      "uuid": data.uuid,
                                      'id': data.id,
                                      "collection": collection
                                    });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            '${R.images.thumbnailBaseUrl}${data.uuid!}.webp',
                                            headers: const {
                                              'Referer': 'https://uinotes.com',
                                            }),
                                        fit: BoxFit.cover,
                                        colorFilter: const ColorFilter.mode(
                                            Color(0x03000000),
                                            BlendMode.multiply))),
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      highlightColor: Colors.transparent,
                                      onPressed: () {
                                        if (controller.pref
                                                    .getString('uinotes_jwt') !=
                                                '' &&
                                            controller.pref
                                                    .getString('uinotes_jwt') !=
                                                null) {
                                          String status;
                                          if (collection.value == 0) {
                                            status = 'like';
                                            collection.value = 1;
                                            final cardIndex =
                                                singlePageController.dataList
                                                    .indexWhere(
                                              (card) => card.id == data.id,
                                            );
                                            if (cardIndex != -1) {
                                              singlePageController
                                                  .dataList[cardIndex]
                                                  .isCollection
                                                  .value = 1;
                                            }
                                          } else {
                                            status = 'liked';
                                            collection.value = 0;
                                            final cardIndex =
                                                singlePageController.dataList
                                                    .indexWhere(
                                              (card) => card.id == data.id,
                                            );
                                            if (cardIndex != -1) {
                                              singlePageController
                                                  .dataList[cardIndex]
                                                  .isCollection
                                                  .value = 0;
                                            }
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
                          }))),
                ],
              ),
            ),
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
