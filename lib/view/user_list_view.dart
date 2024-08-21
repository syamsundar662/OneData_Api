import 'package:flutter/material.dart';
import 'package:one_data_api/constants/constants.dart';
import 'package:one_data_api/view%20model/user_view_model.dart';
import 'package:one_data_api/widgets/user_list_items.dart';
import 'package:provider/provider.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    size(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(61, 82, 237, 1),
        actions: const [Icon(Icons.search, color: Colors.white), kWidth10],
        title: const Text(
          'Users',
          style: TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Consumer<UserViewModel>(
          builder: (context, userViewModel, child) {
            if (userViewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (userViewModel.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userViewModel.error!,
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        await userViewModel.loadUsers();
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                await userViewModel.loadUsers();
              },
              child: ListView.builder(
                itemCount: userViewModel.users.length,
                itemBuilder: (context, index) {
                  final user = userViewModel.users[index];
                  return UserListItem(user: user);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
