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
import 'post_loaded_model.dart';
export 'post_loaded_model.dart';

class PostLoadedWidget extends StatefulWidget {
  const PostLoadedWidget({super.key});

  @override
  State<PostLoadedWidget> createState() => _PostLoadedWidgetState();
}

class _PostLoadedWidgetState extends State<PostLoadedWidget>
    with TickerProviderStateMixin {
  late PostLoadedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'generationsRemainingTextOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1400.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1400.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1000.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: Offset(0.0, 20.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostLoadedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PostLoaded'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('POST_LOADED_PostLoaded_ON_INIT_STATE');
      if (random_data.randomInteger(0, 10) == 5) {
        logFirebaseEvent('PostLoaded_alert_dialog');
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: ReviewWidget(),
              ),
            );
          },
        ).then((value) => setState(() {}));
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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 64.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 8.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'mqaxkuc5' /* DreamBrush */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.generationsRemainingTextModel,
                            updateCallback: () => setState(() {}),
                            child: GenerationsRemainingTextWidget(),
                          ).animateOnPageLoad(animationsMap[
                              'generationsRemainingTextOnPageLoadAnimation']!),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 48.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.87,
                                  constraints: BoxConstraints(
                                    minHeight: 270.0,
                                    maxHeight: 400.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'POST_LOADED_PAGE_Image_benl6r4r_ON_TAP');
                                      logFirebaseEvent('Image_expand_image');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: OctoImage(
                                              placeholderBuilder:
                                                  OctoPlaceholder.blurHash(
                                                valueOrDefault<String>(
                                                  FFAppState()
                                                      .tempImageDocument
                                                      .blurHash,
                                                  'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                                ),
                                              ),
                                              image: CachedNetworkImageProvider(
                                                FFAppState()
                                                    .tempImageDocument
                                                    .tempUrl,
                                              ),
                                              fit: BoxFit.contain,
                                              memCacheWidth: 800,
                                              memCacheHeight: 800,
                                            ),
                                            allowRotation: false,
                                            tag: FFAppState()
                                                .tempImageDocument
                                                .tempUrl,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: FFAppState()
                                          .tempImageDocument
                                          .tempUrl,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: OctoImage(
                                          placeholderBuilder:
                                              OctoPlaceholder.blurHash(
                                            valueOrDefault<String>(
                                              FFAppState()
                                                  .tempImageDocument
                                                  .blurHash,
                                              'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                            ),
                                          ),
                                          image: CachedNetworkImageProvider(
                                            FFAppState()
                                                .tempImageDocument
                                                .tempUrl,
                                          ),
                                          width: double.infinity,
                                          height: () {
                                            if (FFAppState()
                                                    .tempImageDocument
                                                    .size ==
                                                '1024x1024') {
                                              return 300.0;
                                            } else if (FFAppState()
                                                    .tempImageDocument
                                                    .size ==
                                                '1024x1792') {
                                              return 380.0;
                                            } else {
                                              return 220.0;
                                            }
                                          }(),
                                          fit: BoxFit.cover,
                                          memCacheWidth: 800,
                                          memCacheHeight: 800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 260.0,
                            height: 80.0,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: 250.0,
                                    decoration: BoxDecoration(),
                                    child: SwitchListTile.adaptive(
                                      value: _model.switchListTileValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .switchListTileValue = newValue!);
                                      },
                                      title: Text(
                                        FFLocalizations.of(context).getText(
                                          'id1ieie4' /* Make Private */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Sora',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                      tileColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeTrackColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      dense: false,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ),
                                if (!revenue_cat.activeEntitlementIds
                                    .contains(FFAppConstants.entitlementName))
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'POST_LOADED_Container_485qg4sf_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: PaywallWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.07, -0.01),
                                  child: Icon(
                                    Icons.auto_awesome_rounded,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 12.0,
                                    buttonSize: 65.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.replay_rounded,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 35.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'POST_LOADED_replay_rounded_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.goNamed(
                                        'LoadingPage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 12.0,
                                    buttonSize: 65.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 35.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'POST_LOADED_edit_outlined_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.pushNamed(
                                        'ImageGenerator',
                                        queryParameters: {
                                          'initialPrompt': serializeParam(
                                            FFAppState()
                                                .tempImageDocument
                                                .userPrompt,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    },
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 12.0,
                                    buttonSize: 65.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.check_rounded,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 35.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'POST_LOADED_check_rounded_ICN_ON_TAP');
                                      logFirebaseEvent(
                                          'IconButton_haptic_feedback');
                                      HapticFeedback.lightImpact();
                                      logFirebaseEvent(
                                          'IconButton_backend_call');

                                      var imagesRecordReference =
                                          ImagesRecord.collection.doc();
                                      await imagesRecordReference.set({
                                        ...createImagesRecordData(
                                          tempUrl: FFAppState()
                                              .tempImageDocument
                                              .tempUrl,
                                          userPrompt: FFAppState()
                                              .tempImageDocument
                                              .userPrompt,
                                          revisedPrompt: FFAppState()
                                              .tempImageDocument
                                              .aIPrompt,
                                          userRef: currentUserReference,
                                          category: FFAppState()
                                              .tempImageDocument
                                              .style,
                                          ratio: FFAppState()
                                              .tempImageDocument
                                              .size,
                                          private: false,
                                          likes: 0,
                                          albumRef:
                                              currentUserDocument?.defaultAlbum,
                                          blurhash: valueOrDefault<String>(
                                            FFAppState()
                                                .tempImageDocument
                                                .blurHash,
                                            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.imageRef =
                                          ImagesRecord.getDocumentFromData({
                                        ...createImagesRecordData(
                                          tempUrl: FFAppState()
                                              .tempImageDocument
                                              .tempUrl,
                                          userPrompt: FFAppState()
                                              .tempImageDocument
                                              .userPrompt,
                                          revisedPrompt: FFAppState()
                                              .tempImageDocument
                                              .aIPrompt,
                                          userRef: currentUserReference,
                                          category: FFAppState()
                                              .tempImageDocument
                                              .style,
                                          ratio: FFAppState()
                                              .tempImageDocument
                                              .size,
                                          private: false,
                                          likes: 0,
                                          albumRef:
                                              currentUserDocument?.defaultAlbum,
                                          blurhash: valueOrDefault<String>(
                                            FFAppState()
                                                .tempImageDocument
                                                .blurHash,
                                            'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                                          ),
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created': DateTime.now(),
                                          },
                                        ),
                                      }, imagesRecordReference);
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.goNamed(
                                        'ImageDetails',
                                        queryParameters: {
                                          'imageRef': serializeParam(
                                            _model.imageRef?.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'fromCreation': serializeParam(
                                            true,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );

                                      setState(() {});
                                    },
                                  ),
                                ].divide(SizedBox(width: 24.0)),
                              ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation']!),
                            ),
                          ),
                        ].divide(SizedBox(height: 12.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
