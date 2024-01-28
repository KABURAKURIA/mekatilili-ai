// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TempImageDocumentStruct extends FFFirebaseStruct {
  TempImageDocumentStruct({
    String? userPrompt,
    DateTime? createdTime,
    String? tempUrl,
    String? aIPrompt,
    String? style,
    String? size,
    String? blurHash,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userPrompt = userPrompt,
        _createdTime = createdTime,
        _tempUrl = tempUrl,
        _aIPrompt = aIPrompt,
        _style = style,
        _size = size,
        _blurHash = blurHash,
        super(firestoreUtilData);

  // "user_prompt" field.
  String? _userPrompt;
  String get userPrompt => _userPrompt ?? '';
  set userPrompt(String? val) => _userPrompt = val;
  bool hasUserPrompt() => _userPrompt != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "temp_url" field.
  String? _tempUrl;
  String get tempUrl => _tempUrl ?? '';
  set tempUrl(String? val) => _tempUrl = val;
  bool hasTempUrl() => _tempUrl != null;

  // "AI_prompt" field.
  String? _aIPrompt;
  String get aIPrompt => _aIPrompt ?? '';
  set aIPrompt(String? val) => _aIPrompt = val;
  bool hasAIPrompt() => _aIPrompt != null;

  // "style" field.
  String? _style;
  String get style => _style ?? '';
  set style(String? val) => _style = val;
  bool hasStyle() => _style != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;
  bool hasSize() => _size != null;

  // "blur_hash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  set blurHash(String? val) => _blurHash = val;
  bool hasBlurHash() => _blurHash != null;

  static TempImageDocumentStruct fromMap(Map<String, dynamic> data) =>
      TempImageDocumentStruct(
        userPrompt: data['user_prompt'] as String?,
        createdTime: data['created_time'] as DateTime?,
        tempUrl: data['temp_url'] as String?,
        aIPrompt: data['AI_prompt'] as String?,
        style: data['style'] as String?,
        size: data['size'] as String?,
        blurHash: data['blur_hash'] as String?,
      );

  static TempImageDocumentStruct? maybeFromMap(dynamic data) => data is Map
      ? TempImageDocumentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_prompt': _userPrompt,
        'created_time': _createdTime,
        'temp_url': _tempUrl,
        'AI_prompt': _aIPrompt,
        'style': _style,
        'size': _size,
        'blur_hash': _blurHash,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_prompt': serializeParam(
          _userPrompt,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'temp_url': serializeParam(
          _tempUrl,
          ParamType.String,
        ),
        'AI_prompt': serializeParam(
          _aIPrompt,
          ParamType.String,
        ),
        'style': serializeParam(
          _style,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.String,
        ),
        'blur_hash': serializeParam(
          _blurHash,
          ParamType.String,
        ),
      }.withoutNulls;

  static TempImageDocumentStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TempImageDocumentStruct(
        userPrompt: deserializeParam(
          data['user_prompt'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        tempUrl: deserializeParam(
          data['temp_url'],
          ParamType.String,
          false,
        ),
        aIPrompt: deserializeParam(
          data['AI_prompt'],
          ParamType.String,
          false,
        ),
        style: deserializeParam(
          data['style'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.String,
          false,
        ),
        blurHash: deserializeParam(
          data['blur_hash'],
          ParamType.String,
          false,
        ),
      );

  static TempImageDocumentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TempImageDocumentStruct(
        userPrompt: convertAlgoliaParam(
          data['user_prompt'],
          ParamType.String,
          false,
        ),
        createdTime: convertAlgoliaParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        tempUrl: convertAlgoliaParam(
          data['temp_url'],
          ParamType.String,
          false,
        ),
        aIPrompt: convertAlgoliaParam(
          data['AI_prompt'],
          ParamType.String,
          false,
        ),
        style: convertAlgoliaParam(
          data['style'],
          ParamType.String,
          false,
        ),
        size: convertAlgoliaParam(
          data['size'],
          ParamType.String,
          false,
        ),
        blurHash: convertAlgoliaParam(
          data['blur_hash'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TempImageDocumentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TempImageDocumentStruct &&
        userPrompt == other.userPrompt &&
        createdTime == other.createdTime &&
        tempUrl == other.tempUrl &&
        aIPrompt == other.aIPrompt &&
        style == other.style &&
        size == other.size &&
        blurHash == other.blurHash;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [userPrompt, createdTime, tempUrl, aIPrompt, style, size, blurHash]);
}

TempImageDocumentStruct createTempImageDocumentStruct({
  String? userPrompt,
  DateTime? createdTime,
  String? tempUrl,
  String? aIPrompt,
  String? style,
  String? size,
  String? blurHash,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TempImageDocumentStruct(
      userPrompt: userPrompt,
      createdTime: createdTime,
      tempUrl: tempUrl,
      aIPrompt: aIPrompt,
      style: style,
      size: size,
      blurHash: blurHash,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TempImageDocumentStruct? updateTempImageDocumentStruct(
  TempImageDocumentStruct? tempImageDocument, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tempImageDocument
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTempImageDocumentStructData(
  Map<String, dynamic> firestoreData,
  TempImageDocumentStruct? tempImageDocument,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tempImageDocument == null) {
    return;
  }
  if (tempImageDocument.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tempImageDocument.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tempImageDocumentData =
      getTempImageDocumentFirestoreData(tempImageDocument, forFieldValue);
  final nestedData =
      tempImageDocumentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tempImageDocument.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTempImageDocumentFirestoreData(
  TempImageDocumentStruct? tempImageDocument, [
  bool forFieldValue = false,
]) {
  if (tempImageDocument == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tempImageDocument.toMap());

  // Add any Firestore field values
  tempImageDocument.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTempImageDocumentListFirestoreData(
  List<TempImageDocumentStruct>? tempImageDocuments,
) =>
    tempImageDocuments
        ?.map((e) => getTempImageDocumentFirestoreData(e, true))
        .toList() ??
    [];
