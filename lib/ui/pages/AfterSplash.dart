import 'package:Medicines/provider/DatabaseProvider.dart';
import 'package:Medicines/ui/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class AfterSplash extends StatefulWidget {

  @override
  _AfterSplashState createState() => _AfterSplashState();

}

class _AfterSplashState extends State<AfterSplash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Provider.of<DatabaseProvider>(context, listen: false).getAllPills();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Home();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 850.9090909090909,
        allowFontScaling: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80.h,),
              Container(
                width: 400.w,
                height: 400.h,
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/welcome_image.png',


                  alignment: Alignment.center,


                ),
              ),
              SizedBox(height: 10.h,),
              Text('Be in control of \nyour meds',style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                fontSize: 29.ssp,


              ),
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,

              ),
              SizedBox(height: 10.h,),
              Text('An easy-to-use and reliable app that\nhelps you remember ti take your\nmeds at the right time',
                textAlign: TextAlign.center,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 17.ssp,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold

                ),
              ),
              SizedBox(height: 60.h,),
              // Container(
              //   width: 290.w,
              //   height: 80.h,
              //   child: RaisedButton(
              //     color: Colors.green,
              //       onPressed: (){
              //         Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(builder: (context) => Home()),
              //         );
              //       },
              //
              //     shape: RoundedRectangleBorder(
              //
              //       borderRadius: BorderRadius.circular(10),
              //
              //
              //     ),
              //     child: Text('Get started now',
              //       textAlign: TextAlign.center,
              //       textDirection: TextDirection.ltr,
              //     style: TextStyle(
              //       color: Colors.white,
              //
              //       fontSize: 20.ssp
              //     ),
              //     ),
              //
              //       ),
              // )



            ],
          ),
        ),
      ),
    );
  }
}
