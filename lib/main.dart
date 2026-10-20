import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: const Color(0xFFF3EFFF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
      home: const HeroDashboard(),
    ),
  );
}

class HeroDashboard extends StatelessWidget {
  const HeroDashboard({super.key});

  Widget heroCard(BuildContext context, String name, String role) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shield,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              role,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Dashboard')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // LIVE CODING: Change 600 to 900 during your recording.
          const double breakpoint = 600;

          bool wideScreen = constraints.maxWidth >= breakpoint;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Choose Your Heroes',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Width: ${constraints.maxWidth.toInt()} | '
                    'Breakpoint: ${breakpoint.toInt()}',
                  ),
                  Text(
                    wideScreen ? 'Wide layout' : 'Narrow layout',
                  ),
                  const SizedBox(height: 20),
                  if (wideScreen)
                    Row(
                      children: [
                        Expanded(
                          child: heroCard(context, 'Gojo', 'Mage'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: heroCard(context, 'Yuji', 'Fighter'),
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        heroCard(context, 'Gojo', 'Mage'),
                        const SizedBox(height: 16),
                        heroCard(context, 'Yuji', 'Fighter'),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
