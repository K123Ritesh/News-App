import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              width: double.maxFinite,
              height: 40.h,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)))),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 140.h, autoPlay: true, enlargeCenterPage: true),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r)),
                        child: Center(
                          child: Text(
                            'text $i',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: Text(
                'Trending Movies',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  for (int i = 0; i < 10; i++)
                    Container(
                      height: 200.h,
                      width: 150.w,
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.r)),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
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
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Suggested For You',
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
                          Container(
                            height: 130.h,
                            width: 250.w,
                            margin: EdgeInsets.symmetric(horizontal: 7.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.r)),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 200.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r)),
                    child: Row(
                      children: [
                        Text(
                          'Explore More',
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp, color: Colors.black),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 16.h,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'New Released',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  for (int i = 0; i < 10; i++)
                    Container(
                      height: 200.h,
                      width: 150.w,
                      margin: EdgeInsets.symmetric(horizontal: 7.w),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15.r)),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              height: 100.h,
            )
          ],
        ),
      ),
    );
  }
}
