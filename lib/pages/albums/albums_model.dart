import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_album_loading/add_album_loading_widget.dart';
import '/components/album_list_loading_component/album_list_loading_component_widget.dart';
import '/components/empty_gallery/empty_gallery_widget.dart';
import '/components/gallery_image_loading_component/gallery_image_loading_component_widget.dart';
import '/components/gallery_loading_component/gallery_loading_component_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/new_album/new_album_widget.dart';
import '/components/paywall/paywall_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'albums_widget.dart' show AlbumsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlbumsModel extends FlutterFlowModel<AlbumsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for navbar component.
  late NavbarModel navbarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
