import 'package:flutter/material.dart';

class MyNavApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Nav Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: NavExample3(),
    );
  }
}

class NavExample3 extends StatefulWidget {
  @override
  _NavExample3State createState() => _NavExample3State();
}

class _NavExample3State extends State<NavExample3> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [CallsPage(), CameraPage(), ChatsPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => _navigate(context, Screen(title: 'Home')),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () => _navigate(context, Screen(title: 'About')),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Back'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text(['Calls', 'Camera', 'Chats'][_selectedIndex])),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Camera',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
        ],
      ),
    );
  }

  void _navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}

class Screen extends StatelessWidget {
  final String title;
  Screen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title Page')),
    );
  }
}

class CallsPage extends StatelessWidget {
  final List<String> calls = ['Mom', 'Dad', 'Friend'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.person),
          title: Text(calls[index]),
          subtitle: Text('Missed Call'),
        );
      },
    );
  }
}

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt, size: 80, color: Colors.teal),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PhotoPreviewPage()),
              );
            },
            child: Text('Open Photo Preview'),
          ),
        ],
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  final List<String> chats = ['Flutter Group', 'Team Chat', 'John'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text(chats[index]),
          subtitle: Text('Last message...'),
        );
      },
    );
  }
}

class PhotoPreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Photo Preview')),
      body: Center(child: Icon(Icons.photo, size: 100, color: Colors.grey)),
    );
  }
}
