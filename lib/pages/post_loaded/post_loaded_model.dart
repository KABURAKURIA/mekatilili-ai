import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/generations_remaining_text/generations_remaining_text_widget.dart';
import '/components/paywall/paywall_widget.dart';
import '/components/review/review_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'post_loaded_widget.dart' show PostLoadedWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PostLoadedModel extends FlutterFlowModel<PostLoadedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for GenerationsRemainingText component.
  late GenerationsRemainingTextModel generationsRemainingTextModel;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ImagesRecord? imageRef;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    generationsRemainingTextModel =
        createModel(context, () => GenerationsRemainingTextModel());
  }

  void dispose() {
    unfocusNode.dispose();
    generationsRemainingTextModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
