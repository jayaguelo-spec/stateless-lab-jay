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
      // CUSTOMIZATION 8: turn off the red DEBUG ribbon in the top-right corner.
      debugShowCheckedModeBanner: false,
      // CUSTOMIZATION 1: theme seed color is indigo instead of the default blue.
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        // CUSTOMIZATION 2: tinted scaffold background so the cards stand out.
        scaffoldBackgroundColor: const Color(0xFFF4F5FB),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      home: const DirectoryScreen(),
    );
  }
}

/// Stateless because the student list never changes while the app is running.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Campus Directory',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          const SectionHeader('Students'),
          const SizedBox(height: 12),
          for (final student in students) ...[
            StudentCard(student: student),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }
}

/// Stateless because it only renders the title it was given; the parent
/// rebuilds it with a new title if the heading ever needs to change.
class SectionHeader extends StatelessWidget {
  const SectionHeader(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                // CUSTOMIZATION 3: uppercase, letter-spaced heading in the
                // theme's primary color instead of plain black text.
                fontWeight: FontWeight.w800,
                letterSpacing: 1.4,
                color: colors.primary,
              ),
        ),
        const SizedBox(height: 4),
        // CUSTOMIZATION 4: thicker divider tinted with the primary color.
        Divider(
          thickness: 2,
          color: colors.primary.withValues(alpha: 0.35),
        ),
      ],
    );
  }
}

/// Stateless because it shows one fixed student record passed in by its parent.
class StudentCard extends StatelessWidget {
  const StudentCard({required this.student, super.key});

  final Student student;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Card(
      // CUSTOMIZATION 5: 16px rounded corners instead of the default small radius.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26,
              // CUSTOMIZATION 6: avatar uses the primaryContainer color and
              // shows the first letter of the student's name.
              backgroundColor: colors.primaryContainer,
              foregroundColor: colors.onPrimaryContainer,
              child: Text(
                student.name[0],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    // CUSTOMIZATION 7: name style is bold, larger and tightly
                    // letter-spaced so it reads as the card's headline.
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    student.course,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  InfoRow(
                    icon: Icons.school_outlined,
                    text: 'Year Level: ${student.yearLevel}',
                  ),
                  const SizedBox(height: 6),
                  InfoRow(icon: Icons.email_outlined, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Stateless because it draws one icon and one string supplied by its parent.
class InfoRow extends StatelessWidget {
  const InfoRow({required this.icon, required this.text, super.key});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
