import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'generations_remaining_text_model.dart';
export 'generations_remaining_text_model.dart';

class GenerationsRemainingTextWidget extends StatefulWidget {
  const GenerationsRemainingTextWidget({super.key});

  @override
  State<GenerationsRemainingTextWidget> createState() =>
      _GenerationsRemainingTextWidgetState();
}

class _GenerationsRemainingTextWidgetState
    extends State<GenerationsRemainingTextWidget> {
  late GenerationsRemainingTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerationsRemainingTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      '${FFAppState().weeklyGenerations.toString()}/${revenue_cat.activeEntitlementIds.contains(FFAppConstants.entitlementName) ? '100' : '10'} Images Remaining This Week',
      style: FlutterFlowTheme.of(context).bodyMedium,
    );
  }
}
