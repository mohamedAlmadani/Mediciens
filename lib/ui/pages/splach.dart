import 'dart:async';

import 'package:Medicines/provider/DatabaseProvider.dart';
import 'package:Medicines/ui/pages/AfterSplash.dart';
import 'package:Medicines/ui/pages/home.dart';
import 'package:Medicines/ui/widget/homeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  // final splashDelay = 5;
  //
  //
  //
  //
  // _loadWidget() async {
  //   var _duration = Duration(seconds: splashDelay);
  //   Provider.of<DatabaseProvider>(context, listen: false).getAllPills();
  //
  //   return Timer(_duration, navigationPage);
  // }
  //
  // void navigationPage() {
  //   Navigator.pushReplacement(context,
  //       MaterialPageRoute(builder: (BuildContext context) => AfterSplash()));
  // }

  @override
  Widget build(BuildContext context) {


    // Future.delayed(Duration(seconds: 3)).then((value) {
    //   Provider.of<DatabaseProvider>(context, listen: false).getAllPills();
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //     return Home();
    //   }));
    // });
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 850.9090909090909,
        allowFontScaling: true);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400.w,
            height: 400.h,
            padding: EdgeInsets.all(8),
            child: Image.asset(
              'assets/images/welcome_image.png',
              alignment: Alignment.center,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text('Welcome ',
              style:
                  GoogleFonts.aladin(color: Colors.black87, fontSize: 25.ssp)),
        ],
      ),
    );
  }
}
