import 'package:flutter/material.dart';

class Contact {
  String name;
  String number;
  Contact({required this.name, required this.number});
}

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
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
  void removeContact(Contact contact) {
    setState(() {
      contacts.remove(contact);
    });
  }

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
          return ContactRow(contact: contacts[index], onDelete: removeContact);
        },
      ),
    );
  }
}

class ContactRow extends StatelessWidget {
  final Contact contact;
  final void Function(Contact) onDelete;
  const ContactRow({super.key, required this.contact, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(contact.number + contact.name),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDelete(contact);
      },
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContactDetails(contact: contact),
            ),
          );
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
      ),
    );
  }
}

class ContactDetails extends StatelessWidget {
  final Contact contact;
  const ContactDetails({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Details"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal,
              child: Text(
                getFirstTwoChars(contact.name),
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            const SizedBox(height: 20),
            Text(contact.name, style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text(contact.number, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
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
