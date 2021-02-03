import 'dart:convert';

import 'package:Medicines/model/medicine_model.dart';
import 'package:Medicines/provider/DatabaseProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {

  Medicine medicine;
  HomeWidget(this.medicine);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<DatabaseProvider>(context, listen: false).getAllPills();
  //
  //
  // }
  String date;
  String _startTime = "8:30 AM";
  _getTimeFromUser({@required bool isStartTime}) async {
    var _pickedTime = await _showTimePicker();
    print(_pickedTime.format(context));
    String _formatedTime = _pickedTime.format(context);
    print(_formatedTime);
    if (_pickedTime == null)
      print("time canceld");
    else if (isStartTime)
      setState(() {
        _startTime = _formatedTime;


      });

  }
  TimeOfDay _time = TimeOfDay.now();
  _showTimePicker() async {
    return showTimePicker(
      initialTime: TimeOfDay(hour: 8, minute: 30),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }


  DateTime dob = DateTime.now().subtract(Duration(seconds: 10));
  void convertDateFromString(String date){
    DateTime todayDate = DateTime.parse(widget.medicine.date);
    print(todayDate);

  }


  // DateTime parseDt = DateTime.parse(widget.medicine.date.toString());



  // Color getColor(){
  //   if(widget.medicine.date.difference(dob).){
  //     return Colors.red;
  //
  //   }else{
  //     return Colors.green;
  //   }
  // }


  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 850.9090909090909,
        allowFontScaling: true);
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,

        // barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('are you sure?'),
            actions: <Widget>[
              TextButton(
                child: Text('delete'),
                onPressed: () {
                  context.read<DatabaseProvider>().deletePill(widget.medicine);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    DateTime setDate = DateTime.now();


   // DateTime timenow = medicine.date.add(Duration(seconds: 5));
    bool colortime = true;



    return Card(
        child: ListTile(
          // tileColor: getColor(),


            onTap: () {
              _showMyDialog();
            },
            trailing: Text(
              '${widget.medicine.date} ',
              textAlign: TextAlign.center,
            ),
            title: Text(
              '${widget.medicine.Name} ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.ssp,
              ),
            ),
            subtitle: Text(
              '${widget.medicine.Amount}${widget.medicine.Type}  ${widget.medicine.medicineForm} ',
              style: TextStyle(fontSize: 18.ssp, color: Colors.grey),
            ),
            leading: Container(
              width: 60.w,
              height: 60.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(widget.medicine.image),
              ),
            )));
  }
}
