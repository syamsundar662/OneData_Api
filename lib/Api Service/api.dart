import 'dart:convert';

import 'package:one_data_api/model/model.dart';
import 'package:http/http.dart' as http;

const String api = 'https://jsonplaceholder.typicode.com/users';

class ApiService {
  Future<List<UserModel>> fetchUsers()async{
    final response =await http.get(Uri.parse(api));
    if(response.statusCode == 200){
      final List<dynamic> responseData = jsonDecode(response.body);
      print(responseData);
      return responseData.map((items) => UserModel.fromJson(items)).toList();
    }else{
     throw Exception('Error While Fetching');
    }

  } 
}