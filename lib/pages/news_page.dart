import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/cotrollers/news_controller.dart';
import 'package:news_app/pages/news_container_widget.dart';
import 'package:news_app/pages/news_detailing_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(),
        builder: (controller) {
          // if (controller.isLoading) {
          //   return const Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (controller.newsData == null) {
          //   return const Center(
          //     child: Text('Data is NULL'),
          //   );
          // }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 30.h,
                            semanticLabel: 'Menu',
                            weight: 40.sp,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'Trending Articles',
                      style: GoogleFonts.sansita(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 1,
                      height: 150.h,
                      autoPlay: true,
                      enlargeCenterPage: true),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsDetailingPage(
                                          article: controller
                                              .newsData!.articles![i])));
                            },
                            child: Container(
                              height: 150.h,
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.r),
                                // image: DecorationImage(
                                //     fit: BoxFit.fill,
                                //     image: NetworkImage(controller.newsData!
                                //             .articles![i].urlToImage ??
                                //         ''))),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 10.w),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                              255, 255, 173, 173)
                                          .withOpacity(0.6),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.r),
                                          bottomRight: Radius.circular(20.r)),
                                    ),
                                    child: Text(
                                      // controller.newsData!.articles![i].title ??
                                      'Hello what are you doing dodi HIRU OJEO?/',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14.sp),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                          Color.fromARGB(255, 156, 211, 255),
                          Color.fromARGB(255, 187, 92, 255),
                        ])),
                    child: Column(children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Suggested Articles For You',
                        style: GoogleFonts.pacifico(
                            fontSize: 23.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            for (int i = 0; i < 10; i++)
                              const NewsContainerWidget()
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ]))

                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       for (int i = 0;
                //           i < min(controller.newsData!.articles!.length, 5);
                //           i++) ...{
                // InkWell(
                //     onTap: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => NewsDetailingPage(
                //                   article: controller
                //                       .newsData!.articles![i])));
                //     },
                //     child: Container(
                //       height: 150.h,
                //       width: 300.w,
                //       margin: EdgeInsets.symmetric(horizontal: 10.w),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(20.r),
                //           image: DecorationImage(
                //               fit: BoxFit.fill,
                //               image: NetworkImage(controller.newsData!
                //                       .articles![i].urlToImage ??
                //                   ''))),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         children: [
                //           Container(
                //             width: double.maxFinite,
                //             padding: EdgeInsets.symmetric(
                //                 vertical: 5.h, horizontal: 10.w),
                //             decoration: BoxDecoration(
                //               color: Colors.red.withOpacity(0.6),
                //               borderRadius: BorderRadius.only(
                //                   bottomLeft: Radius.circular(20.r),
                //                   bottomRight: Radius.circular(20.r)),
                //             ),
                //             child: Text(
                //               controller.newsData!.articles![i].title ??
                //                   '',
                //               style: TextStyle(
                //                   color: Colors.white, fontSize: 14.sp),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ))
                //       },
                //     ],
                //   ),
                // ),
                ,
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Latest News',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                for (int i = 0; i < 5; i++) ...{
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r)),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Hello this is News Caption Hello this is News Captio Hello this is News CaptioHello this is News Captio',
                                style: GoogleFonts.poppins(fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Container(
                                      height: 25.h,
                                      width: 25.w,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white),
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Unkwnown Author',
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 255, 161, 154),
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                },
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 100.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          );
        });
  }
}
