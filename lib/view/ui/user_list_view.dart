import 'package:flutter/material.dart';
import 'package:one_data_api/view%20model/user_view_model.dart';
import 'package:provider/provider.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 23, 160, 185),
      title: Text('Users'),
    ),
      body: SafeArea(
        child: Consumer<UserViewModel>(
          builder: (context, value, child) {
            return ListView.builder(
                itemCount: value.users.length,
                itemBuilder: (context, index) {
                  final data = value.users;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(data[index].name!),
                                Text(data[index].id!.toString()),
                                Text(data[index].email!),
                              ],
                            ),
                          ],
                        )),
                  );
                });
          },
        ),
      ),
    );
  }
}
