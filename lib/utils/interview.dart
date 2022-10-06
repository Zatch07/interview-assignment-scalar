import 'package:hive/hive.dart';
import 'package:interview_bit_test/extensions/iterable.dart';
import 'package:interview_bit_test/objects/interview/interview.dart';
import 'package:interview_bit_test/utils/json.dart';
import 'package:interview_bit_test/utils/participant.dart';

abstract class InterviewUtils {
  static const String boxName = 'interview_box';

  static Future<void> clear() async {
    final box = Hive.box(boxName);
    await box.clear();
  }

  static Future<List<Interview>> get all async {
    final box = Hive.box(boxName);
    return box.values
        .toJsons()
        .map((value) => Interview.fromJson(value))
        .toList();
  }

  static Future<Interview?> find(String interviewId) async {
    final box = Hive.box(boxName);
    final json = JsonUtils.tryCast(box.get(interviewId));
    if (json == null) return null;
    return Interview.fromJson(json);
  }

  static Future<List<Interview>> findAll(Iterable<String> ids) async {
    final res = <Interview>[];
    for (final id in ids) {
      final interview = await find(id);
      if (interview != null) res.add(interview);
    }
    return res;
  }

  static Future<void> _add(Interview interview) async {
    final box = Hive.box(boxName);
    box.put(interview.uuid, interview.toJson());
  }

  static Future<void> update(Interview interview) async {
    final prev = await find(interview.uuid);
    final prevParticipants = prev?.participants ?? {};

    final toRemove = prevParticipants.difference(interview.participants);
    final toAdd = interview.participants.difference(prevParticipants);

    final List<Future> futures = [];
    futures.addAll([
      ParticipantUtils.addInterviews(
          toAdd.map((element) => MapEntry(element, interview.uuid))),
      ParticipantUtils.removeInterviews(
          toRemove.map((element) => MapEntry(element, interview.uuid))),
      _add(interview)
    ]);

    await Future.wait(futures);
  }
}
