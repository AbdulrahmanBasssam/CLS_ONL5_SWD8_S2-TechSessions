import 'package:flutter/material.dart';

class Contact {
  String name;
  String number;
  Contact({required this.name, required this.number});
}

List<Contact> contacts = [
  Contact(name: "Ahmed Ali", number: "0123456789"),
  Contact(name: "Ali Mohamed", number: "0194739893"),
  Contact(name: "Mohamed Ali", number: "0123456789"),
  Contact(name: "Hussein Khaled", number: "09288488993"),
  Contact(name: "Usama elsharawy", number: "6556"),
  Contact(name: "Usama waleed", number: "6556"),
  Contact(name: "Usama tarek", number: "6556"),
  Contact(name: "Hussein tarek", number: "09288488993"),
  Contact(name: "Hussein ibrahim", number: "09288488993"),
  Contact(name: "Hussein jawad", number: "09288488993"),
  Contact(name: "Hussein valid", number: "09288488993"),
  Contact(name: "Hussein elsharawy", number: "09288488993"),
  Contact(name: "Hussein ramadan", number: "09288488993"),
  Contact(name: "Hussein yasser", number: "09288488993"),
  Contact(name: "Hussein omar", number: "09288488993"),
  Contact(name: "Hussein qasem", number: "09288488993"),
  Contact(name: "Hussein iqbal", number: "09288488993"),
  Contact(name: "Hussein nabil", number: "09288488993"),
  Contact(name: "Hussein nabil", number: "09288488993"),
  Contact(name: "Hussein nabil", number: "09288488993"),
  Contact(name: "Hussein nabil", number: "09288488993"),
  Contact(name: "Hussein nabil", number: "09288488993"),
  Contact(name: "Hussein nabil", number: "09288488993"),
];

class ContactsGrideScreen extends StatelessWidget {
  const ContactsGrideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts Screen")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.7,
        ),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactGridItem(contact: contacts[index]);
        },
      ),
    );
  }
}

class ContactGridItem extends StatelessWidget {
  final Contact contact;
  const ContactGridItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.teal.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.teal,
              child: Text(
                getFirstTwoChars(contact.name),
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            FittedBox(
              child: Text(
                contact.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            FittedBox(child: Text(contact.number)),
          ],
        ),
      ),
    );
  }

  String getFirstTwoChars(String name) {
    final parts = name.trim().split(' ');

    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    } else if (parts.length > 1) {
      return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
    } else {
      return '';
    }
  }
}
