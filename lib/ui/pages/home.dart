import 'package:Medicines/model/medicine_model.dart';
import 'package:Medicines/provider/DatabaseProvider.dart';
import 'package:Medicines/repositories/Medicine_db_helper.dart';

import 'package:Medicines/ui/pages/addpills.dart';
import 'package:Medicines/ui/widget/homeWidget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Medicine> allListOfPills = List<Medicine>();
  List<Medicine> dailyPills = List<Medicine>();

  int _lastChooseDay = 0;

  // Future setData() async {
  //   allListOfPills.clear();
  //   (await  MedicineDbHelper.medicineDbHelper.selectAllPills()).forEach((map) {
  //     allListOfPills.add(Medicine.fromMap(map));
  //   });
  //   chooseDay(_daysList[_lastChooseDay]);
  // }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM').format(now);
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 850.9090909090909,
        allowFontScaling: true);
    return Scaffold(
      // drawer: Drawer(
      //   child: ListTile(
      //     trailing: Icon(Icons.),
      //   ),
      // ),

      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.ssp,
              ),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPills()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 40.h,),

            SizedBox(
              height: 10.h,
            ),

            Consumer<DatabaseProvider>(
              builder: (context, value, child) {
                return Container(
                  child: Column(
                    children:
                        value.medicines.map((e) => HomeWidget(e)).toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
  // void chooseDay(CalendarDayModel clickedDay){
  //   setState(() {
  //     _lastChooseDay = _daysList.indexOf(clickedDay);
  //     _daysList.forEach((day) => day.isChecked = false );
  //     CalendarDayModel chooseDay = _daysList[_daysList.indexOf(clickedDay)];
  //     chooseDay.isChecked = true;
  //     dailyPills.clear();
  //     allListOfPills.forEach((Medicine) {
  //       // DateTime pillDate = DateTime.fromMicrosecondsSinceEpoch(Medicine.Time * 1000);
  //       if(chooseDay.dayNumber == pillDate.day && chooseDay.month == pillDate.month && chooseDay.year == pillDate.year){
  //         dailyPills.add(Medicine);
  //       }
  //     });
  //     dailyPills.sort((pill1,pill2) => pill1.Time.compareTo(pill2.Time));
  //   });
  // }
}
