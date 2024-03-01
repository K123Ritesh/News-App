import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsContainerWidget extends StatelessWidget {
  const NewsContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => NewsDetailingPage(
          //             article: controller.newsData!.articles![i])));
        },
        child: Container(
          height: 150.h,
          width: 300.w,
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
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 255, 173, 173).withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r)),
                ),
                child: Text(
                  // controller.newsData!.articles![i].title ??
                  'Hello what are you doing dodi HIRU OJEO?/',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ));
  }
}
