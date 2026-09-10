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
];

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts Screen"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactRow(contact: contacts[index]);
        },
      ),
    );
  }
}

class ContactRow extends StatelessWidget {
  final Contact contact;
  const ContactRow({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Calling ${contact.name}...')));
      },
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.teal,
        child: Text(
          getFirstTwoChars(contact.name),
          style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(contact.name, style: TextStyle(fontSize: 20)),
      subtitle: Text(contact.number),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.chat_rounded),
          const SizedBox(width: 12),
          Icon(Icons.call_rounded),
        ],
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
