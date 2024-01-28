import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future se(BuildContext context) async {
  TimedocRecord? timedoc;
  TimedocRecord? latestTimedoc;

  logFirebaseEvent('se_firestore_query');
  timedoc = await queryTimedocRecordOnce(
    queryBuilder: (timedocRecord) => timedocRecord.where(
      'user_ref',
      isEqualTo: currentUserReference,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  logFirebaseEvent('se_backend_call');

  await timedoc!.reference.update({
    ...mapToFirestore(
      {
        'time': FieldValue.serverTimestamp(),
      },
    ),
  });
  logFirebaseEvent('se_firestore_query');
  latestTimedoc = await queryTimedocRecordOnce(
    queryBuilder: (timedocRecord) => timedocRecord.where(
      'user_ref',
      isEqualTo: currentUserReference,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (functions.isMoreThanWeek(
      FFAppState().weeklyGenerationsDate!, latestTimedoc!.time!)) {
    logFirebaseEvent('se_update_app_state');
    FFAppState().update(() {
      FFAppState().weeklyGenerationsDate = latestTimedoc?.time;
      FFAppState().weeklyGenerations = revenue_cat.activeEntitlementIds
              .contains(FFAppConstants.entitlementName)
          ? 100
          : 10;
    });
  }
}

Future accountSetup(BuildContext context) async {
  AlbumsRecord? createdAlbum;
  TimedocRecord? timeDoc;

  logFirebaseEvent('accountSetup_backend_call');

  var albumsRecordReference = AlbumsRecord.collection.doc();
  await albumsRecordReference.set({
    ...createAlbumsRecordData(
      userRef: currentUserReference,
      title: 'Uncategorized',
      description: 'All uncategorized AI images.',
    ),
    ...mapToFirestore(
      {
        'created': FieldValue.serverTimestamp(),
      },
    ),
  });
  createdAlbum = AlbumsRecord.getDocumentFromData({
    ...createAlbumsRecordData(
      userRef: currentUserReference,
      title: 'Uncategorized',
      description: 'All uncategorized AI images.',
    ),
    ...mapToFirestore(
      {
        'created': DateTime.now(),
      },
    ),
  }, albumsRecordReference);
  logFirebaseEvent('accountSetup_backend_call');

  await currentUserReference!.update({
    ...createUsersRecordData(
      defaultAlbum: createdAlbum?.reference,
    ),
    ...mapToFirestore(
      {
        'albums': FieldValue.arrayUnion([
          getFoldersFirestoreData(
            createFoldersStruct(
              name: createdAlbum?.title,
              albumRef: createdAlbum?.reference,
              clearUnsetFields: false,
            ),
            true,
          )
        ]),
      },
    ),
  });
  logFirebaseEvent('accountSetup_backend_call');

  var timedocRecordReference = TimedocRecord.collection.doc();
  await timedocRecordReference.set(createTimedocRecordData(
    userRef: currentUserReference,
  ));
  timeDoc = TimedocRecord.getDocumentFromData(
      createTimedocRecordData(
        userRef: currentUserReference,
      ),
      timedocRecordReference);
  logFirebaseEvent('accountSetup_update_app_state');
  FFAppState().update(() {
    FFAppState().weeklyGenerations = 10;
  });
}
