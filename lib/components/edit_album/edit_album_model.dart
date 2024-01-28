import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'edit_album_widget.dart' show EditAlbumWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditAlbumModel extends FlutterFlowModel<EditAlbumWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for folderTitle widget.
  FocusNode? folderTitleFocusNode1;
  TextEditingController? folderTitleController1;
  String? Function(BuildContext, String?)? folderTitleController1Validator;
  // State field(s) for folderTitle widget.
  FocusNode? folderTitleFocusNode2;
  TextEditingController? folderTitleController2;
  String? Function(BuildContext, String?)? folderTitleController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    folderTitleFocusNode1?.dispose();
    folderTitleController1?.dispose();

    folderTitleFocusNode2?.dispose();
    folderTitleController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
