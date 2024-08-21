import 'package:flutter/material.dart';
import 'package:one_data_api/Api%20Service/api.dart';
import 'package:one_data_api/view%20model/user_view_model.dart';
import 'package:one_data_api/view/ui/user_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserViewModel(ApiService()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserListView(),
      ),
    );
  }
}
