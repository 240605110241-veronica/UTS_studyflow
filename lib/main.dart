import 'package:flutter/material.dart';
import 'data/learning_data.dart';

void main() => runApp(const StudyFlowApp());

const navy = Color(0xFF172B4D);
const teal = Color(0xFF2D9C8B);
const paper = Color(0xFFF5F7FA);

class StudyFlowApp extends StatelessWidget {
  const StudyFlowApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'StudyFlow',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: paper,
      colorScheme: ColorScheme.fromSeed(seedColor: teal),
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          fontSize: 32,
          height: 1.1,
          letterSpacing: -0.7,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          height: 1.2,
          letterSpacing: -0.3,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          fontSize: 19,
          height: 1.25,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          height: 1.3,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(fontSize: 15, height: 1.5),
        bodyMedium: TextStyle(fontSize: 14, height: 1.45),
        bodySmall: TextStyle(fontSize: 12, height: 1.4),
        labelSmall: TextStyle(
          fontSize: 11,
          letterSpacing: 0.8,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    home: const MainPage(),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int tab = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: IndexedStack(
      index: tab,
      children: const [
        DashboardPage(),
        SchedulePage(),
      ],
    ),
    bottomNavigationBar: NavigationBar(
      selectedIndex: tab,
      onDestinationSelected: (value) => setState(() => tab = value),
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: 'Ringkasan',
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_month_outlined),
          selectedIcon: Icon(Icons.calendar_month),
          label: 'Jadwal',
        ),
      ],
    ),
  );
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pending = sampleTasks.where((task) => !task.done).length;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: teal,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.menu_book_rounded,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'StudyFlow',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: navy),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person_outline,
                          color: navy,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: navy,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FOKUS HARI INI',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                            color: const Color(0xFFB7C5D8),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Belajar satu sesi dulu.',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${sampleTasks.length} sesi terjadwal',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                            color: const Color(0xFFD8E1EC),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          icon: Icons.check_circle_outline,
                          number:
                          '${sampleTasks.length - pending}/${sampleTasks.length}',
                          caption: 'Tugas selesai',
                          tint: const Color(0xFFE1F3EF),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: _StatCard(
                          icon: Icons.timer_outlined,
                          number: '2 jam',
                          caption: 'Target fokus',
                          tint: Color(0xFFFFF0D8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Agenda berikutnya',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: navy),
                  ),
                  const SizedBox(height: 4),
                  ...sampleTasks
                      .take(2)
                      .map((task) => SessionCard(session: task)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.number,
    required this.caption,
    required this.tint,
  });

  final IconData icon;
  final String number;
  final String caption;
  final Color tint;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: tint,
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, size: 20, color: teal),
        ),
        const SizedBox(height: 12),
        Text(
          number,
          style: const TextStyle(
            color: navy,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
        Text(
          caption,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 5),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Jadwal belajar',
              style: TextStyle(
                color: navy,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Atur fokusmu, satu sesi dalam satu waktu.',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          sliver: SliverList.builder(
            itemCount: sampleTasks.length,
            itemBuilder: (context, index) {
              final task = sampleTasks[index];

              return SessionCard(
                session: task,
                onChanged: () {
                  setState(() => task.done = !task.done);
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}

class SessionCard extends StatelessWidget {
  const SessionCard({
    super.key,
    required this.session,
    this.onChanged,
  });

  final StudyTask session;
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) => Card(
    color: Colors.white,
    elevation: 0,
    margin: const EdgeInsets.only(bottom: 11),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TaskDetailPage(task: session),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 52,
              decoration: BoxDecoration(
                color: session.tint,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(session.icon, color: session.color),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    session.time,
                    style: const TextStyle(
                      color: teal,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    session.title,
                    style: TextStyle(
                      color: navy,
                      fontWeight: FontWeight.w800,
                      decoration: session.done
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  Text(
                    session.course,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            if (onChanged != null)
              Checkbox(
                value: session.done,
                activeColor: teal,
                onChanged: (_) => onChanged!(),
              )
            else
              const Icon(
                Icons.chevron_right,
                color: Colors.black38,
              ),
          ],
        ),
      ),
    ),
  );
}

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({
    super.key,
    required this.task,
  });

  final StudyTask task;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Detail sesi')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: task.tint,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Icon(
            task.icon,
            color: task.color,
            size: 68,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          task.course.toUpperCase(),
          style: const TextStyle(
            color: teal,
            fontSize: 11,
            letterSpacing: 1.3,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          task.title,
          style: const TextStyle(
            color: navy,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 14),
        _DetailRow(
          icon: Icons.schedule,
          title: 'Waktu',
          value: '${task.day}, ${task.time}',
        ),
        _DetailRow(
          icon: Icons.timer_outlined,
          title: 'Durasi',
          value: task.duration,
        ),
        _DetailRow(
          icon: Icons.flag_outlined,
          title: 'Prioritas',
          value: task.priority,
        ),
        const SizedBox(height: 18),
        const Text(
          'Catatan belajar',
          style: TextStyle(
            color: navy,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          task.notes,
          style: const TextStyle(
            color: Colors.black54,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () {
            task.done = !task.done;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  task.done
                      ? 'Sesi ditandai selesai.'
                      : 'Status sesi diperbarui.',
                ),
              ),
            );
          },
          icon: Icon(task.done ? Icons.undo : Icons.check),
          label: Text(
            task.done
                ? 'Tandai belum selesai'
                : 'Tandai selesai',
          ),
          style: FilledButton.styleFrom(
            backgroundColor: teal,
            padding: const EdgeInsets.all(15),
          ),
        ),
      ],
    ),
  );
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Icon(icon, size: 19, color: teal),
        const SizedBox(width: 10),
        SizedBox(
          width: 82,
          child: Text(
            title,
            style: const TextStyle(color: Colors.black54),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: navy,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    ),
  );
}