// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoldersStruct extends FFFirebaseStruct {
  FoldersStruct({
    String? name,
    DocumentReference? albumRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _albumRef = albumRef,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "albumRef" field.
  DocumentReference? _albumRef;
  DocumentReference? get albumRef => _albumRef;
  set albumRef(DocumentReference? val) => _albumRef = val;
  bool hasAlbumRef() => _albumRef != null;

  static FoldersStruct fromMap(Map<String, dynamic> data) => FoldersStruct(
        name: data['name'] as String?,
        albumRef: data['albumRef'] as DocumentReference?,
      );

  static FoldersStruct? maybeFromMap(dynamic data) =>
      data is Map ? FoldersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'albumRef': _albumRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'albumRef': serializeParam(
          _albumRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static FoldersStruct fromSerializableMap(Map<String, dynamic> data) =>
      FoldersStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        albumRef: deserializeParam(
          data['albumRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['albums'],
        ),
      );

  static FoldersStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FoldersStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        albumRef: convertAlgoliaParam(
          data['albumRef'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FoldersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FoldersStruct &&
        name == other.name &&
        albumRef == other.albumRef;
  }

  @override
  int get hashCode => const ListEquality().hash([name, albumRef]);
}

FoldersStruct createFoldersStruct({
  String? name,
  DocumentReference? albumRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FoldersStruct(
      name: name,
      albumRef: albumRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FoldersStruct? updateFoldersStruct(
  FoldersStruct? folders, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    folders
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFoldersStructData(
  Map<String, dynamic> firestoreData,
  FoldersStruct? folders,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (folders == null) {
    return;
  }
  if (folders.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && folders.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final foldersData = getFoldersFirestoreData(folders, forFieldValue);
  final nestedData = foldersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = folders.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFoldersFirestoreData(
  FoldersStruct? folders, [
  bool forFieldValue = false,
]) {
  if (folders == null) {
    return {};
  }
  final firestoreData = mapToFirestore(folders.toMap());

  // Add any Firestore field values
  folders.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFoldersListFirestoreData(
  List<FoldersStruct>? folderss,
) =>
    folderss?.map((e) => getFoldersFirestoreData(e, true)).toList() ?? [];
