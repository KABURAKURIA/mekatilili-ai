import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'light_dark_toggle_model.dart';
export 'light_dark_toggle_model.dart';

class LightDarkToggleWidget extends StatefulWidget {
  const LightDarkToggleWidget({super.key});

  @override
  State<LightDarkToggleWidget> createState() => _LightDarkToggleWidgetState();
}

class _LightDarkToggleWidgetState extends State<LightDarkToggleWidget> {
  late LightDarkToggleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LightDarkToggleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Icon(
          Icons.dark_mode_outlined,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
        Switch.adaptive(
          value: _model.switchValue ??=
              (Theme.of(context).brightness == Brightness.light) == true,
          onChanged: (newValue) async {
            setState(() => _model.switchValue = newValue!);
            if (newValue!) {
              logFirebaseEvent('LIGHT_DARK_TOGGLE_Switch_cxbxzszd_ON_TOG');
              logFirebaseEvent('Switch_haptic_feedback');
              HapticFeedback.selectionClick();
              logFirebaseEvent('Switch_set_dark_mode_settings');
              setDarkModeSetting(context, ThemeMode.light);
            } else {
              logFirebaseEvent('LIGHT_DARK_TOGGLE_Switch_cxbxzszd_ON_TOG');
              logFirebaseEvent('Switch_haptic_feedback');
              HapticFeedback.selectionClick();
              logFirebaseEvent('Switch_set_dark_mode_settings');
              setDarkModeSetting(context, ThemeMode.dark);
            }
          },
          activeColor: FlutterFlowTheme.of(context).primary,
          activeTrackColor: FlutterFlowTheme.of(context).accent1,
          inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
          inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
        ),
        Icon(
          Icons.light_mode_outlined,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
      ].divide(SizedBox(width: 6.0)),
    );
  }
}
