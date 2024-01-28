import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    this.activePage,
  });

  final int? activePage;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget>
    with TickerProviderStateMixin {
  late NavbarModel _model;

  final animationsMap = {
    'iconButtonOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 3000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 0.02,
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 3600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: -0.04,
        ),
        RotateEffect(
          curve: Curves.easeInOut,
          delay: 4200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 0.02,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 3000.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, -5.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 4200.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(0.0, 5.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 121.0,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NAVBAR_COMP_Column_43n20vzw_ON_TAP');
                              logFirebaseEvent('Column_haptic_feedback');
                              HapticFeedback.lightImpact();
                              logFirebaseEvent('Column_navigate_to');

                              context.goNamed(
                                'HomePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.home_rounded,
                                  color: widget.activePage == 1
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'f0lv5sbb' /* Home */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Sora',
                                        color: widget.activePage == 1
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(height: 6.0))
                                  .addToStart(SizedBox(height: 12.0))
                                  .addToEnd(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NAVBAR_COMP_Column_qvlpajxe_ON_TAP');
                              logFirebaseEvent('Column_haptic_feedback');
                              HapticFeedback.lightImpact();
                              logFirebaseEvent('Column_navigate_to');

                              context.goNamed(
                                'Explore',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.dashboard_rounded,
                                  color: widget.activePage == 2
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'kndykt66' /* Explore */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Sora',
                                        color: widget.activePage == 2
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(height: 6.0))
                                  .addToStart(SizedBox(height: 12.0))
                                  .addToEnd(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NAVBAR_COMP_Column_2221vh1i_ON_TAP');
                              logFirebaseEvent('Column_haptic_feedback');
                              HapticFeedback.lightImpact();
                              logFirebaseEvent('Column_navigate_to');

                              context.goNamed(
                                'Albums',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.photo_library,
                                  color: widget.activePage == 3
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '5lvcbe4s' /* Albums */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Sora',
                                        color: widget.activePage == 3
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(height: 6.0))
                                  .addToStart(SizedBox(height: 12.0))
                                  .addToEnd(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NAVBAR_COMP_Column_g9g1zg93_ON_TAP');
                              logFirebaseEvent('Column_haptic_feedback');
                              HapticFeedback.lightImpact();
                              logFirebaseEvent('Column_navigate_to');

                              context.goNamed(
                                'Profile',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.person_rounded,
                                  color: widget.activePage == 4
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'i0bb253q' /* Profile */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Sora',
                                        color: widget.activePage == 4
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ]
                                  .divide(SizedBox(height: 6.0))
                                  .addToStart(SizedBox(height: 12.0))
                                  .addToEnd(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 12.0,
              buttonSize: 65.0,
              fillColor: FlutterFlowTheme.of(context).primary,
              icon: Icon(
                Icons.auto_awesome_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 35.0,
              ),
              onPressed: () async {
                logFirebaseEvent('NAVBAR_auto_awesome_rounded_ICN_ON_TAP');
                logFirebaseEvent('IconButton_haptic_feedback');
                HapticFeedback.lightImpact();
                logFirebaseEvent('IconButton_navigate_to');

                context.goNamed(
                  'ImageGenerator',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 0),
                    ),
                  },
                );
              },
            ).animateOnPageLoad(
                animationsMap['iconButtonOnPageLoadAnimation']!),
          ),
        ],
      ),
    );
  }
}
