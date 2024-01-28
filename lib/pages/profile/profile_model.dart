import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/delete_confirmation/delete_confirmation_widget.dart';
import '/components/light_dark_toggle/light_dark_toggle_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/paywall/paywall_widget.dart';
import '/components/paywall_confirmation/paywall_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'profile_widget.dart' show ProfileWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  AdminRecord? adminDocument;
  // Model for navbar component.
  late NavbarModel navbarModel;
  // Model for lightDarkToggle component.
  late LightDarkToggleModel lightDarkToggleModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
    lightDarkToggleModel = createModel(context, () => LightDarkToggleModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navbarModel.dispose();
    lightDarkToggleModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
