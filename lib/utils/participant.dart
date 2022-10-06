import 'package:hive/hive.dart';
import 'package:interview_bit_test/extensions/iterable.dart';
import 'package:interview_bit_test/objects/participant/participant.dart';
import 'package:interview_bit_test/utils/json.dart';

abstract class ParticipantUtils {
  static const String boxName = 'participant_box';

  static Future<void> clear() async {
    final box = Hive.box(boxName);
    await box.clear();
  }

  static Future<List<Participant>> get all async {
    final box = Hive.box(boxName);
    return box.values
        .toJsons()
        .map((value) => Participant.fromJson(value))
        .toList();
  }

  static Future<void> initParticipants() async {
    final allParticipants = await all;
    if (allParticipants.length >= 3) return;
    await addParticipants([
      Participant('Yash', 'yash@gmail.com', 'yash'),
      Participant('Vishnu', 'vishnu@gmail.com', 'vishnu'),
      Participant('Dev', 'dev@gmail.com', 'dev'),
      Participant('Amit', 'amit@gmail.com', 'amit'),
    ]);
  }

  static Future<Participant?> find(String id) async {
    final box = Hive.box(boxName);
    final json = JsonUtils.tryCast(box.get(id));
    if (json == null) return null;
    return Participant.fromJson(json);
  }

  static Future<void> addParticipants(
      Iterable<Participant> participants) async {
    final box = Hive.box(boxName);
    box.putAll({
      for (final participant in participants)
        participant.uuid: participant.toJson(),
    });
  }

  ///In [idsIterable], Each [MapEntry] consists of [Participant]'s id,
  ///[MapEntry], where this consists of [Interview]'s id and whether to "add" or
  ///"remove" this interview. If it is true, than it will be added.
  static Future<void> updateInterviews(
      Iterable<MapEntry<String, MapEntry<String, bool>>> idsIterable) async {
    final List<Future<Participant?>> updated = [];
    for (final ids in idsIterable) {
      updated.add(find(ids.key).then((participant) {
        if (participant == null) return null;

        final interviews = Set<String>.from(participant.interviews);
        if (ids.value.value) {
          interviews.add(ids.value.key);
        } else {
          interviews.remove(ids.value.key);
        }

        participant = participant.copyWith(
          interviews: interviews,
        );

        return participant;
      }));
    }
    final participants = [
      for (final participant in (await Future.wait(updated)))
        if (participant != null) participant,
    ];

    return addParticipants(participants);
  }

  ///In [idsIterable], Each [MapEntry] consists of [Participant]'s id and [Interview]'s id.
  static Future<void> addInterviews(
      Iterable<MapEntry<String, String>> idsIterable) async {
    return updateInterviews(idsIterable.map(
        (element) => MapEntry(element.key, MapEntry(element.value, true))));
  }

  ///In [idsIterable], Each [MapEntry] consists of [Participant]'s id and [Interview]'s id.
  static Future<void> removeInterviews(
      Iterable<MapEntry<String, String>> idsIterable) async {
    return updateInterviews(idsIterable.map(
        (element) => MapEntry(element.key, MapEntry(element.value, false))));
  }
}
