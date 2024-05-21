import 'package:flutter/material.dart';

class StorageProvider extends ChangeNotifier {
  String _instituteName = "";
  String _instituteMobile = "";
  String _instituteAddress = "";
  String? _instituteLogo;

  String get getInstituteName => _instituteName;

  String? get getInstituteLogo => _instituteLogo;

  String get getInstituteMobile => _instituteMobile;

  String get getInstituteAddress => _instituteAddress;

  Future<void> setInstituteMobile(data) async {
    _instituteMobile = (data ?? '').toString();
    notifyListeners();
  }

  Future<void> setInstituteAddress(data) async {
    _instituteAddress = data ?? '';
    notifyListeners();
  }

  Future<void> setInstituteName(data) async {
    _instituteName = data ?? '';
    notifyListeners();
  }

  Future<void> setInstituteLogo(data) async {
    _instituteLogo = data;
    notifyListeners();
  }
}
