import 'package:Medicines/model/medicineForm_model.dart';
import 'package:Medicines/model/medicine_model.dart';
import 'package:Medicines/provider/DatabaseProvider.dart';

import 'package:Medicines/ui/widget/mediucunedorm_widet.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddPills extends StatefulWidget {
  @override
  _AddPillsState createState() => _AddPillsState();
}

class _AddPillsState extends State<AddPills> {
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
  _showTimePicker() async {
    return showTimePicker(
      initialTime: TimeOfDay(hour: 8, minute: 30),
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    );
  }
  TextEditingController controller = new TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Medicine medicine;
  String selectWeight;

  final List<MedicineForm> medicineForms = [
    MedicineForm(
      imageUrl: 'assets/images/syrup.png',
      Name: 'Syrup',
      isChossse: true,
    ),
    MedicineForm(
      imageUrl: 'assets/images/pills.png',
      Name: 'Pill',
      isChossse: false,
    ),
    MedicineForm(
      imageUrl: 'assets/images/capsule.png',
      Name: 'Capsule',
      isChossse: false,
    ),
    MedicineForm(
      imageUrl: 'assets/images/cream.png',
      Name: 'Cream',
      isChossse: false,
    ),
    MedicineForm(
      imageUrl: 'assets/images/drops.png',
      Name: 'Drops',
      isChossse: false,
    ),
    MedicineForm(
      imageUrl: 'assets/images/syringe.png',
      Name: 'Syringe',
      isChossse: false,
    ),
  ];
  void medicineTypeClick(MedicineForm medicine) {
    setState(() {
      medicineForms.forEach((medicineType) => medicineType.isChossse = false);
      medicineForms[medicineForms.indexOf(medicine)].isChossse = true;
    });
  }

  int medicineId;
  String Name;
  int Amount;
  String Type;
  int weeks;
  String medicineForm;
  int Time;
  String date;
  void popUpMenuItemChanged(String value) =>
      setState(() => this.selectWeight = value);

  String dropdownValue = 'pills';
  int currentSliderValue = 1;
  List<MedicineForm> displayedmedi = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // displayedmedi = medicineForms;
    selectWeight = weightvalues[0];
  }

  DateTime _data = DateTime.now();

  DateTime selectedDate = DateTime.now();
  DateTime setDate = DateTime.now();

  TimeOfDay _time = TimeOfDay.now();

  // _selectedDate(BuildContext context) async {
  //   var _pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: _data,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //   );
  //   if (_pickedDate != null) {
  //     setState(() {
  //       _data = _pickedDate;
  //       date = DateFormat.yMd().add_jms().format(DateTime.now());
  //     });
  //   }
  // }

  TimeOfDay _currentTime = TimeOfDay.now();
  // Future<void> openTimePicker() async {
  //   await showTimePicker(
  //           context: context,
  //           initialTime: TimeOfDay.now(),
  //           helpText: "Choose Time");
  //   setState(() {
  //
  //
  //   });
  //
  //
  //    );
  // }

  Future<void> openDatePicker() async {
    await showDatePicker(
            context: context,
            initialDate: setDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 100000)))
        .then((value) {
      DateTime data = DateTime(
          value != null ? value.year : setDate.year,
          value != null ? value.month : setDate.month,
          value != null ? value.day : setDate.day,
          setDate.hour,
          setDate.minute);
      setState(() {
        setDate = data;
        date = DateFormat('dd-MM-yyyy\n HH:mm').format(data);
      });
      print(setDate.day);
      print(setDate.month);
      print(setDate.year);
    });
  }

  final List<String> weightvalues = ["pills", "mg", "ml"];

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');
  // Future<TimeOfDay> _selectTime(BuildContext context,
  //     {@required DateTime initialDate}) {
  //   final now = DateTime.now();
  //
  //   return showTimePicker(
  //     context: context,
  //     initialTime:
  //         TimeOfDay(hour: initialDate.hour, minute: initialDate.minute),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 850.9090909090909,
        allowFontScaling: true);
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            ListTile(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30.ssp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Add Pills',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.ssp,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        this.Name = value;
                      },
                      decoration: InputDecoration(
                          labelText: 'pills Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ],
              ),
            ),

            // CustomTextFiled(
            //   label: 'pills Name',
            //   OnChange: (value) {
            //     Name = value;
            //   },
            // ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    width: 8000.w,
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      onChanged: (value) {
                        Amount = int.parse(value).toInt();
                      },
                      decoration: InputDecoration(
                          labelText: 'pills Amount',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        labelText: 'Type',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    value: selectWeight,
                    onChanged: (value) {
                      selectWeight = value;
                    },
                    items: weightvalues
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            // Container(
            //   alignment: Alignment.bottomLeft,
            //   padding: EdgeInsets.symmetric(horizontal: 30.w),
            //   child: Text(
            //     'How long?',
            //     style: TextStyle(
            //       color: Colors.black87,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 15.ssp,
            //     ),
            //   ),
            // ),
            // Slider(
            //   value: currentSliderValue.toDouble(),
            //   activeColor: Colors.green,
            //   inactiveColor: Colors.green,
            //   min: 1,
            //   max: 10,
            //   onChanged: (double value) {
            //     setState(() {
            //       currentSliderValue = value.round();
            //       //  currentSliderValue = weeks;
            //     });
            //   },
            //   divisions: 5,
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20.h),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Text(currentSliderValue.toString()),
            //       SizedBox(
            //         width: 5.w,
            //       ),
            //       Text('weeks')
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10.h,
            // ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Medicine form',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.ssp,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
                height: 200.h,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...medicineForms
                        .map((e) => MedicineFormwidget(e, medicineTypeClick))
                  ],
                )),
            // Row(
            //   children: [
            //     // Flexible(
            //     //   child: Padding(
            //     //     padding: const EdgeInsets.all(8.0),
            //     //     child: Container(
            //     //       decoration: BoxDecoration(
            //     //           borderRadius: BorderRadius.circular(10),
            //     //           color: Colors.green),
            //     //       child: ListTile(
            //     //         trailing: IconButton(
            //     //             icon: Icon(
            //     //               Icons.access_time,
            //     //               color: Colors.black87,
            //     //             ),
            //     //             onPressed: () {
            //     //               openTimePicker();
            //     //             }
            //     //             //   final time = await _selectTime(context,
            //     //             //       initialDate: selectedDate);
            //     //             //   if (time == null) return;
            //     //             //
            //     //             //   setState(() {
            //     //             //     selectedDate  = DateTime(
            //     //             //       selectedDate.year,
            //     //             //       selectedDate.month,
            //     //             //       selectedDate.day,
            //     //             //       time.hour,
            //     //             //       time.minute,
            //     //             //     );
            //     //             //     Time=int.parse('${selectedDate}');
            //     //             //
            //     //             //
            //     //             //
            //     //             //
            //     //             //   });
            //     //             // },
            //     //             ),
            //     //         leading: Text(
            //     //           DateFormat.Hm().format(this.setDate),
            //     //           style: TextStyle(color: Colors.black87),
            //     //         ),
            //     //       ),
            //     //     ),
            //     //   ),
            //     // ),
            //     // SizedBox(
            //     //   width: 10.w,
            //     // ),
            //
            //     SizedBox(
            //       width: 10.w,
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                width: 150.w,
                height: 70.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green),
                child: ListTile(
                  trailing: IconButton(
                    icon: Icon(
                      Icons.access_time,
                      color: Colors.black87,
                    ),
                    onPressed: () {
                      _getTimeFromUser(isStartTime: true);
                    },
                  ),
                  leading: Text(
                  _startTime,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 290.w,
              height: 80.h,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.green,
                onPressed: () async {
                  Medicine medicine = Medicine(
                      Name: Name,
                      Type: selectWeight,
                      weeks: currentSliderValue,
                      medicineId: medicineId,
                      Amount: Amount,
                      date: _startTime,
                      Time: Time,
                      medicineForm: medicineForms[medicineForms.indexWhere(
                              (element) => element.isChossse == true)]
                          .Name);
                  await context
                      .read<DatabaseProvider>()
                      .insertNewDatabase(medicine);
                  Navigator.pop(context);
                },
                child: Text(
                  'Done',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20.ssp),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }

  // void setPassing(String value) {
  //   switch (value) {
  //     case 'pills':
  //       medicine.Type = 1;
  //       break;
  //     case 'mg':
  //       medicine.Type = 2;
  //       break;
  //     case 'ml':
  //       medicine.Type = 3;
  //       break;
  //   }
  // }
  // String getPassing(int value){
  //   String Type;
  //   switch(value){
  //     case 1:
  //       Type=_status[0];
  //       break;
  //     case 2:
  //       Type=_status[1];
  //       break;
  //     case 3:
  //       Type=_status[2];
  //       break;
  //
  //   }
  //   return Type;
  // }
}
