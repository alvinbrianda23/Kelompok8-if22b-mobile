import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFFFF9A8B)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 50, color: Color(0xFFFF9A8B)),
              ),
              accountName: Text(
                'Hey Emily',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('Admin'),
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Color(0xFFFF9A8B)),
              title: Text('pembayaran'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout, color: Color(0xFFFF9A8B)),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pinkAccent.shade100, Colors.yellowAccent.shade100],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Hey Emily,',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Silahkan pilih Pakaianmu',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildClothingOption('Kemeja Panjang'),
                    _buildClothingOption('Kemeja Pendek'),
                    _buildClothingOption('T-shirt Panjang'),
                    _buildClothingOption('T-shirt Pendek'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClothingOption(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
