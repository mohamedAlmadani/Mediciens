import 'package:Medicines/repositories/Medicine_db_helper.dart';

class Medicine {
  int medicineId;
  String Name;
  int Amount;
  String Type;
  int weeks;
  String medicineForm;
  int Time;

  String date;

  Medicine({
    this.medicineId,
    this.Name,
    this.Amount,
    this.Time,

    this.date,
    this.medicineForm,
    this.Type,
    this.weeks
  });

  Map<String, dynamic> toMap() {
    return {
      MedicineDbHelper.medicineNameColumnName: this.Name,
      MedicineDbHelper.medicineAmountColumnName: this.Amount,
      MedicineDbHelper.medicineDateColumnName: this.date,
      MedicineDbHelper.medicineMedicineFormColumnName: this.medicineForm,
      MedicineDbHelper.medicineTypeColumnName: this.Type,
      MedicineDbHelper.medicineTimeColumnName:this.Time,

      MedicineDbHelper.medicineWeeksColumnName: this.weeks,


    };
  }
  Medicine.fromMap(Map map){
    this.medicineId=map[MedicineDbHelper.medicineIdColumnName];
    this.Name=map[MedicineDbHelper.medicineNameColumnName];
    this.Amount=map[MedicineDbHelper.medicineAmountColumnName];
    this.weeks=map[MedicineDbHelper.medicineWeeksColumnName];
    this.date=map[MedicineDbHelper.medicineDateColumnName];
    this.medicineForm=map[MedicineDbHelper.medicineMedicineFormColumnName];
    this.Time=map[MedicineDbHelper.medicineTimeColumnName];
    this.Type=map[MedicineDbHelper.medicineTypeColumnName];






  }
  String get image{
    switch(this.medicineForm){
      case "Syrup": return "assets/images/syrup.png"; break;
      case "Pill":return "assets/images/pills.png"; break;
      case "Capsule":return "assets/images/capsule.png"; break;
      case "Cream":return "assets/images/cream.png"; break;
      case "Drops":return "assets/images/drops.png"; break;
      case "Syringe":return "assets/images/syringe.png"; break;
      default : return "assets/images/pills.png"; break;

    }
  }
}