import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminRecord extends FirestoreRecord {
  AdminRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image_styles" field.
  List<ImageStylesStruct>? _imageStyles;
  List<ImageStylesStruct> get imageStyles => _imageStyles ?? const [];
  bool hasImageStyles() => _imageStyles != null;

  // "legal_url" field.
  String? _legalUrl;
  String get legalUrl => _legalUrl ?? '';
  bool hasLegalUrl() => _legalUrl != null;

  void _initializeFields() {
    _imageStyles = getStructList(
      snapshotData['image_styles'],
      ImageStylesStruct.fromMap,
    );
    _legalUrl = snapshotData['legal_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin');

  static Stream<AdminRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminRecord.fromSnapshot(s));

  static Future<AdminRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminRecord.fromSnapshot(s));

  static AdminRecord fromSnapshot(DocumentSnapshot snapshot) => AdminRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminRecordData({
  String? legalUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'legal_url': legalUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminRecordDocumentEquality implements Equality<AdminRecord> {
  const AdminRecordDocumentEquality();

  @override
  bool equals(AdminRecord? e1, AdminRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.imageStyles, e2?.imageStyles) &&
        e1?.legalUrl == e2?.legalUrl;
  }

  @override
  int hash(AdminRecord? e) =>
      const ListEquality().hash([e?.imageStyles, e?.legalUrl]);

  @override
  bool isValidKey(Object? o) => o is AdminRecord;
}
