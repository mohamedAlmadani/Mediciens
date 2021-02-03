import 'package:Medicines/model/medicineForm_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineFormwidget extends StatelessWidget {
  MedicineForm medicineForm;
  Function handler;
  MedicineFormwidget(this.medicineForm,this.handler);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 392.72727272727275,
        height: 850.9090909090909,
        allowFontScaling: true);
    return GestureDetector(
      onTap: ()=>handler(medicineForm),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: medicineForm.isChossse ? Colors.green :Colors.white,
                  border: Border.all(width: 2.0, color: const Color(0xFFFFFFFF))),
              height: 90.h,
              width: 90.w,
              child: Column(
                children: [
                  Container(
                      child: Image.asset(
                    medicineForm.imageUrl,
                    width: 70.w,
                    height: 70.h,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    medicineForm.Name,
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
