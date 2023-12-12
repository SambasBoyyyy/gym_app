import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../models/protien_model.dart'; // Replace this with the correct import path for your model

class ProteinListProvider with ChangeNotifier {
  List<ProteinSource> _proteinSources = [];
  List<ProteinSource> _selectedProteinSources = [];
  String _selectedCategory = 'raw';

  List<ProteinSource> get proteinSources => _proteinSources;
  List<ProteinSource> get selectedProteinSources => _selectedProteinSources;
  String get selectedCategory => _selectedCategory;

  ProteinListProvider() {
    WidgetsFlutterBinding.ensureInitialized();
    // _todos = [];
    // initDb();
    // getTodos();
    loadProteinSources();
  }


  Future<void> loadProteinSources() async {
    final String jsonString = await rootBundle.loadString('assets/protein_sources.json');
    List<dynamic> jsonList = json.decode(jsonString);
    _proteinSources = jsonList.map((json) => ProteinSource.fromJson(json)).toList();
    updateSelectedProteinSources(_selectedCategory);
    notifyListeners();
  }
  List<ProteinSource> getFilteredProteinSources() {
    // print(_proteinSources.where((source) => source.category == _selectedCategory).toList());
    return _proteinSources.where((source) => source.category == _selectedCategory).toList();
  }

  void updateSelectedProteinSources(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
