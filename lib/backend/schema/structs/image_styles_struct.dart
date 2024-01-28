// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageStylesStruct extends FFFirebaseStruct {
  ImageStylesStruct({
    String? styleName,
    String? image,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _styleName = styleName,
        _image = image,
        _description = description,
        super(firestoreUtilData);

  // "style_name" field.
  String? _styleName;
  String get styleName => _styleName ?? '';
  set styleName(String? val) => _styleName = val;
  bool hasStyleName() => _styleName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static ImageStylesStruct fromMap(Map<String, dynamic> data) =>
      ImageStylesStruct(
        styleName: data['style_name'] as String?,
        image: data['image'] as String?,
        description: data['description'] as String?,
      );

  static ImageStylesStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageStylesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'style_name': _styleName,
        'image': _image,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'style_name': serializeParam(
          _styleName,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageStylesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageStylesStruct(
        styleName: deserializeParam(
          data['style_name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  static ImageStylesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ImageStylesStruct(
        styleName: convertAlgoliaParam(
          data['style_name'],
          ParamType.String,
          false,
        ),
        image: convertAlgoliaParam(
          data['image'],
          ParamType.String,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ImageStylesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageStylesStruct &&
        styleName == other.styleName &&
        image == other.image &&
        description == other.description;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([styleName, image, description]);
}

ImageStylesStruct createImageStylesStruct({
  String? styleName,
  String? image,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageStylesStruct(
      styleName: styleName,
      image: image,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageStylesStruct? updateImageStylesStruct(
  ImageStylesStruct? imageStyles, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageStyles
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageStylesStructData(
  Map<String, dynamic> firestoreData,
  ImageStylesStruct? imageStyles,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageStyles == null) {
    return;
  }
  if (imageStyles.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageStyles.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageStylesData =
      getImageStylesFirestoreData(imageStyles, forFieldValue);
  final nestedData =
      imageStylesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageStyles.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageStylesFirestoreData(
  ImageStylesStruct? imageStyles, [
  bool forFieldValue = false,
]) {
  if (imageStyles == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageStyles.toMap());

  // Add any Firestore field values
  imageStyles.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageStylesListFirestoreData(
  List<ImageStylesStruct>? imageStyless,
) =>
    imageStyless?.map((e) => getImageStylesFirestoreData(e, true)).toList() ??
    [];
