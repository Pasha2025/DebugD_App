import 'package:debugd/LoginScreen.dart';
import 'package:debugd/RegistrationScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DebugD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavBarExample(),
    );
  }
}

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarExampleState createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int _currentIndex = 0; // To track the selected tab

  final List<Widget> _pages = [
    HomeScreen(),
    ServicesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Show selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red, // Active icon color
        unselectedItemColor: Colors.black, // Inactive icon color
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update selected index
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

// ✅ Home Page with Swiping Images & Drawer
class HomeScreen extends StatelessWidget {
  final List<String> images = [
    'assets/images/Main-Canvas.png',
    'assets/images/interview1.jpg',
    'assets/images/pexels-photo-1181396.jpeg',
    'assets/images/4-Interviews.jpg',
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/main-logo.png'),
          ),
        ),
        title: Text("DebugD"),
        backgroundColor: Colors.grey,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('About'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Services'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Swiping Image Carousel
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  images[index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Welcome to DebugD!",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "At Debugd, we are passionate about delivering tailored solutions that drive measurable results. With a focus on innovation, reliability, and excellence, our team works relentlessly to bring your ideas to life. Whether you’re a startup looking to make your mark or an enterprise ready to scale, we’re here to help you every step of the way.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centers the buttons horizontally
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.login),
                label: Text("Login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 235, 59, 1),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
              SizedBox(width: 20), // Adds space between the buttons
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegistrationScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.app_registration),
                label: Text("Registration"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 235, 59, 1),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ✅ Services Page
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var center = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Services Page", style: TextStyle(fontSize: 24)),
          OutlinedButton(onPressed: () {}, child: Text("Web Development")),
          OutlinedButton(onPressed: () {}, child: Text("Consulting")),
          OutlinedButton(onPressed: () {}, child: Text("Freelance")),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Our Services")),
      body: center,
    );
  }
}

// ✅ Profile Page
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Text("Profile Page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
