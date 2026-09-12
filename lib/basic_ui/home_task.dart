import 'package:flutter/material.dart';

class HomeTask extends StatelessWidget {
  const HomeTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Layout')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ProfileHeader(),
              SizedBox(height: 32),
              StatisticsWidget(),
              SizedBox(height: 32),
              SkillsWidget(),
              SizedBox(height: 32),
              AvatarStack(),
              SizedBox(height: 32),
              ContactWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, size: 45, color: Colors.white),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Ahmed Ali',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Flutter Developer',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: StatItem(number: '120', label: 'Posts'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatItem(number: '450', label: 'Followers'),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: StatItem(number: '80', label: 'Following'),
        ),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final String number;
  final String label;

  const StatItem({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(8),
      color: Colors.blueGrey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Skills',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          height: 50,
          width: 250,
          color: Colors.blue,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16),
          child: const Text('Flutter', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 12),
        Container(
          height: 50,
          width: 200,
          color: Colors.orange,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16),
          child: const Text('Dart', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 12),
        Container(
          height: 50,
          width: 150,
          color: Colors.red,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 16),
          child: const Text('Firebase', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}

class AvatarStack extends StatelessWidget {
  const AvatarStack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: 300,
      child: Stack(
        children: [
          CircleAvatar(radius: 80, backgroundColor: Colors.blue.shade200),
          CircleAvatar(radius: 55, backgroundColor: Colors.orange),
          CircleAvatar(radius: 30, backgroundColor: Colors.red),
        ],
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Call Me', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 50,
            color: Colors.purple,
            alignment: Alignment.center,
            child: const Text('Message', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
