import 'package:flutter/material.dart';
import 'package:supabase_auth_app/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {

  // Supabase setup
  await Supabase.initialize(
    url: 'https://asiqunfpbxnetzumiifp.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFzaXF1bmZwYnhuZXR6dW1paWZwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg0NTQ3MjQsImV4cCI6MjA1NDAzMDcyNH0.G5dOxUKFR9s4sqdR5oO_2gm_LLVgHQcmZYMfRXmiEeo',
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
