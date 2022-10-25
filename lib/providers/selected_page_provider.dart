import 'package:flutter/material.dart';

class SelectedPageProvider extends ChangeNotifier {
  int _selectedPageIndex = 0;

  int get selectedPageIndex {
    return _selectedPageIndex;
  }

  set selectedPageIndex(int newIndex) {
    _selectedPageIndex = newIndex;
    notifyListeners();
  }
}
