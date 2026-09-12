import 'package:flutter/material.dart';

class NavExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Push & Pop Demo', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Second Page'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage()),
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class NavExample2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Pass Data Demo', home: HomePage2());
  }
}

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  String _message = 'No data yet';
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter message'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Send to Second Page'),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SecondPage2(data: _controller.text.trim()),
                  ),
                );

                if (result != null) {
                  setState(() {
                    _message = result;
                  });
                }

                _controller.clear();
              },
            ),
            SizedBox(height: 20),
            Text('Returned: $_message'),
          ],
        ),
      ),
    );
  }
}

class SecondPage2 extends StatefulWidget {
  final String data;
  SecondPage2({required this.data});

  @override
  State<SecondPage2> createState() => _SecondPage2State();
}

class _SecondPage2State extends State<SecondPage2> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received: ${widget.data}'),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Enter message'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Send Back'),
              onPressed: () {
                Navigator.pop(context, _controller.text.trim());
              },
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MyAdvancedNavApp());
// }

class NavExample3 extends StatefulWidget {
  @override
  _NavExample3State createState() => _NavExample3State();
}

class _NavExample3State extends State<NavExample3> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text('Home Content')),
    Center(child: Text('Categories Content')),
    Center(child: Text('Profile Content')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('BottomNavigationBar Demo')),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Categories',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

class MyAdvancedNavApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Bottom Nav',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: AdvancedBottomNavScreen(),
    );
  }
}

class AdvancedBottomNavScreen extends StatefulWidget {
  @override
  _AdvancedBottomNavScreenState createState() =>
      _AdvancedBottomNavScreenState();
}

class _AdvancedBottomNavScreenState extends State<AdvancedBottomNavScreen> {
  int _selectedIndex = 0;

  // Keep the same instances so state is preserved
  final List<Widget> _pages = [CallsPage(), CameraPage(), ChatsPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(['Calls', 'Camera', 'Chats'][_selectedIndex]),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
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
}

class CallsPage extends StatefulWidget {
  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  List<String> callLogs = ['Mom', 'Dad', 'Best Friend'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callLogs.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text(callLogs[index]),
          subtitle: Text('Missed Call'),
          trailing: Icon(Icons.phone, color: Colors.teal),
        );
      },
    );
  }
}

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int photosTaken = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera_alt, size: 80, color: Colors.teal),
          SizedBox(height: 20),
          Text('Photos taken: $photosTaken', style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                photosTaken++;
              });
            },
            child: Text('Take Photo'),
          ),
        ],
      ),
    );
  }
}

class ChatsPage extends StatelessWidget {
  final List<String> chats = ['Flutter Devs Group', 'Project Team', 'John Doe'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text(chats[index]),
          subtitle: Text('Last message preview...'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailsPage(name: chats[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class ChatDetailsPage extends StatelessWidget {
  final String name;

  ChatDetailsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Text('Chat with $name', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(
        child: Text('This is the About Page', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class NavExample4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Drawer Demo', home: HomePage4());
  }
}

class HomePage4 extends StatelessWidget {
  void _navigate(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawer Example')),
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
          ],
        ),
      ),
      body: Center(child: Text('Main Content')),
    );
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

class NavExample5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Form Wizard', home: Step1Page());
  }
}

class Step1Page extends StatefulWidget {
  @override
  State<Step1Page> createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step 1: Basic Info')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Next'),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Step2Page(
                      name: nameController.text,
                      email: emailController.text,
                    ),
                  ),
                );
                setState(() {
                  data = result ?? {};
                });
              },
            ),

            const SizedBox(height: 20),
            Text('Received: $data'),
          ],
        ),
      ),
    );
  }
}

class Step2Page extends StatefulWidget {
  final String name;
  final String email;
  Step2Page({required this.name, required this.email});

  @override
  _Step2PageState createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  int? _selected = -1;
  final List<String> _preferences = ['Option A', 'Option B', 'Option C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step 2: Preferences')),
      body: Column(
        children: [
          ..._preferences.asMap().entries.map((entry) {
            return RadioListTile<int>(
              value: entry.key,
              groupValue: _selected,
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
              title: Text(entry.value),
            );
          }),
          ElevatedButton(
            child: Text('Next'),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Step3Page(
                    name: widget.name,
                    email: widget.email,
                    preference: _preferences[_selected ?? 0],
                  ),
                ),
              );
              Navigator.of(context).pop(result);
            },
          ),
        ],
      ),
    );
  }
}

class Step3Page extends StatelessWidget {
  final String name;
  final String email;
  final String preference;

  Step3Page({
    required this.name,
    required this.email,
    required this.preference,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step 3: Confirmation')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Preference: $preference'),
            ElevatedButton(
              child: Text('Finish'),
              onPressed: () {
                Navigator.of(
                  context,
                ).pop({'name': name, 'email': email, 'preference': preference});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NavExample6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Shop Navigation', home: CategoryGridPage());
  }
}

class CategoryGridPage extends StatelessWidget {
  final List<String> categories = ['Electronics', 'Clothes', 'Books'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductListPage(category: categories[index]),
                ),
              );
            },
            child: Card(
              color: Colors.blueAccent,
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final String category;
  ProductListPage({required this.category});
  final List<String> products = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$category Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String product;
  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product)),
      body: Center(child: Text('Details of $product')),
    );
  }
}
