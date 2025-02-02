import 'package:flutter/material.dart';
import 'package:supabase_auth_app/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {

  // Supabase setup
  await Supabase.initialize(
    url: 'Yout URL here',
    anonKey: 'Your API Key here',
    // debug: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthGate(),
    );
  }
}
