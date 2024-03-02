import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/pages/web_view_page.dart';

class NewsDetailingPage extends StatefulWidget {
  const NewsDetailingPage({super.key, required this.article});

  final Articles article;

  @override
  State<NewsDetailingPage> createState() => _NewsDetailingPageState();
}

class _NewsDetailingPageState extends State<NewsDetailingPage> {
  @override
  Widget build(BuildContext context) {
    DateTime curr = DateTime.now();
    String currentDay = '${curr.day}-${curr.month}-${curr.year}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Article'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(children: [
          Row(
            children: [
              Text(
                currentDay,
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            widget.article.title ?? '',
            style: GoogleFonts.sansita(
                color: Colors.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              widget.article.urlToImage ?? '',
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            child: Row(
              children: [
                Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  widget.article.author ?? 'Unkwnown Author',
                  style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 255, 158, 151),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.article.content ?? '',
            style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20.h,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WebViewPage(url: widget.article.url ?? 'tu')));
              },
              child: const Text('View in Detail'))
        ]),
      ),
    );
  }
}
