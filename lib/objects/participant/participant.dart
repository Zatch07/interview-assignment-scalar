import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interview_bit_test/objects/interview/interview.dart';
import 'package:interview_bit_test/utils/interview.dart';
import 'package:uuid/uuid.dart';

part 'participant.freezed.dart';

part 'participant.g.dart';

@freezed
class Participant with _$Participant {
  const Participant._();

  factory Participant(String name, String email, [String? uuid]) =>
      Participant.raw(
        uuid: uuid ?? const Uuid().v1(),
        name: name,
        email: email,
      );

  const factory Participant.raw({
    required String uuid,
    required String name,
    required String email,
    String? resumeLink,
    @Default({}) Set<String> interviews,
  }) = _Participant;

  factory Participant.fromJson(Map<String, Object?> json) =>
      _$ParticipantFromJson(json);

  ///Here [interviewId] is the id of the interview, which is being added or
  ///updated, basically, so that, this will ignore this [interviewId] while
  ///checking.
  Future<bool> isFreeInRange(DateTime start, DateTime end, String interviewId,
      [Map<String, Interview> cache = const {}]) async {
    Map<String, Interview> interviews = {};
    final List<String> toFetch = [];
    for (final id in this.interviews) {
      if (cache.containsKey(id)) {
        interviews[id] = cache[id]!;
      } else {
        toFetch.add(id);
      }
    }
    for (final interview in (await InterviewUtils.findAll(toFetch))) {
      interviews[interview.uuid] = interview;
    }

    for (final interview in interviews.values) {
      if (interview.uuid == interviewId) continue;
      if (interview.isClash(start, end)) return false;
    }
    return true;
  }
}
