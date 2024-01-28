import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'premium_features_list_model.dart';
export 'premium_features_list_model.dart';

class PremiumFeaturesListWidget extends StatefulWidget {
  const PremiumFeaturesListWidget({super.key});

  @override
  State<PremiumFeaturesListWidget> createState() =>
      _PremiumFeaturesListWidgetState();
}

class _PremiumFeaturesListWidgetState extends State<PremiumFeaturesListWidget> {
  late PremiumFeaturesListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremiumFeaturesListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.auto_awesome_outlined,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  FFLocalizations.of(context).getText(
                    '8xm0tarf' /* 100 Image Generations Per Week */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Sora',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        lineHeight: 1.1,
                      ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.lock_outline,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  FFLocalizations.of(context).getText(
                    'y0rimd99' /* Hide Images From Public View */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Sora',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        lineHeight: 1.1,
                      ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.textsms_outlined,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  FFLocalizations.of(context).getText(
                    'o1zj0116' /* View Public Image Prompts */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Sora',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        lineHeight: 1.1,
                      ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent1,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Icon(
                    Icons.download_outlined,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 22.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  FFLocalizations.of(context).getText(
                    '03juwe70' /* Save AI Images */,
                  ),
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Sora',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        lineHeight: 1.1,
                      ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ]
            .divide(SizedBox(height: 8.0))
            .addToStart(SizedBox(height: 16.0))
            .addToEnd(SizedBox(height: 16.0)),
      ),
    );
  }
}
