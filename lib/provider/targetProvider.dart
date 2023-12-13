import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/protien_model.dart';
import 'ProteinListProvider.dart';
 // Replace this with the correct import path for your model

class TargetProvider with ChangeNotifier {
  double? _goal = 0;
  double? get goal => _goal;



  void updateGoal(double? goal) {
    _goal = goal;
    notifyListeners();
  }

}
