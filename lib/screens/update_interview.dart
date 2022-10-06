import 'package:flutter/material.dart';
import 'package:helpful_components/helpful_components.dart';
import 'package:interview_bit_test/extensions/date_time.dart';
import 'package:interview_bit_test/extensions/time_of_day.dart';
import 'package:interview_bit_test/objects/interview/interview.dart';
import 'package:interview_bit_test/objects/participant/participant.dart';
import 'package:interview_bit_test/utils/interview.dart';
import 'package:interview_bit_test/utils/participant.dart';
import 'package:intl/intl.dart';

class UpdateInterview extends StatefulWidget {
  const UpdateInterview(this.interview, {Key? key}) : super(key: key);

  final Interview interview;

  @override
  State<UpdateInterview> createState() => _UpdateInterviewState();
}

class _UpdateInterviewState extends State<UpdateInterview> {
  late Interview interview;
  static final dateFormat = DateFormat('dd-MM-yyyy'),
      timeFormat = DateFormat.jm();
  final formKey = GlobalKey<FormState>(), membersKey = GlobalKey();
  final startDate = TextEditingController(),
      startTime = TextEditingController(),
      endDate = TextEditingController(),
      endTime = TextEditingController(),
      memController = TextEditingController(),
      name = TextEditingController();
  final allParticipants = ParticipantUtils.all;
  Map<String, Participant> allUsers = {};
  Set<String> members = {};
  late final Popup popup;

  void pickTime(TextEditingController controller) async {
    final initialTime =
        TimeOfDay.fromDateTime(timeFormat.parseLoose(controller.text));
    final time =
        (await showTimePicker(context: context, initialTime: initialTime)) ??
            TimeOfDay.now();
    controller.text = timeFormat.format(time.toDateTime());
  }

  void pickDate(TextEditingController controller) async {
    final date = (await showDatePicker(
          context: context,
          initialDate: interview.start,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 100)),
        )) ??
        DateTime.now();
    controller.text = dateFormat.format(date);
  }

  DateTime parseDateAndTime(String date, String text) =>
      dateFormat.parseLoose(date).mergeTime(timeFormat.parseLoose(text));

  DateTime get start => parseDateAndTime(startDate.text, startTime.text);

  DateTime get end => parseDateAndTime(endDate.text, endTime.text);

  String? validateDateTime(String? text, DateTime first, DateTime second,
      [String secondName = 'second']) {
    if (text?.isEmpty ?? true) return "Cannot be empty.";
    if (first.isBefore(second)) {
      return 'Cannot be before, $secondName';
    }
    return null;
  }

  String get membersText => '${members.length} Selected';

  @override
  void initState() {
    interview = widget.interview;
    name.text = interview.name;
    startDate.text = dateFormat.format(interview.start);
    startTime.text = timeFormat.format(interview.start);
    endDate.text = dateFormat.format(interview.end);
    endTime.text = timeFormat.format(interview.end);
    members.addAll(interview.participants);
    memController.text = membersText;
    popup = _popup;
    allParticipants.then((users) {
      for (final user in users) {
        allUsers[user.uuid] = user;
      }
    });
    super.initState();
  }

  Popup get _popup => Popup(
        parentKey: membersKey,
        child: Container(
          color: Colors.white10,
          child: FutureBuilder<List<Participant>>(
              future: allParticipants,
              builder: (context, snapshot) => CommonAsyncSnapshotResponses(
                    snapshot,
                    onData: (users) => ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 500),
                      child: ListView(
                        shrinkWrap: true,
                        children: users.map(
                          (participant) {
                            final id = participant.uuid;
                            return StatefulBuilder(
                                builder: (context, setLocalState) =>
                                    CheckboxListTile(
                                      value: members.contains(id),
                                      onChanged: (value) {
                                        setLocalState(() {
                                          if (value ?? false) {
                                            members.add(id);
                                          } else {
                                            members.remove(id);
                                          }
                                        });
                                        memController.text = membersText;
                                      },
                                      title: Text(participant.name),
                                    ));
                          },
                        ).toList(),
                      ),
                    ),
                  )),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                validator: (text) {
                  if (text?.isEmpty ?? true) return 'Cannot be Empty';
                  return null;
                },
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: startTime,
                      onTap: () => pickTime(startTime),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Start',
                      ),
                      readOnly: true,
                      validator: (_) =>
                          validateDateTime(_, start, DateTime.now(), 'now'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      onTap: () => pickDate(startDate),
                      controller: startDate,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                      validator: (_) =>
                          validateDateTime(_, start, DateTime.now(), 'now'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: endTime,
                      onTap: () => pickTime(endTime),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'End',
                      ),
                      readOnly: true,
                      validator: (_) =>
                          validateDateTime(_, end, start, 'start'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      onTap: () => pickDate(endDate),
                      controller: endDate,
                      readOnly: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                      validator: (_) =>
                          validateDateTime(_, end, start, 'start'),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                key: membersKey,
                controller: memController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Select Members'),
                readOnly: true,
                onTap: () {
                  showPopup(
                    context: context,
                    builder: (_) => popup,
                  );
                },
                validator: (text) {
                  if (members.length < 2) {
                    return 'At least 2 members should be selected';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!(formKey.currentState?.validate() ?? false)) return;

          //Since both [this.start] and [this.end] are get function, storing
          //them in the local variable.
          final start = this.start;
          final end = this.end;

          Set<String> interviewIds = {};
          for (final member in members) {
            final user = allUsers[member];
            if (user == null) continue;
            interviewIds.addAll(user.interviews);
          }

          final interviews = {
            for (final interview
                in (await InterviewUtils.findAll(interviewIds)))
              interview.uuid: interview,
          };
          for (final member in members) {
            final user = allUsers[member];
            if (user == null) continue;

            if (!(await user.isFreeInRange(
                start, end, interview.uuid, interviews))) {
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${user.name} is not available at this time.'),
                ),
              );
              return;
            }
          }

          await InterviewUtils.update(interview.copyWith(
            name: name.text,
            start: start,
            end: end,
            participants: members,
          ));

          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Successfully Submitted')),
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
