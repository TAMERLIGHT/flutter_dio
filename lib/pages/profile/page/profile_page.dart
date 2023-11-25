import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String? userProfileName;
  final String? userProfileEmail;

  const ProfilePage({Key? key, this.userProfileName, this.userProfileEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.pink,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              ProfileInfoCard(
                title: "Имя пользователя:",
                content: userProfileName ?? 'Не указано',
                icon: Icons.person,
                backgroundColor: Colors.blue,
              ),
              const SizedBox(height: 20),
              ProfileInfoCard(
                title: "Электронная почта:",
                content: userProfileEmail ?? 'Не указано',
                icon: Icons.email,
                backgroundColor: Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final Color backgroundColor;

  const ProfileInfoCard({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
