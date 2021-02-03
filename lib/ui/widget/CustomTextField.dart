import 'package:flutter/material.dart';
class CustomTextFiled extends StatefulWidget {

  String label;
  Function OnChange;
  CustomTextFiled({this.label,this.OnChange});

  @override
  _CustomTextFiledState createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        onChanged: widget.OnChange,

        decoration: InputDecoration(
            labelText: widget.label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );



  }
}
