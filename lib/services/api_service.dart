import 'dart:convert';
import 'package:one_data_api/model/user.dart';
import 'package:http/http.dart' as http;

const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

class ApiService {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      return responseData.map((items) => User.fromJson(items)).toList();
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
 