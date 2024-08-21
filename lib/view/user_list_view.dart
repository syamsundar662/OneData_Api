import 'package:flutter/material.dart';
import 'package:one_data_api/view%20model/user_view_model.dart';
import 'package:one_data_api/widgets/user_list_items.dart';
import 'package:provider/provider.dart';

class UserListView extends StatelessWidget {
  const UserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(61, 82, 237, 1),
        actions: const [Icon(Icons.search,color: Colors.white,),SizedBox(width: 10,)],
        title: const Text('Users',style: TextStyle(color: Colors.white, fontSize: 26,fontWeight: FontWeight.bold),),
        
      ),
      body: SafeArea(
        child: Consumer<UserViewModel>(
          builder: (context, userViewModel, child) {
            if (userViewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (userViewModel.error != null) {
              return Center(
                child: Text(
                  userViewModel.error!,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              );
            }

            return ListView.builder(
              itemCount: userViewModel.users.length,
              itemBuilder: (context, index) {
                final user = userViewModel.users[index];
                return UserListItem(user: user);
              },
            );
          },
        ),
      ),
    );
  }
}
