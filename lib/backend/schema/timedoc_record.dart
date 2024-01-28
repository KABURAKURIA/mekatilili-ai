import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TimedocRecord extends FirestoreRecord {
  TimedocRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('timedoc');

  static Stream<TimedocRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TimedocRecord.fromSnapshot(s));

  static Future<TimedocRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TimedocRecord.fromSnapshot(s));

  static TimedocRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TimedocRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TimedocRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TimedocRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TimedocRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TimedocRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTimedocRecordData({
  DocumentReference? userRef,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class TimedocRecordDocumentEquality implements Equality<TimedocRecord> {
  const TimedocRecordDocumentEquality();

  @override
  bool equals(TimedocRecord? e1, TimedocRecord? e2) {
    return e1?.userRef == e2?.userRef && e1?.time == e2?.time;
  }

  @override
  int hash(TimedocRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.time]);

  @override
  bool isValidKey(Object? o) => o is TimedocRecord;
}
