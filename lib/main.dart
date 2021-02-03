


import 'package:Medicines/provider/DatabaseProvider.dart';
import 'package:Medicines/repositories/Medicine_db_helper.dart';
import 'package:Medicines/ui/pages/AfterSplash.dart';
import 'package:Medicines/ui/pages/splach.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await MedicineDbHelper.medicineDbHelper.initializeTasksDatabase();




  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider<DatabaseProvider>(
      create: (context){
        return DatabaseProvider();
      },
      child: MaterialApp(
        title: 'Medicines',
        debugShowCheckedModeBanner: false,

        home:AfterSplash(),
      ),
    );
  }
}

