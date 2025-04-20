import 'package:flutter/material.dart';

void main() => runApp(DashboardApp());

class DashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatelessWidget {
  final List<DashboardCardData> cards = [
    DashboardCardData(
      title: 'Users',
      value: '1,200',
      icon: Icons.people,
      color: Colors.blue,
      details: '1200 users are currently active.',
    ),
    DashboardCardData(
      title: 'Messages',
      value: '350',
      icon: Icons.message,
      color: Colors.green,
      details: 'You have 350 new messages.',
    ),
    DashboardCardData(
      title: 'Notifications',
      value: '27',
      icon: Icons.notifications,
      color: Colors.orange,
      details: '27 new notifications received.',
    ),
    DashboardCardData(
      title: 'Revenue',
      value: '\$12.4K',
      icon: Icons.attach_money,
      color: Colors.purple,
      details: 'Revenue this month is \$12,400.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = (screenWidth ~/ 200).clamp(1, 4); // Responsive

    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: cards.map((card) => DashboardCard(cardData: card)).toList(),
        ),
      ),
    );
  }
}

class DashboardCardData {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String details;

  DashboardCardData({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.details,
  });
}

class DashboardCard extends StatelessWidget {
  final DashboardCardData cardData;

  DashboardCard({required this.cardData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDetails(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: cardData.color.withOpacity(0.2),
                child: Icon(cardData.icon, color: cardData.color),
              ),
              SizedBox(height: 10),
              Text(
                cardData.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                cardData.value,
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(cardData.title),
            content: Text(cardData.details),
            actions: [
              TextButton(
                child: Text('Close'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
    );
  }
}
