import 'package:flutter/material.dart';
import 'package:one_data_api/Api%20Service/api.dart';
import 'package:one_data_api/model/model.dart';

class UserViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<UserModel> users = [];
  final ApiService apiService;

  UserViewModel(this.apiService) {
    loadUsers();
  }

  Future loadUsers() async {
    final fetchedData = await ApiService().fetchUsers();
    users = fetchedData;
  }
}
