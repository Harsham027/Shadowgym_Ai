import 'package:flutter/material.dart';

void main() {
  runApp(ShadowGymAIApp());
}

class ShadowGymAIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShadowGym AI',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int xp = 3450;
  int level = 12;
  String workoutFocus = "Strength & Mobility";
  String deviceSyncStatus = "Synced";

  int _selectedIndex = 1;

  static List<Widget> _pages = <Widget>[
    ProfileScreen(),
    WorkoutScreen(),
    LiveSessionScreen(),
    ARBossScreen(),
    AchievementsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Workouts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_fill),
          label: 'Live',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.videogame_asset),
          label: 'AR Boss',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.verified_outlined),
          label: 'Achievements',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShadowGym AI'),
        centerTitle: true,
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 120, color: Colors.deepPurpleAccent),
          SizedBox(height: 20),
          Text(
            'User Profile',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Manage your personal details,\nfitness goals, and device connections.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            icon: Icon(Icons.edit),
            label: Text('Edit Profile'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Edit Profile clicked')),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurpleAccent,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
     ),
    );
  }
}

class WorkoutScreen extends StatelessWidget {
  final List<String> focuses = [
    "Strength",
    "Mobility",
    "Flexibility",
    "Weight Loss",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Today's Workout Focus",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 12,
            children: focuses
                .map((focus) => Chip(
                      label: Text(focus),
                      backgroundColor: Colors.deepPurple.withOpacity(0.7),
                      labelStyle: TextStyle(color: Colors.white),
                    ))
                .toList(),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            icon: Icon(Icons.play_arrow),
            label: Text("Start Workout"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Starting workout...")),
              );
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                textStyle: TextStyle(fontSize: 20),
                primary: Colors.deepPurpleAccent),
          ),
          SizedBox(height: 12),
          OutlinedButton.icon(
            icon: Icon(Icons.tune),
            label: Text("Adjust Intensity"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Adjusting workout intensity...")),
              );
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 14),
              textStyle: TextStyle(fontSize: 18),
              primary: Colors.deepPurpleAccent,
              side: BorderSide(color: Colors.deepPurpleAccent, width: 2),
            ),
          )
        ],
      ),
    );
  }
}

class LiveSessionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.camera, size: 100, color: Colors.deepPurpleAccent),
          SizedBox(height: 20),
          Text(
            'Live Session',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Real-time rep counting and form correction using your phone camera.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            icon: Icon(Icons.videocam),
            label: Text('Start Live Session'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Live session started')),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurpleAccent,
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
     ),
    );
  }
}

class ARBossScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.videogame_asset, size: 100, color: Colors.deepPurpleAccent),
          SizedBox(height: 20),
          Text(
            'AR Boss Fight',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            'Engage with interactive AR boss fights to test your skills.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            icon: Icon(Icons.play_arrow),
            label: Text('Enter Arena'),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Entering AR arena...')),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurpleAccent,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              textStyle: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
     ),
    );
  }
}

class AchievementsScreen extends StatelessWidget {
  final List<String> badges = [
    "Rookie Lifter",
    "Flexibility Master",
    "Mobility Champ",
    "Fat Burner",
    "Dungeon Conqueror",
    "Boss Vanquisher",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Achievements",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: badges.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    badges[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
