
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trend Board App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TrendBoardScreen(),
    );
  }
}

class TrendBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trend Board'),
        centerTitle: false,
        elevation: 1,
        backgroundColor: Colors.grey[100],
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      //This is for the App bar 'Trend Board' the center title should be false
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Category Buttons
              SingleChildScrollView(
                // The SingleChildScrollView has its default direction as vertical so dont forget to add horizontal for  the reel section
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    // The size of the small tabs are 8.0. and the big ones are 24.0
                    _buildCategoryButton('Fashion'),
                    SizedBox(width: 8.0),
                    _buildCategoryButton('Tech'),
                    SizedBox(width: 8.0),
                    _buildCategoryButton('Sports'),
                    SizedBox(width: 8.0),
                    _buildCategoryButton('Finance'),
                    SizedBox(width: 8.0),
                    _buildCategoryButton('select'),
                  ],
                ),
              ),
              SizedBox(height: 24.0),

              // Daily Challenge
              _buildSectionTitle('Daily Challenge'),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(child: Text('')), // Placeholder for Daily Challenge content
                height: 80.0,
              ),
              SizedBox(height: 24.0),

              // Reel Section
              _buildSectionTitle('Reel Section'),
              SizedBox(height: 8.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    _buildReelPlaceholder(),
                    SizedBox(width: 8.0),
                    _buildReelPlaceholder(),
                  ],
                ),
              ),
              SizedBox(height: 24.0),

              // Quick Shortcut Icons
              _buildSectionTitle('Quick Shortcut Icons'),
              SizedBox(height: 12.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildShortcutIcon(Icons.wallet, 'Wallet'),
                  _buildShortcutIcon(Icons.show_chart, 'Stocks'),
                  _buildShortcutIcon(Icons.local_offer, 'Promos'),
                  _buildShortcutIcon(Icons.star, 'Rewards'),
                ],
              ),
              SizedBox(height: 24.0),

              // Stipend/Pay
              _buildSectionTitle('Stipend/Pay'),
              SizedBox(height: 8.0),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(child: Text('')), // Placeholder for Stipend/Pay content
                height: 60.0,
              ),
              SizedBox(height: 32.0),

              // Bottom Navigation
              _buildBottomNavigation(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  Widget _buildCategoryButton(String text) {
    return ElevatedButton(
      onPressed: () {
        // TODO: Implement category selection logic
        print('Category selected: $text');
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        elevation: 0,
      ),
      child: Text(text),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildReelPlaceholder() {
    return Container(
      width: 120.0,
      height: 160.0,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(child: Icon(Icons.movie_outlined, size: 40.0, color: Colors.grey[400])),
    );
  }

  Widget _buildShortcutIcon(IconData icon, String label) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(icon, size: 30.0, color: Colors.black87),
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildBottomNavItem(Icons.home_outlined, 'Home'),
          _buildBottomNavItem(Icons.explore_outlined, 'Explore'),
          _buildBottomNavItem(Icons.wallet_outlined, 'Wallet'),
          _buildBottomNavItem(Icons.person_outline, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 24.0, color: Colors.grey[600]),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
