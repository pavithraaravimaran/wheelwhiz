import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LogoPage(),
      debugShowCheckedModeBanner: false, // Start with the logo page
    );
  }
}

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // After a delay, navigate to the LoginPage
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logowheel.jpg', // Path to your logo
          width: double.infinity, // Set width to cover the full screen
          height: double.infinity, // Set height to cover the full screen
          fit: BoxFit.cover, // Ensures the image covers the entire screen
        ),
      ),
    );
  }
}


//homepage
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove shadow
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white), // Sidebar icon color set to white
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
      ),
      extendBodyBehindAppBar: true, // Extend body behind AppBar
      drawer: Drawer(
        backgroundColor: Colors.black, // Set drawer background to black
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF304c82), // Set background color to #304c82
              ),
              child: Icon(
                Icons.account_circle,
                color: Colors.white, // Set profile icon color to white
                size: 80,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Clear any user session data here if needed
                // For example:
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // await prefs.clear(); // Clear stored user data

                // Navigate back to the login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()), // Replace with your login page
                );
              },
            ),

          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Background color set to black
          Positioned.fill(
            child: Container(
              color: Colors.black, // Set background to solid black
            ),
          ),
          // Foreground content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WheelchairPage()),
                    );
                  },
                  icon: const Icon(Icons.accessible, color: Colors.white),
                  label: const Text('Wheelchair', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF304c82), // Set button color to #304c82
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LavatoryPage()),
                    );
                  },
                  icon: const Icon(Icons.wc, color: Colors.white),
                  label: const Text('Lavatory', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF304c82), // Set button color to #304c82
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HelpPage()),
                    );
                  },
                  icon: const Icon(Icons.help, color: Colors.white),
                  label: const Text('Help', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF304c82), // Set button color to #304c82
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Profile Page
//import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedGender = 'Male'; // Default value for gender selection
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF304c82), // Updated background color
        iconTheme: const IconThemeData(color: Colors.white), // Set AppBar icon color to white
      ),
      body: Container(
        color: Colors.black, // Set background color to black
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Name Field
            TextField(
              controller: _nameController,
              cursorColor: const Color(0xFF304c82), // Set cursor color
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white), // Set label text color to white
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Outline border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set border color to white
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set focused border color to white
                ),
              ),
              style: const TextStyle(color: Colors.white), // Set input text color to white
            ),
            const SizedBox(height: 10),

            // Email Field
            TextField(
              controller: _emailController,
              cursorColor: const Color(0xFF304c82), // Set cursor color
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Outline border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set border color to white
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set focused border color to white
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),

            // Gender Selection (Dropdown Button)
            const Text('Gender', style: TextStyle(color: Colors.white)),
            DropdownButton<String>(
              value: _selectedGender,
              isExpanded: true,
              dropdownColor: Colors.black, // Set dropdown background to black
              items: <String>['Male', 'Female', 'Other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue!;
                });
              },
            ),
            const SizedBox(height: 10),

            // Contact Number Field
            TextField(
              controller: _contactController,
              keyboardType: TextInputType.phone,
              cursorColor: const Color(0xFF304c82), // Set cursor color
              decoration: const InputDecoration(
                labelText: 'Contact Number',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Outline border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set border color to white
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set focused border color to white
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),

            // Address Field
            TextField(
              controller: _addressController,
              cursorColor: const Color(0xFF304c82), // Set cursor color
              decoration: const InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Outline border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set border color to white
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set focused border color to white
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),

            // District Field
            TextField(
              controller: _stateController,
              cursorColor: const Color(0xFF304c82), // Set cursor color
              decoration: const InputDecoration(
                labelText: 'District',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Outline border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set border color to white
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set focused border color to white
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // State Field
            TextField(
              controller: _stateController,
              cursorColor: const Color(0xFF304c82), // Set cursor color
              decoration: const InputDecoration(
                labelText: 'State',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Outline border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set border color to white
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF304c82)), // Set focused border color to white
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Add save logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF304c82), // Set button color to blue
              ),
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

// Main Page with Navigation Options
class WheelchairPage extends StatelessWidget {
  const WheelchairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Colors.black),
          Column(
            children: <Widget>[
              AppBar(
                title: const Text('Wheelchair', style: TextStyle(color: Colors.white)),
                backgroundColor: const Color(0xFF304c82),
                elevation: 0,
                iconTheme: const IconThemeData(color: Colors.white),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.store, color: Colors.white),
                      title: const Text('Wheelchair Shops', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WheelchairShopPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.build, color: Colors.white),
                      title: const Text('Wheelchair Service Shops', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WheelchairMechanicShopPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Page with List of Wheelchair Shops
class WheelchairShopPage extends StatelessWidget {
  const WheelchairShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Colors.black),
          Column(
            children: <Widget>[
              AppBar(
                title: const Text('Wheelchair Shops', style: TextStyle(color: Colors.white)),
                backgroundColor: const Color(0xFF304c82),
                elevation: 0,
                leading: const Icon(Icons.shop, color: Colors.white),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: const Text('VAANI HEALTHCARE', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('New no 50, Vasantha Nagar, 1st St, Madurai, Tamil Nadu 625003', style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(
                              locationName: 'VAANI HEALTHCARE',
                              coordinates: LatLng(37.7749, -122.4194), // Example coordinates
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Friends Revolving Chair Repair Service in Madurai', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('TNHB Colony, Madurai, Tamil Nadu 625011', style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(
                              locationName: 'Friends Revolving Chair Repair Service in Madurai',
                              coordinates: LatLng(37.7749, -122.4194), // Example coordinates
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Onepoint Enterprises', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Shop 198, Naicker New St, Arajar Salai, Simmakkal, Madurai Main, Madurai, Tamil Nadu 625001', style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(
                              locationName: 'Onepoint Enterprises',
                              coordinates: LatLng(37.7749, -122.4194), // Example coordinates
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Page with List of Wheelchair Mechanic Shops
class WheelchairMechanicShopPage extends StatelessWidget {
  const WheelchairMechanicShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Colors.black),
          Column(
            children: <Widget>[
              AppBar(
                title: const Text('Wheelchair Mechanic Shops', style: TextStyle(color: Colors.white)),
                backgroundColor: const Color(0xFF304c82),
                elevation: 0,
                leading: const Icon(Icons.build, color: Colors.white),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: const Text('VAANI HEALTHCARE', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('New no 50, Vasantha Nagar, 1st St, Madurai, Tamil Nadu 625003', style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(
                              locationName: 'VAANI HEALTHCARE',
                              coordinates: LatLng(37.7749, -122.4194), // Example coordinates
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Onepoint Enterprises', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Shop 198, Naicker New St, Arajar Salai, Simmakkal, Madurai Main, Madurai, Tamil Nadu 625001', style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(
                              locationName: 'Onepoint Enterprises',
                              coordinates: LatLng(37.7749, -122.4194), // Example coordinates
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Friends Revolving Chair Repair Service in Madurai', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('TNHB Colony, Madurai, Tamil Nadu 625011', style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(
                              locationName: 'Friends Revolving Chair Repair Service in Madurai',
                              coordinates: LatLng(37.7749, -122.4194), // Example coordinates
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LavatoryPage extends StatelessWidget {
  const LavatoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
          ),
          Column(
            children: <Widget>[
              AppBar(
                title: const Text('Lavatory Locations', style: TextStyle(color: Colors.white)),
                backgroundColor: const Color(0xFF304c82), // Updated background color
                elevation: 0,
                leading: const Icon(Icons.location_on, color: Colors.white), // Set the icon color to white
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: const Text('SBM Toilet', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Avaniyapuram Junction, Thirupparankundram Rd, Thiruparankundram, Madurai, Tamil Nadu 625001', style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(
                              locationName: 'SBM Toilet',
                              coordinates: LatLng(28.6139, 77.2090), // Coordinates for a central location in India
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('SBM Toilet', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Periyaratha Street, Thiruparankundram, Madurai, Tamil Nadu 625001', style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(
                              locationName: 'SBM Toilet',
                              coordinates: LatLng(19.0760, 72.8777), // Coordinates for a downtown location in Mumbai
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Mall Lavatory', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Inside Mega Mall, 555-5566', style: TextStyle(color: Colors.white70)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MapPage(
                              locationName: 'Mall Lavatory',
                              coordinates: LatLng(12.9716, 77.5946), // Coordinates for Bangalore
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Help Page
class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Colors.black),
          Column(
            children: <Widget>[
              AppBar(
                title: const Text('Help', style: TextStyle(color: Colors.white)),
                backgroundColor: const Color(0xFF304c82),
                elevation: 0,
                leading: const Icon(Icons.help, color: Colors.white),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.local_hospital, color: Colors.white),
                      title: const Text('Hospitals', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HospitalPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.local_pharmacy, color: Colors.white),
                      title: const Text('Medical Shops', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MedicalShopPage()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.restaurant, color: Colors.white),
                      title: const Text('Restaurants', style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RestaurantPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Hospital Page
class HospitalPage extends StatelessWidget {
  const HospitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospitals', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF304c82),
        elevation: 0,
        leading: const Icon(Icons.local_hospital, color: Colors.white),
      ),
      body: Container(
        color: Colors.black, // Set background color to black
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Lakshmana multispeciality hospital', style: TextStyle(color: Colors.white)),
              subtitle: const Text('Tirupparankunram Rd, Madurai, Tamil Nadu 625004', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPage(
                      locationName: 'Lakshmana multispeciality hospital',
                      coordinates: LatLng(40.7128, -74.0060),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Vellammal Hospital', style: TextStyle(color: Colors.white)),
              subtitle: const Text('456 Broadway, 555-5678', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPage(
                      locationName: 'Vellammal Hospital',
                      coordinates: LatLng(40.730610, -73.935242),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Mediclinic', style: TextStyle(color: Colors.white)),
              subtitle: const Text('789 Elm St, 555-9876', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPage(
                      locationName: 'Mediclinic',
                      coordinates: LatLng(40.748817, -73.985428),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Medical Shops Page
class MedicalShopPage extends StatelessWidget {
  const MedicalShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Shops', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF304c82),
        elevation: 0,
        leading: const Icon(Icons.local_pharmacy, color: Colors.white),
      ),
      body: Container(
        color: Colors.black, // Set background color to black
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Srinivasa Medical Stores', style: TextStyle(color: Colors.white)),
              subtitle: const Text('39, W Car St, Thiruparankundram, Madurai, Thiruparankundram, Tamil Nadu 625005', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPage(
                      locationName: 'Srinivasa Medical Stores',
                      coordinates: LatLng(34.0522, -118.2437),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('MADURAI MEDICAL MART', style: TextStyle(color: Colors.white)),
              subtitle: const Text('Tirupparankunram Rd, Pasumalai, Madurai, Tamil Nadu 625004', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPage(
                      locationName: 'MADURAI MEDICAL MART',
                      coordinates: LatLng(34.0522, -118.2437),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Apollo Pharmacy Thenkasi 2', style: TextStyle(color: Colors.white)),
              subtitle: const Text('No 175, Tenkasi - Madurai Rd, opposite New Bus Stand, Pasumalai, Madurai, Tamil Nadu 627811', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPage(
                      locationName: 'Apollo Pharmacy Thenkasi 2',
                      coordinates: LatLng(34.0522, -118.2437),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Restaurant Page
class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF304c82),
        elevation: 0,
        leading: const Icon(Icons.restaurant, color: Colors.white),
      ),
      body: Container(
        color: Colors.black, // Set background color to black
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Amman Restaurant Thirunagar', style: TextStyle(color: Colors.white)),
              subtitle: const Text('2nd shop,Thiru Nagar,Madurai,Tamil Nadu 625006', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPage(
                      locationName: 'Amman Restaurant Thirunagar',
                      coordinates: LatLng(37.7749, -122.4194),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Annapoorna', style: TextStyle(color: Colors.white)),
              subtitle: const Text('2 GST road,Thirunagar,Madurai-South taluk,Tamil Nadu 625006', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPage(
                      locationName: 'Annapoorna',
                      coordinates: LatLng(37.7749, -122.4194),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Petchiamman Milk Depot Restaurant A/C', style: TextStyle(color: Colors.white)),
              subtitle: const Text('130, GST Main Road,Thirumurugan Colony, Thiru Nagar,Tamil Nadu 625006', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MapPage(
                      locationName: 'Petchiamman Milk Depot Restaurant A/C',
                      coordinates: LatLng(37.7749, -122.4194),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Map Page
class MapPage extends StatelessWidget {
  final String locationName;
  final LatLng coordinates;

  const MapPage({super.key, required this.locationName, required this.coordinates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locationName, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF304c82),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: coordinates,
          zoom: 15.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: coordinates,
                builder: (ctx) => const Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}