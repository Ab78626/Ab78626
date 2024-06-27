import 'package:flutter/material.dart';
import 'package:project1/Model/RecipeModel.dart';
import 'package:project1/Model_View/CustomTabBar.dart';
import 'Screens/about_screen.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final _firstExampleFeature = _FeaturesTab();
  late TabController tabController;
  TabBarLocation _tabBarLocation = TabBarLocation.top;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {

    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('\nFind Best Recipe '),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            iconSize: 30.0,
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal:10),

              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search....',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.lightBlue,
                  ),

                  suffixIcon: Icon(
                    Icons.settings_input_component_outlined,
                    size: 30,
                    color: Colors.black45,

                  ),
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,

                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                CustomTabBar(
                  tabBarItems: _firstExampleFeature.tabBarItems,
                  tabViewItems: _firstExampleFeature.tabViewItems,
                  tabBarLocation: _tabBarLocation,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  tabBarItemHeight: MediaQuery.of(context).size.height * 0.06,
                  tabViewItemHeight: MediaQuery.of(context).size.height * 0.70,
                )
              ],
            )

          ],
        ),
      ),
    );
  }

}

class _FeaturesTab {
  final List<String> tabBarItems = [
    "Home",
    "About",
  ];

  final List<Widget> tabViewItems = [
    const AboutScreen(),
    const HomeScreen()
  ];
}
