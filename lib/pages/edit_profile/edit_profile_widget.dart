import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EditProfile'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_PROFILE_EditProfile_ON_INIT_STATE');
      logFirebaseEvent('EditProfile_update_page_state');
      setState(() {
        _model.profilePicture = currentUserPhoto;
      });
    });

    _model.firstNameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.firstName, ''));
    _model.firstNameFocusNode ??= FocusNode();

    _model.lastNameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.lastName, ''));
    _model.lastNameFocusNode ??= FocusNode();
    _model.lastNameFocusNode!.addListener(() => setState(() {}));
    _model.nicknameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.nicknameFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.arrow_back_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('EDIT_PROFILE_arrow_back_outlined_ICN_ON_');
                logFirebaseEvent('IconButton_haptic_feedback');
                HapticFeedback.lightImpact();
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
                      FFLocalizations.of(context).getText(
                        '6nakj5p3' /* Edit Profile */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.share_outlined,
                        color: Colors.transparent,
                        size: 1.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EDIT_PROFILE_Container_esne425c_ON_TAP');
                                  logFirebaseEvent(
                                      'Container_upload_media_to_firebase');
                                  final selectedMedia =
                                      await selectMediaWithSourceBottomSheet(
                                    context: context,
                                    maxWidth: 1000.00,
                                    maxHeight: 1000.00,
                                    imageQuality: 90,
                                    allowPhoto: true,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    textColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    pickerFontFamily: 'Sora',
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isDataUploading = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl =
                                            downloadUrls.first;
                                      });
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Failed to upload data');
                                      return;
                                    }
                                  }

                                  if (_model.uploadedFileUrl != null &&
                                      _model.uploadedFileUrl != '') {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    setState(() {
                                      _model.profilePicture =
                                          _model.profilePicture;
                                    });
                                  }
                                },
                                child: Container(
                                  width: 120.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        valueOrDefault<String>(
                                          _model.profilePicture,
                                          'false',
                                        ),
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Visibility(
                                    visible: _model.profilePicture == null ||
                                        _model.profilePicture == '',
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.upload_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 36.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '4ymw2g1f' /* PICTURE IDEAS */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontSize: 10.0,
                                            letterSpacing: 1.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: Wrap(
                                        spacing: 12.0,
                                        runSpacing: 12.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EDIT_PROFILE_CircleImage_ctmzzjn0_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleImage_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'CircleImage_update_page_state');
                                              setState(() {
                                                _model.profilePicture =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dream-brush-wn2zsq/assets/is8x1jhthliw/DALL%C2%B7E_2023-11-10_09.22.16_-_A_silly_and_humorous_dog_profile_picture._The_dog_should_be_a_Dachshund_wearing_oversized_sunglasses_and_a_playful_bow_tie._Its_expression_should_be_c.png';
                                              });
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/DALLE_2023-11-10_09.22.16_-_A_silly_and_humorous_dog_profile_picture._The_dog_should_be_a_Dachshund_wearing_oversized_sunglasses_and_a_playful_bow_tie._Its_expression_should_be_c.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EDIT_PROFILE_CircleImage_gpcbeet2_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleImage_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'CircleImage_update_page_state');
                                              setState(() {
                                                _model.profilePicture =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dream-brush-wn2zsq/assets/tmhrndmew1hs/DALL%C2%B7E_2023-11-10_09.26.33_-_A_profile_picture_of_an_excited_pirate,_full_of_energy_and_enthusiasm._The_pirate_should_have_a_classic_look,_with_a_tricorn_hat,_eye_patch,_and_a_lar.png';
                                              });
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/DALLE_2023-11-10_09.26.33_-_A_profile_picture_of_an_excited_pirate,_full_of_energy_and_enthusiasm._The_pirate_should_have_a_classic_look,_with_a_tricorn_hat,_eye_patch,_and_a_lar.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EDIT_PROFILE_CircleImage_c7lbev4j_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleImage_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'CircleImage_update_page_state');
                                              setState(() {
                                                _model.profilePicture =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dream-brush-wn2zsq/assets/d2zimimrqibs/DALL%C2%B7E_2023-11-10_09.28.49_-_A_profile_picture_of_a_fictional,_powerful_robot_resembling_a_Transformer,_known_for_its_mechanical_and_futuristic_design._The_robot_should_have_a_met.png';
                                              });
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/DALLE_2023-11-10_09.28.49_-_A_profile_picture_of_a_fictional,_powerful_robot_resembling_a_Transformer,_known_for_its_mechanical_and_futuristic_design._The_robot_should_have_a_met.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EDIT_PROFILE_CircleImage_3wujk9cb_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleImage_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'CircleImage_update_page_state');
                                              setState(() {
                                                _model.profilePicture =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dream-brush-wn2zsq/assets/0ix8ahyeunrf/DALL%C2%B7E_2023-11-10_09.29.45_-_A_profile_picture_of_an_anime_woman_with_a_captivating_and_artistic_style._She_should_have_large,_expressive_eyes_and_a_delicate,_elegant_facial_struc.png';
                                              });
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/DALLE_2023-11-10_09.29.45_-_A_profile_picture_of_an_anime_woman_with_a_captivating_and_artistic_style._She_should_have_large,_expressive_eyes_and_a_delicate,_elegant_facial_struc.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EDIT_PROFILE_CircleImage_oy7odhvg_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleImage_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'CircleImage_update_page_state');
                                              setState(() {
                                                _model.profilePicture =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dream-brush-wn2zsq/assets/f7j2lc55a961/DALL%C2%B7E_2023-11-10_09.34.29_-_An_8-bit_style_profile_picture_of_a_racecar_driver,_designed_in_a_classic_pixel_art_aesthetic._The_driver_should_be_wearing_a_racing_helmet_with_a_vis.png';
                                              });
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/DALLE_2023-11-10_09.34.29_-_An_8-bit_style_profile_picture_of_a_racecar_driver,_designed_in_a_classic_pixel_art_aesthetic._The_driver_should_be_wearing_a_racing_helmet_with_a_vis.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EDIT_PROFILE_CircleImage_99qqolpt_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleImage_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'CircleImage_update_page_state');
                                              setState(() {
                                                _model.profilePicture =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dream-brush-wn2zsq/assets/1y23ugn35753/DALL%C2%B7E_2023-11-10_09.39.20_-_A_cartoon-style_profile_picture_of_the_Statue_of_Liberty,_depicted_in_a_fun_and_whimsical_manner._The_statue_should_have_exaggerated_features,_like_la.png';
                                              });
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/DALLE_2023-11-10_09.39.20_-_A_cartoon-style_profile_picture_of_the_Statue_of_Liberty,_depicted_in_a_fun_and_whimsical_manner._The_statue_should_have_exaggerated_features,_like_la.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EDIT_PROFILE_CircleImage_yzic1pzf_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleImage_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'CircleImage_update_page_state');
                                              setState(() {
                                                _model.profilePicture =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dream-brush-wn2zsq/assets/en6d2wi89gwg/DALL%C2%B7E_2023-11-10_09.32.29_-_A_profile_picture_of_an_excited,_fantasy_cartoon_character,_full_of_wonder_and_magic._The_character_should_be_a_whimsical_creature,_like_a_mix_between.png';
                                              });
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/DALLE_2023-11-10_09.32.29_-_A_profile_picture_of_an_excited,_fantasy_cartoon_character,_full_of_wonder_and_magic._The_character_should_be_a_whimsical_creature,_like_a_mix_between.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EDIT_PROFILE_CircleImage_ztt7sdr9_ON_TAP');
                                              logFirebaseEvent(
                                                  'CircleImage_haptic_feedback');
                                              HapticFeedback.selectionClick();
                                              logFirebaseEvent(
                                                  'CircleImage_update_page_state');
                                              setState(() {
                                                _model.profilePicture =
                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dream-brush-wn2zsq/assets/cv7gma8o3uzc/DALL%C2%B7E_2023-11-10_09.40.38_-_A_fun_and_adorable_cat_profile_picture._The_cat_should_be_a_fluffy,_bright-eyed_tabby_with_a_playful_expression,_perhaps_with_its_tongue_sticking_out_.png';
                                              });
                                            },
                                            child: Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/DALLE_2023-11-10_09.40.38_-_A_fun_and_adorable_cat_profile_picture._The_cat_should_be_a_fluffy,_bright-eyed_tabby_with_a_playful_expression,_perhaps_with_its_tongue_sticking_out_.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 6.0)),
                                ),
                              ),
                            ].divide(SizedBox(width: 24.0)),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 100.0,
                                      child: TextFormField(
                                        controller: _model.firstNameController,
                                        focusNode: _model.firstNameFocusNode,
                                        autofillHints: [
                                          AutofillHints.givenName
                                        ],
                                        textCapitalization:
                                            TextCapitalization.words,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'votbhd0j' /* First name */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .firstNameControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 100.0,
                                      child: TextFormField(
                                        controller: _model.lastNameController,
                                        focusNode: _model.lastNameFocusNode,
                                        autofillHints: [
                                          AutofillHints.familyName
                                        ],
                                        textCapitalization:
                                            TextCapitalization.words,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '0nazf4t7' /* Last name */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Sora',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        validator: _model
                                            .lastNameControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller: _model.nicknameController,
                                    focusNode: _model.nicknameFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.nicknameController',
                                      Duration(milliseconds: 400),
                                      () => setState(() {}),
                                    ),
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'rcjw6p5x' /* Nickname */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Sora',
                                            fontWeight: FontWeight.w500,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Sora',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                    maxLength: 20,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    validator: _model
                                        .nicknameControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 12.0)),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: FlutterFlowLanguageSelector(
                                  width: double.infinity,
                                  height: 50.0,
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderColor: Colors.transparent,
                                  dropdownIconColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  borderRadius: 8.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Sora',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  hideFlags: true,
                                  flagSize: 24.0,
                                  flagTextGap: 8.0,
                                  currentLanguage:
                                      FFLocalizations.of(context).languageCode,
                                  languages: FFLocalizations.languages(),
                                  onChanged: (lang) =>
                                      setAppLanguage(context, lang),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('EDIT_PROFILE_SAVE_CHANGES_BTN_ON_TAP');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.lightImpact();
                      logFirebaseEvent('Button_validate_form');
                      if (_model.formKey.currentState == null ||
                          !_model.formKey.currentState!.validate()) {
                        return;
                      }
                      logFirebaseEvent('Button_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        firstName: _model.firstNameController.text,
                        lastName: _model.lastNameController.text,
                        photoUrl: _model.profilePicture,
                        displayName: _model.nicknameController.text,
                      ));
                      logFirebaseEvent('Button_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Profile changes saved!',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Sora',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'bwi4v4ib' /* Save Changes */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Sora',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ]
                  .divide(SizedBox(height: 12.0))
                  .addToStart(SizedBox(height: 24.0))
                  .addToEnd(SizedBox(height: 32.0)),
            ),
          ),
        ),
      ),
    );
  }
}
