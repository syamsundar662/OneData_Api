
import 'package:flutter/material.dart';
import 'package:one_data_api/model/user.dart';

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 3),
              blurRadius: 3,
              blurStyle: BlurStyle.outer,
              color: Color.fromARGB(255, 145, 145, 145),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 90,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/PngItem_1503945.png'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.name!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("UID: ${user.id}"),
                  Text("Email: ${user.email}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
