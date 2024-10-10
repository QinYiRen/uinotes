import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uinotes/utils/image_save_util.dart';
import 'package:uinotes/widget/responsive.dart';
import '../../common/res.dart';
import 'single_page_detail_controller.dart';

class SinglePageDetailPage extends GetView<SinglePageDetailController> {
  SinglePageDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    var uuid = arguments['uuid'];
    var id = arguments['id'];
    RxInt collection = arguments['collection'];
    return Responsive(
        mobile: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
                onPressed: () {
                  Get.back(result: collection);
                },
                icon: SvgPicture.asset(
                  R.icons.back,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                )),
          ),
          body: Container(
              width: context.width,
              height: context.height,
              color: Colors.black87,
              child: Padding(
                padding: EdgeInsets.fromLTRB(54.w, 0.h, 54.w, 0.h),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                          height: 560.h,
                          image: CachedNetworkImageProvider(
                              '${R.images.originBaseUrl}${uuid!}.webp',
                              headers: const {
                                'Referer': 'https://uinotes.com',
                              })),
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            iconSize: 72.w,
                            onPressed: () {
                              if (controller.pref.getString('uinotes_jwt') !=
                                      '' &&
                                  controller.pref.getString('uinotes_jwt') !=
                                      null) {
                                String status;
                                if (collection.value == 0) {
                                  status = 'like';
                                  collection.value = 1;
                                } else {
                                  status = 'liked';
                                  collection.value = 0;
                                }
                                controller.likeAction(id, status);
                              } else {
                                Get.toNamed('/login');
                              }
                            },
                            icon: Obx(() => SvgPicture.asset(
                                collection.value == 0
                                    ? R.icons.hearBig
                                    : R.icons.heartBigSelected))),
                        IconButton(
                            iconSize: 72.w,
                            onPressed: () {
                              ImageSaveUtil.saveImageToGallery(
                                  '${R.images.originBaseUrl}${uuid!}.webp');
                            },
                            icon: SvgPicture.asset(R.icons.download))
                      ],
                    ))
                  ],
                ),
              )),
        ),
        tablet: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back(result: collection);
                },
                icon: SvgPicture.asset(
                  R.icons.back,
                  width: 32.w,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                )),
          ),
          body: Container(
            width: context.width,
            height: context.height,
            color: Colors.black87,
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.fromLTRB(54.w, 0.h, 54.w, 0.h),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                        height: 900.h,
                        image: CachedNetworkImageProvider(
                            '${R.images.originBaseUrl}${uuid!}.webp',
                            headers: const {
                              'Referer': 'https://uinotes.com',
                            })),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          iconSize: 72.w,
                          onPressed: () {
                            if (controller.pref.getString('uinotes_jwt') !=
                                    '' &&
                                controller.pref.getString('uinotes_jwt') !=
                                    null) {
                              String status;
                              if (collection.value == 0) {
                                status = 'like';
                                collection.value = 1;
                              } else {
                                status = 'liked';
                                collection.value = 0;
                              }
                              controller.likeAction(id, status);
                            } else {
                              Get.toNamed('/login');
                            }
                          },
                          icon: Obx(() => SvgPicture.asset(collection.value == 0
                              ? R.icons.hearBig
                              : R.icons.heartBigSelected))),
                      IconButton(
                          iconSize: 72.w,
                          onPressed: () {
                            ImageSaveUtil.saveImageToGallery(
                                '${R.images.originBaseUrl}${uuid!}.webp');
                          },
                          icon: SvgPicture.asset(R.icons.download))
                    ],
                  ))
                ],
              ),
            )),
          ),
        ),
        landScapeTablet: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back(result: collection);
                },
                icon: SvgPicture.asset(
                  R.icons.back,
                  width: 32.w,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                )),
          ),
          body: Container(
            width: context.width,
            height: context.height,
            color: Colors.black87,
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.fromLTRB(54.w, 0.h, 54.w, 0.h),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                        height: 560.h,
                        image: CachedNetworkImageProvider(
                            '${R.images.originBaseUrl}${uuid!}.webp',
                            headers: const {
                              'Referer': 'https://uinotes.com',
                            })),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          iconSize: 72.w,
                          onPressed: () {
                            if (controller.pref.getString('uinotes_jwt') !=
                                    '' &&
                                controller.pref.getString('uinotes_jwt') !=
                                    null) {
                              String status;
                              if (collection.value == 0) {
                                status = 'like';
                                collection.value = 1;
                              } else {
                                status = 'liked';
                                collection.value = 0;
                              }
                              controller.likeAction(id, status);
                            } else {
                              Get.toNamed('/login');
                            }
                          },
                          icon: Obx(() => SvgPicture.asset(collection.value == 0
                              ? R.icons.hearBig
                              : R.icons.heartBigSelected))),
                      IconButton(
                          iconSize: 72.w,
                          onPressed: () {
                            ImageSaveUtil.saveImageToGallery(
                                '${R.images.originBaseUrl}${uuid!}.webp');
                          },
                          icon: SvgPicture.asset(R.icons.download))
                    ],
                  ))
                ],
              ),
            )),
          ),
        ));
  }
}
