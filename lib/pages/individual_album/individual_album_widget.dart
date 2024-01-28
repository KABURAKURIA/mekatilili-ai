import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/blank_album/blank_album_widget.dart';
import '/components/folder_options/folder_options_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'individual_album_model.dart';
export 'individual_album_model.dart';

class IndividualAlbumWidget extends StatefulWidget {
  const IndividualAlbumWidget({
    super.key,
    required this.albumRef,
  });

  final DocumentReference? albumRef;

  @override
  State<IndividualAlbumWidget> createState() => _IndividualAlbumWidgetState();
}

class _IndividualAlbumWidgetState extends State<IndividualAlbumWidget> {
  late IndividualAlbumModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndividualAlbumModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'IndividualAlbum'});
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

    return StreamBuilder<AlbumsRecord>(
      stream: AlbumsRecord.getDocument(widget.albumRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final individualAlbumAlbumsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              iconTheme: IconThemeData(
                  color: FlutterFlowTheme.of(context).primaryText),
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
                    logFirebaseEvent(
                        'INDIVIDUAL_ALBUM_arrow_back_outlined_ICN');
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
                          individualAlbumAlbumsRecord.title,
                          style: FlutterFlowTheme.of(context).titleLarge,
                        ),
                        if (individualAlbumAlbumsRecord.description != null &&
                            individualAlbumAlbumsRecord.description != '')
                          Text(
                            individualAlbumAlbumsRecord.description,
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
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: FaIcon(
                          FontAwesomeIcons.ellipsisH,
                          color: widget.albumRef !=
                                  currentUserDocument?.defaultAlbum
                              ? FlutterFlowTheme.of(context).primaryText
                              : Colors.transparent,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'INDIVIDUAL_ALBUM_ellipsisH_ICN_ON_TAP');
                          if (widget.albumRef !=
                              currentUserDocument?.defaultAlbum) {
                            logFirebaseEvent('IconButton_bottom_sheet');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: FolderOptionsWidget(
                                      albumRef: individualAlbumAlbumsRecord,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          }
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
                  Padding(
                    padding: EdgeInsets.all(16.0),
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
                                  'album_ref',
                                  isEqualTo: widget.albumRef,
                                )
                                .orderBy('created', descending: true),
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
                            List<ImagesRecord> albumImagesImagesRecordList =
                                snapshot.data!;
                            if (albumImagesImagesRecordList.isEmpty) {
                              return BlankAlbumWidget();
                            }
                            return MasonryGridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              crossAxisSpacing: 12.0,
                              mainAxisSpacing: 12.0,
                              itemCount: albumImagesImagesRecordList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, albumImagesIndex) {
                                final albumImagesImagesRecord =
                                    albumImagesImagesRecordList[
                                        albumImagesIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'INDIVIDUAL_ALBUM_Image_6ef9isq3_ON_TAP');
                                    logFirebaseEvent('Image_haptic_feedback');
                                    HapticFeedback.lightImpact();
                                    logFirebaseEvent('Image_navigate_to');

                                    context.pushNamed(
                                      'ImageDetails',
                                      queryParameters: {
                                        'imageRef': serializeParam(
                                          albumImagesImagesRecord.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Hero(
                                    tag: albumImagesImagesRecord.publicUrl,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        albumImagesImagesRecord.publicUrl,
                                        width: double.infinity,
                                        height: albumImagesImagesRecord.ratio ==
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
      },
    );
  }
}
