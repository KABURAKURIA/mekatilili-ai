import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_album_loading_model.dart';
export 'add_album_loading_model.dart';

class AddAlbumLoadingWidget extends StatefulWidget {
  const AddAlbumLoadingWidget({super.key});

  @override
  State<AddAlbumLoadingWidget> createState() => _AddAlbumLoadingWidgetState();
}

class _AddAlbumLoadingWidgetState extends State<AddAlbumLoadingWidget> {
  late AddAlbumLoadingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAlbumLoadingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowIconButton(
      borderColor: Colors.transparent,
      borderRadius: 40.0,
      buttonSize: 60.0,
      fillColor: FlutterFlowTheme.of(context).primary,
      icon: Icon(
        Icons.add,
        color: FlutterFlowTheme.of(context).info,
        size: 30.0,
      ),
      onPressed: () {
        print('IconButton pressed ...');
      },
    );
  }
}
