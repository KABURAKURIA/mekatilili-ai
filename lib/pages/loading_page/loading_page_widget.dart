import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_page_model.dart';
export 'loading_page_model.dart';

class LoadingPageWidget extends StatefulWidget {
  const LoadingPageWidget({super.key});

  @override
  State<LoadingPageWidget> createState() => _LoadingPageWidgetState();
}

class _LoadingPageWidgetState extends State<LoadingPageWidget>
    with TickerProviderStateMixin {
  late LoadingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 30000.ms,
          begin: 0.3,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 20000.ms,
          begin: Offset(0.5, 0.5),
          end: Offset(1.0, 1.0),
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 2000.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 0.02,
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 4000.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: -0.04,
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 6000.ms,
          duration: 2000.ms,
          begin: 0.0,
          end: 0.02,
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1400.ms,
          begin: Offset(0.5, 0.5),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LoadingPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LOADING_LoadingPage_ON_INIT_STATE');
      logFirebaseEvent('LoadingPage_haptic_feedback');
      HapticFeedback.vibrate();
      logFirebaseEvent('LoadingPage_backend_call');
      _model.imageGenerationAPICall = await OpenAIImageGenerationAPICall.call(
        prompt: FFAppState().tempImageDocument.userPrompt,
        style: FFAppState().tempImageDocument.style,
        size: FFAppState().tempImageDocument.size,
      );
      if ((_model.imageGenerationAPICall?.succeeded ?? true)) {
        logFirebaseEvent('LoadingPage_custom_action');
        _model.blurHash = await actions.getImageHash(
          OpenAIImageGenerationAPICall.tempURL(
            (_model.imageGenerationAPICall?.jsonBody ?? ''),
          ).toString(),
        );
        logFirebaseEvent('LoadingPage_update_app_state');
        setState(() {
          FFAppState().updateTempImageDocumentStruct(
            (e) => e
              ..tempUrl = OpenAIImageGenerationAPICall.tempURL(
                (_model.imageGenerationAPICall?.jsonBody ?? ''),
              ).toString()
              ..aIPrompt = OpenAIImageGenerationAPICall.revisedPrompt(
                (_model.imageGenerationAPICall?.jsonBody ?? ''),
              ).toString()
              ..blurHash = _model.blurHash,
          );
          FFAppState().weeklyGenerations = FFAppState().weeklyGenerations + -1;
        });
        logFirebaseEvent('LoadingPage_navigate_to');

        context.goNamed(
          'PostLoaded',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
            ),
          },
        );
      } else {
        logFirebaseEvent('LoadingPage_navigate_back');
        context.safePop();
        logFirebaseEvent('LoadingPage_show_snack_bar');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Image generation failed. Please try again in 1-2 minutes.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Sora',
                    color: FlutterFlowTheme.of(context).info,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).primary,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(),
                      child: Opacity(
                        opacity: 0.8,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image.asset(
                            'assets/images/black-and-white-wavy-chequered-aesthetic-pattern-wallpaper-mural-Plain-820x532.webp',
                            width: 300.0,
                            height: 350.0,
                            fit: BoxFit.cover,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation']!),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15.0,
                    sigmaY: 15.0,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.54),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '0gii2dmc' /* Generating... */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium,
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation']!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
