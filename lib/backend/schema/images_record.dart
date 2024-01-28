import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesRecord extends FirestoreRecord {
  ImagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "temp_url" field.
  String? _tempUrl;
  String get tempUrl => _tempUrl ?? '';
  bool hasTempUrl() => _tempUrl != null;

  // "public_url" field.
  String? _publicUrl;
  String get publicUrl => _publicUrl ?? '';
  bool hasPublicUrl() => _publicUrl != null;

  // "user_prompt" field.
  String? _userPrompt;
  String get userPrompt => _userPrompt ?? '';
  bool hasUserPrompt() => _userPrompt != null;

  // "revised_prompt" field.
  String? _revisedPrompt;
  String get revisedPrompt => _revisedPrompt ?? '';
  bool hasRevisedPrompt() => _revisedPrompt != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "album_ref" field.
  DocumentReference? _albumRef;
  DocumentReference? get albumRef => _albumRef;
  bool hasAlbumRef() => _albumRef != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "ratio" field.
  String? _ratio;
  String get ratio => _ratio ?? '';
  bool hasRatio() => _ratio != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "private" field.
  bool? _private;
  bool get private => _private ?? false;
  bool hasPrivate() => _private != null;

  // "blurhash" field.
  String? _blurhash;
  String get blurhash => _blurhash ?? '';
  bool hasBlurhash() => _blurhash != null;

  void _initializeFields() {
    _tempUrl = snapshotData['temp_url'] as String?;
    _publicUrl = snapshotData['public_url'] as String?;
    _userPrompt = snapshotData['user_prompt'] as String?;
    _revisedPrompt = snapshotData['revised_prompt'] as String?;
    _created = snapshotData['created'] as DateTime?;
    _albumRef = snapshotData['album_ref'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _ratio = snapshotData['ratio'] as String?;
    _likes = castToType<int>(snapshotData['likes']);
    _category = snapshotData['category'] as String?;
    _private = snapshotData['private'] as bool?;
    _blurhash = snapshotData['blurhash'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('images');

  static Stream<ImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesRecord.fromSnapshot(s));

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesRecord.fromSnapshot(s));

  static ImagesRecord fromSnapshot(DocumentSnapshot snapshot) => ImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesRecord._(reference, mapFromFirestore(data));

  static ImagesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ImagesRecord.getDocumentFromData(
        {
          'temp_url': snapshot.data['temp_url'],
          'public_url': snapshot.data['public_url'],
          'user_prompt': snapshot.data['user_prompt'],
          'revised_prompt': snapshot.data['revised_prompt'],
          'created': convertAlgoliaParam(
            snapshot.data['created'],
            ParamType.DateTime,
            false,
          ),
          'album_ref': convertAlgoliaParam(
            snapshot.data['album_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'user_ref': convertAlgoliaParam(
            snapshot.data['user_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'ratio': snapshot.data['ratio'],
          'likes': convertAlgoliaParam(
            snapshot.data['likes'],
            ParamType.int,
            false,
          ),
          'category': snapshot.data['category'],
          'private': snapshot.data['private'],
          'blurhash': snapshot.data['blurhash'],
        },
        ImagesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ImagesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'images',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagesRecordData({
  String? tempUrl,
  String? publicUrl,
  String? userPrompt,
  String? revisedPrompt,
  DateTime? created,
  DocumentReference? albumRef,
  DocumentReference? userRef,
  String? ratio,
  int? likes,
  String? category,
  bool? private,
  String? blurhash,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'temp_url': tempUrl,
      'public_url': publicUrl,
      'user_prompt': userPrompt,
      'revised_prompt': revisedPrompt,
      'created': created,
      'album_ref': albumRef,
      'user_ref': userRef,
      'ratio': ratio,
      'likes': likes,
      'category': category,
      'private': private,
      'blurhash': blurhash,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesRecordDocumentEquality implements Equality<ImagesRecord> {
  const ImagesRecordDocumentEquality();

  @override
  bool equals(ImagesRecord? e1, ImagesRecord? e2) {
    return e1?.tempUrl == e2?.tempUrl &&
        e1?.publicUrl == e2?.publicUrl &&
        e1?.userPrompt == e2?.userPrompt &&
        e1?.revisedPrompt == e2?.revisedPrompt &&
        e1?.created == e2?.created &&
        e1?.albumRef == e2?.albumRef &&
        e1?.userRef == e2?.userRef &&
        e1?.ratio == e2?.ratio &&
        e1?.likes == e2?.likes &&
        e1?.category == e2?.category &&
        e1?.private == e2?.private &&
        e1?.blurhash == e2?.blurhash;
  }

  @override
  int hash(ImagesRecord? e) => const ListEquality().hash([
        e?.tempUrl,
        e?.publicUrl,
        e?.userPrompt,
        e?.revisedPrompt,
        e?.created,
        e?.albumRef,
        e?.userRef,
        e?.ratio,
        e?.likes,
        e?.category,
        e?.private,
        e?.blurhash
      ]);

  @override
  bool isValidKey(Object? o) => o is ImagesRecord;
}
