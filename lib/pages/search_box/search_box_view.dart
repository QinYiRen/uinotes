import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../common/res.dart';
import '../../common/style.dart';
import 'search_box_controller.dart';

class SearchBoxPage extends GetView<SearchBoxController> {
  SearchBoxPage({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(R.icons.back)),
        actions: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 44.h,
              margin: EdgeInsets.only(right: 16.w, left: 58.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.w),
                color: S.colors.bgColor,
              ),
              child: TextField(
                controller: textEditingController,
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: (value) => controller.getDataList(value),
                onSubmitted: (value) async {
                  textEditingController.text =
                      await Get.toNamed('/searchList', parameters: {
                    'name': value,
                  });
                },
                decoration: InputDecoration(
                  icon: Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: SvgPicture.asset(R.icons.search)),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(0.w, 16.h, 20.w, 16.h),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 0),
          child: Obx(
            () => ListView(
              children: controller.dataList.map((data) {
                if (data.uuid != null) {
                  return GestureDetector(
                      onTap: () async {
                        textEditingController.text =
                            await Get.toNamed('/appSinglePage', parameters: {
                          'uuid': data.uuid!,
                          'name': data.name!,
                        });
                      },
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: S.colors.bgColor,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(4.0), // 设置圆角半径
                              child: Image(
                                  width: 24.w,
                                  image: CachedNetworkImageProvider(
                                      '${R.images.thumbnailBaseUrl}${data.logoUuid!}.webp',
                                      headers: const {
                                        'Referer': 'https://uinotes.com',
                                      })),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              data.name!,
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ));
                } else {
                  return GestureDetector(
                      onTap: () async {
                        textEditingController.text = await Get.toNamed(
                            '/searchList',
                            parameters: {'name': data.name!});
                      },
                      child: Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: S.colors.bgColor, // 设置边框颜色
                              width: 1.0, // 设置边框宽度
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(R.icons.search, width: 24.w),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              data.name!,
                              style: const TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ));
                }
              }).toList(),
            ),
          )),
    );
  }
}
