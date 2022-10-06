import 'package:flutter/material.dart';
import 'package:helpful_components/helpful_components.dart';
import 'package:interview_bit_test/objects/interview/interview.dart';
import 'package:interview_bit_test/screens/update_interview.dart';
import 'package:interview_bit_test/utils/interview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Interview>> interviews;

  @override
  void initState() {
    interviews = InterviewUtils.all;
    super.initState();
  }

  MaterialPageRoute interviewPageRoute(String interviewId) {
    return MaterialPageRoute(
      builder: (context) => LoadingScreen<Interview?>(
        future: InterviewUtils.find(interviewId),
        func: (interview) => UpdateInterview(interview ?? Interview.empty()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Interviews'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                interviews = InterviewUtils.all;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Interview>>(
        future: interviews,
        builder: (context, snapshot) => CommonAsyncSnapshotResponses(
          snapshot,
          onData: (interviews) => ListView.builder(
            itemCount: interviews.length,
            itemBuilder: (BuildContext context, int i) => ListTile(
              title: Text(interviews[i].name),
              onTap: () {
                Navigator.push(context, interviewPageRoute(interviews[i].uuid));
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, interviewPageRoute(''));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
