import 'package:flutter/material.dart';

class ForageData {
  final String name;
  final String location;
  final String notes;
  final bool isChecked;

  ForageData({
    required this.name,
    required this.location,
    required this.notes,
    required this.isChecked,
  });
}

class InputsProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  bool isChecked = false;

  List<ForageData> savedData = [];

  void saveData() {
    final data = ForageData(
      name: nameController.text,
      location: locationController.text,
      notes: notesController.text,
      isChecked: isChecked,
    );
    savedData.add(data);
    notifyListeners();
  }

  void resetAllControllers() {
    nameController.clear();
    locationController.clear();
    notesController.clear();
    isChecked = false;
    notifyListeners();
  }

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
