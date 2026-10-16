import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFF13A89E),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(Icons.school_rounded,
                            color: Colors.white, size: 28),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'CampusHub',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF16324F),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/login'),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDDF7F3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'STUDENT PORTAL • STARTER PROJECT',
                      style: TextStyle(
                        color: Color(0xFF087F78),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Your campus,\none simple hub.',
                    style: TextStyle(
                      fontSize: 48,
                      height: 1.08,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF16324F),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const SizedBox(
                    width: 580,
                    child: Text(
                      'A simple starting point for student services. This prototype demonstrates a Flutter Web home page, reusable UI components, and navigation to a login form.',
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.6,
                        color: Color(0xFF5B6878),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppButton(
                    label: 'Continue to Login',
                    icon: Icons.arrow_forward_rounded,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/login'),
                  ),
                  const SizedBox(height: 46),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: const [
                      _FeatureCard(
                        icon: Icons.dashboard_customize_rounded,
                        title: 'Simple dashboard',
                        description: 'A clean starting screen for students.',
                      ),
                      _FeatureCard(
                        icon: Icons.lock_outline_rounded,
                        title: 'Login UI',
                        description: 'A basic form with input validation.',
                      ),
                      _FeatureCard(
                        icon: Icons.cloud_outlined,
                        title: 'Ready to extend',
                        description: 'API and database can be added later.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Activity 8 baseline • Backend not connected',
                    style: TextStyle(color: Color(0xFF7A8795), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE7ECF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: const Color(0xFF13A89E)),
          const SizedBox(height: 16),
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF16324F))),
          const SizedBox(height: 8),
          Text(description,
              style: const TextStyle(
                  height: 1.45, color: Color(0xFF657386))),
        ],
      ),
    );
  }
}
