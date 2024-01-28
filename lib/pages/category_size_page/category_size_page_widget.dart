import '/backend/backend.dart';
import '/components/no_images/no_images_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'category_size_page_model.dart';
export 'category_size_page_model.dart';

class CategorySizePageWidget extends StatefulWidget {
  const CategorySizePageWidget({
    super.key,
    this.style,
    this.size,
  });

  final String? style;
  final String? size;

  @override
  State<CategorySizePageWidget> createState() => _CategorySizePageWidgetState();
}

class _CategorySizePageWidgetState extends State<CategorySizePageWidget> {
  late CategorySizePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategorySizePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CategorySizePage'});
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 20.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.arrow_back_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('CATEGORY_SIZE_arrow_back_outlined_ICN_ON');
                logFirebaseEvent('IconButton_navigate_back');
                context.safePop();
              },
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.size != null && widget.size != ''
                            ? widget.size
                            : widget.style,
                        'NaN',
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                    Text(
                      widget.size != null && widget.size != ''
                          ? 'Images that are ${widget.size}.'
                          : 'Images in ${widget.style} style.',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.share_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent(
                          'CATEGORY_SIZE_share_outlined_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_generate_current_page_link');
                      _model.currentPageLink = await generateCurrentPageLink(
                        context,
                        title: 'Explore ${valueOrDefault<String>(
                          widget.size != null && widget.size != ''
                              ? widget.size
                              : widget.style,
                          'NaN',
                        )} Images',
                        imageUrl:
                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dream-brush-wn2zsq/assets/cxhml5usr1hu/DreamBrush_Icon.png',
                        description: widget.size != null && widget.size != ''
                            ? 'Images that are ${widget.size}.'
                            : 'Images in ${widget.style} style.',
                        forceRedirect: true,
                      );

                      logFirebaseEvent('IconButton_share');
                      await Share.share(
                        _model.currentPageLink,
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          toolbarHeight: 80.0,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.style != null && widget.style != '')
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 48.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: StreamBuilder<List<ImagesRecord>>(
                        stream: queryImagesRecord(
                          queryBuilder: (imagesRecord) => imagesRecord
                              .where(
                                'category',
                                isEqualTo: widget.style,
                              )
                              .orderBy('created', descending: true),
                          limit: 25,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ImagesRecord> styleGridImagesRecordList =
                              snapshot.data!;
                          if (styleGridImagesRecordList.isEmpty) {
                            return NoImagesWidget();
                          }
                          return MasonryGridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                            itemCount: styleGridImagesRecordList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, styleGridIndex) {
                              final styleGridImagesRecord =
                                  styleGridImagesRecordList[styleGridIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CATEGORY_SIZE_Image_2mvnvj8j_ON_TAP');
                                  logFirebaseEvent('Image_haptic_feedback');
                                  HapticFeedback.lightImpact();
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed(
                                    'ImageDetails',
                                    queryParameters: {
                                      'imageRef': serializeParam(
                                        styleGridImagesRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Hero(
                                  tag: styleGridImagesRecord.publicUrl,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      styleGridImagesRecord.publicUrl,
                                      width: double.infinity,
                                      height: styleGridImagesRecord.ratio ==
                                              '1024x1792'
                                          ? 220.0
                                          : 180.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              if (widget.size != null && widget.size != '')
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 48.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: StreamBuilder<List<ImagesRecord>>(
                        stream: queryImagesRecord(
                          queryBuilder: (imagesRecord) => imagesRecord
                              .where(
                                'ratio',
                                isEqualTo: widget.size,
                              )
                              .orderBy('created', descending: true),
                          limit: 25,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ImagesRecord> sizeGridImagesRecordList =
                              snapshot.data!;
                          if (sizeGridImagesRecordList.isEmpty) {
                            return NoImagesWidget();
                          }
                          return MasonryGridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                            itemCount: sizeGridImagesRecordList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, sizeGridIndex) {
                              final sizeGridImagesRecord =
                                  sizeGridImagesRecordList[sizeGridIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CATEGORY_SIZE_Image_g7lhkklp_ON_TAP');
                                  logFirebaseEvent('Image_haptic_feedback');
                                  HapticFeedback.lightImpact();
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed(
                                    'ImageDetails',
                                    queryParameters: {
                                      'imageRef': serializeParam(
                                        sizeGridImagesRecord.reference,
                                        ParamType.DocumentReference,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Hero(
                                  tag: sizeGridImagesRecord.publicUrl,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      sizeGridImagesRecord.publicUrl,
                                      width: double.infinity,
                                      height: sizeGridImagesRecord.ratio ==
                                              '1024x1792'
                                          ? 220.0
                                          : 180.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
