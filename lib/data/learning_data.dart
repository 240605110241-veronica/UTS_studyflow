import 'package:flutter/material.dart';

class StudyTask {
  StudyTask({
    required this.id,
    required this.title,
    required this.course,
    required this.day,
    required this.time,
    required this.duration,
    required this.priority,
    required this.notes,
    required this.icon,
    required this.color,
    required this.tint,
    this.done = false,
  });

  final int id;
  final String title;
  final String course;
  final String day;
  final String time;
  final String duration;
  final String priority;
  final String notes;
  final IconData icon;
  final Color color;
  final Color tint;
  bool done;
}

final List<StudyTask> sampleTasks = [
  StudyTask(
    id: 1,
    title: 'Membaca materi Flutter',
    course: 'Pemrograman Mobile',
    day: 'Kamis',
    time: '09.00',
    duration: '45 menit',
    priority: 'Tinggi',
    notes:
    'Pelajari kembali widget layout dasar, StatelessWidget, dan StatefulWidget.',
    icon: Icons.phone_android,
    color: const Color(0xFF2D9C8B),
    tint: const Color(0xFFE2F3EF),
  ),
  StudyTask(
    id: 2,
    title: 'Latihan struktur data',
    course: 'Algoritma dan Struktur Data',
    day: 'Kamis',
    time: '13.30',
    duration: '60 menit',
    priority: 'Sedang',
    notes:
    'Kerjakan latihan mengenai stack dan queue. Tuliskan langkah penyelesaian sebelum melihat catatan.',
    icon: Icons.account_tree_outlined,
    color: const Color(0xFF6D65C7),
    tint: const Color(0xFFEEEDFA),
  ),
  StudyTask(
    id: 3,
    title: 'Meringkas basis data',
    course: 'Sistem Basis Data',
    day: 'Jumat',
    time: '10.00',
    duration: '40 menit',
    priority: 'Sedang',
    notes:
    'Buat ringkasan relasi antar tabel dan normalisasi dalam bentuk catatan satu halaman.',
    icon: Icons.storage_outlined,
    color: const Color(0xFFD28A31),
    tint: const Color(0xFFFFF1DD),
  ),
  StudyTask(
    id: 4,
    title: 'Review materi jaringan',
    course: 'Jaringan Komputer',
    day: 'Sabtu',
    time: '15.00',
    duration: '50 menit',
    priority: 'Rendah',
    notes:
    'Tinjau kembali model OSI dan buat catatan singkat untuk setiap lapisan.',
    icon: Icons.wifi,
    color: const Color(0xFF4185C5),
    tint: const Color(0xFFE5F1FC),
  ),
];