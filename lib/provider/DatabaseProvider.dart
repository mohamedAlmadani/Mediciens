import 'package:Medicines/model/medicine_model.dart';
import 'package:Medicines/repositories/Medicine_db_helper.dart';
import 'package:flutter/cupertino.dart';

class DatabaseProvider extends ChangeNotifier{
List<Medicine>medicines=[];
fillLists(List<Medicine>medicines){
  this.medicines =medicines;
  notifyListeners();
}
insertNewDatabase(Medicine medicine) async{
  await MedicineDbHelper.medicineDbHelper.insertNewPills(medicine);
  getAllPills();

}
getAllPills() async{
  List<Map<String, dynamic>> rows=await  MedicineDbHelper.medicineDbHelper.selectAllPills();
  List<Medicine> medicines =  rows != null ? rows.map((e) => Medicine.fromMap(e)).toList() : [];
  fillLists(medicines);

}
updatePill(Medicine medicine) async{
  await MedicineDbHelper.medicineDbHelper.updatePill(medicine);
  getAllPills();
}
deletePill(Medicine medicine) async{
  await MedicineDbHelper.medicineDbHelper.deletePill(medicine.medicineId);
  getAllPills();
}
}