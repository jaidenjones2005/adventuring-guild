
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'party_model.dart';
import 'guild_hall_roster.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PartyModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adventuring Guild',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const GuildHomePage(),
    );
  }
}

class GuildHomePage extends StatelessWidget {
  const GuildHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adventuring Guild'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Guild Hall Roster',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GuildHallRoster(),
          ),
          SizedBox(
            height: 120,
            child: Center(
              child: Text(
                'Quest Party Summary Coming Soon!',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
