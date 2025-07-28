import 'package:flutter/material.dart';

import '../data/company_app.dart';
import '../data/personal_app.dart';
import '../model/project_data_model.dart';

class HomeScreenViewmodel extends ChangeNotifier {
  bool _showCompany = true;
  String _searchQuery = '';

  bool get showCompany => _showCompany;
  String get searchQuery => _searchQuery;

  List<ProjectDataModel> get projects {
    final list = _showCompany ? companyProjects : personalProjects;
    if (_searchQuery.isEmpty) return list;
    // Filter projects based on search query for both name and description and industry
    return list
        .where((p) =>
            p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            p.description.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            p.industry.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void toggleProjectType() {
    _showCompany = !_showCompany;
    notifyListeners();
  }

  void updateSearch(String value) {
    _searchQuery = value;
    notifyListeners();
  }
}
