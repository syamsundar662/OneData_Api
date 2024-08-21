import 'package:flutter/material.dart';
import 'package:one_data_api/services/api_service.dart';
import 'package:one_data_api/model/user.dart';

class UserViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<User> users = [];
  String? error;
  final ApiService apiService;

  UserViewModel(this.apiService) {
    loadUsers();
  }

  Future<void> loadUsers() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      users = await apiService.fetchUsers();
    } catch (e) {
      error = 'Failed to load users: ${e.toString()}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
