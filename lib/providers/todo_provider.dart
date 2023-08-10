import 'package:flutter/material.dart';

class NotesProvider with ChangeNotifier {
  List<String> _titles = [];
  List<String> _desrcription = [];

  TextEditingController titileController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // getter function
  List<String> get titiles => _titles;
  List<String> get description => _desrcription;

  void addNote() {
    _titles.add(titileController.text);
    _desrcription.add(descriptionController.text);
    notifyListeners();
  }

  void deleteNote(int index) {
    _titles.removeAt(index);
    _desrcription.removeAt(index);
    notifyListeners();
  }
}
