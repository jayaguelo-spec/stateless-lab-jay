import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

/// Immutable student record: every field is final, so it can be created with
/// const and never needs to change while the screen is built.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

const List<Student> students = [
  Student(
    name: 'Alice Santos',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'alice.santos@campus.edu',
  ),
  Student(
    name: 'Brian Cruz',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'brian.cruz@campus.edu',
  ),
  Student(
    name: 'Catherine Reyes',
    course: 'BS Electronics Engineering',
    yearLevel: 4,
    email: 'catherine.reyes@campus.edu',
  ),
  Student(
    name: 'Daniel Lim',
    course: 'BS Mathematics',
    yearLevel: 1,
    email: 'daniel.lim@campus.edu',
  ),
  Student(
    name: 'Elena Garcia',
    course: 'BS Information Systems',
    yearLevel: 3,
    email: 'elena.garcia@campus.edu',
  ),
  Student(
    name: 'Francis Mendoza',
    course: 'BS Computer Engineering',
    yearLevel: 2,
    email: 'francis.mendoza@campus.edu',
  ),
];

/// Stateless because the whole app is static: the theme and home never change.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Directory',
      home: const DirectoryScreen(),
    );
  }
}

/// Stateless because the student list never changes while the app is running.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Campus Directory'),
      ),
    );
  }
}
