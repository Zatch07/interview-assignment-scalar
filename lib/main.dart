import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:interview_bit_test/screens/home.dart';
import 'package:interview_bit_test/utils/interview.dart';
import 'package:interview_bit_test/utils/participant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(InterviewUtils.boxName);
  await Hive.openBox(ParticipantUtils.boxName);
  // await InterviewUtils.clear();
  // await ParticipantUtils.clear();
  await ParticipantUtils.initParticipants();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
