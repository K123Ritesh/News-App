import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/cotrollers/news_controller.dart';
import 'package:news_app/pages/news_detailing_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController(text: 'Tesla');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
          return Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                height: 40.h,
                child: Center(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      controller.filteredNews(value.toLowerCase());
                      controller.update();
                    },
                    onSubmitted: (value) {
                      controller.filteredNews(value.toLowerCase());
                      controller.update();
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (controller.isLoadingFiltered ||
                        controller.accToFilter == null)
                      const CircularProgressIndicator()
                    else
                      for (int i = 0;
                          i < controller.accToFilter!.articles!.length;
                          i++) ...{
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetailingPage(
                                          article: controller
                                              .accToFilter!.articles![i])));
                            },
                            child: Container(
                              height: 150.h,
                              width: 330.w,
                              margin: EdgeInsets.symmetric(vertical: 10.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(controller
                                              .accToFilter!
                                              .articles![i]
                                              .urlToImage ??
                                          ''))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 10.w),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.6),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.r),
                                          bottomRight: Radius.circular(20.r)),
                                    ),
                                    child: Text(
                                      controller.accToFilter!.articles![i]
                                              .title ??
                                          '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      }
                  ],
                ),
              ))
            ],
          );
        });
  }
}
