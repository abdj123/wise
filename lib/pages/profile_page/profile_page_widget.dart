import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/edit_name/edit_name_widget.dart';
import '/components/user_account/user_account_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/walkthroughs/change_photo.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  static String routeName = 'Profile_Page';
  static String routePath = '/profilePage';

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.stopAudio();
    });

    _model.switchValue = FFAppState().isDarkMode;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          actions: [],
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final selectedMedia = await selectMedia(
                              maxWidth: 1920.00,
                              maxHeight: 1920.00,
                              mediaSource: MediaSource.photoGallery,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
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
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }

                            await currentUserReference!
                                .update(createUsersRecordData(
                              photoUrl: _model.uploadedFileUrl,
                            ));
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(80.0),
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      if (currentUserPhoto != '') {
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: currentUserPhoto,
                                            width: 90.0,
                                            height: 90.0,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      } else {
                                        return Icon(
                                          Icons.person_outline,
                                          color: FlutterFlowTheme.of(context)
                                              .pureWhite,
                                          size: 80.0,
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'qufkr6hv' /* Change photo */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ).addWalkthrough(
                          columnFjbktzc9,
                          _model.changePhotoController,
                        ),
                        Stack(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 18.0, 10.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  currentUserDisplayName == ''
                                      ? 'Unknown'
                                      : currentUserDisplayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: EditNameWidget(),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.edit,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          currentUserEmail,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.5,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: AutoSizeText(
                            FFLocalizations.of(context).getText(
                              'o8g36et8' /* Voice Speed:  */,
                            ),
                            minFontSize: 14.0,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController1 ??=
                              FormFieldController<String>(null),
                          options: List<String>.from(
                              ['0.1', '0.5', '0.75', '1', '1.5']),
                          optionLabels: [
                            FFLocalizations.of(context).getText(
                              'o014eel4' /* Very Slow */,
                            ),
                            FFLocalizations.of(context).getText(
                              'evjtgb9i' /* Slow */,
                            ),
                            FFLocalizations.of(context).getText(
                              'la0axw7f' /* Medium */,
                            ),
                            FFLocalizations.of(context).getText(
                              '4mcehpkn' /* Fast */,
                            ),
                            FFLocalizations.of(context).getText(
                              '160uad71' /* Very Fast */,
                            )
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue1 = val);
                            FFAppState().voiceSpeed =
                                double.parse((_model.dropDownValue1!));
                            safeSetState(() {});
                          },
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          height: 40.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                  ),
                          hintText: FFLocalizations.of(context).getText(
                            'jty1wbv9' /* Voice Rate */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: Colors.transparent,
                          borderWidth: 0.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'lktdqtp7' /* Voice Language: */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController2 ??=
                            FormFieldController<String>(
                          _model.dropDownValue2 ??= FFAppState().language,
                        ),
                        options: [
                          FFLocalizations.of(context).getText(
                            'hcn37pys' /* en-US */,
                          ),
                          FFLocalizations.of(context).getText(
                            '2hw19ift' /* en-GB */,
                          ),
                          FFLocalizations.of(context).getText(
                            'znnmr8lv' /* es-ES */,
                          ),
                          FFLocalizations.of(context).getText(
                            'mbyar6p8' /* fr-FR */,
                          ),
                          FFLocalizations.of(context).getText(
                            'zv9j8r6v' /* de-DE */,
                          ),
                          FFLocalizations.of(context).getText(
                            '36rmhw1v' /* it-IT */,
                          ),
                          FFLocalizations.of(context).getText(
                            'nrh4ov80' /* pt-BR */,
                          )
                        ],
                        onChanged: (val) async {
                          safeSetState(() => _model.dropDownValue2 = val);
                          FFAppState().language = _model.dropDownValue2!;
                          safeSetState(() {});
                        },
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: 40.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'rvskngli' /* App Language: */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      FlutterFlowLanguageSelector(
                        width: 200.0,
                        height: 40.0,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        borderColor: Colors.transparent,
                        dropdownIconColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        borderRadius: 8.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        hideFlags: true,
                        flagSize: 24.0,
                        flagTextGap: 8.0,
                        currentLanguage:
                            FFLocalizations.of(context).languageCode,
                        languages: FFLocalizations.languages(),
                        onChanged: (lang) => setAppLanguage(context, lang),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '6xjiz2qz' /* Dark Mode: */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    Switch.adaptive(
                      value: _model.switchValue!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchValue = newValue);
                        if (newValue) {
                          setDarkModeSetting(context, ThemeMode.dark);
                          FFAppState().isDarkMode = true;
                          safeSetState(() {});
                        } else {
                          setDarkModeSetting(context, ThemeMode.light);
                          FFAppState().isDarkMode = false;
                          safeSetState(() {});
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).primary,
                      activeTrackColor: FlutterFlowTheme.of(context).black,
                      inactiveTrackColor: Color(0xFFBEBABA),
                      inactiveThumbColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 15.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed(ContactUsPageWidget.routeName);
                    },
                    text: FFLocalizations.of(context).getText(
                      'vhlxldva' /* Contact Us */,
                    ),
                    icon: Icon(
                      Icons.contact_mail_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Nunito Sans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(TermsAndPolicyWidget.routeName);
                  },
                  text: FFLocalizations.of(context).getText(
                    '3bc464nf' /* Terms and Policy */,
                  ),
                  icon: Icon(
                    Icons.text_snippet_outlined,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Nunito Sans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).tertiary,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Spacer(),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            context.goNamedAuth(
                                NewAuthPageWidget.routeName, context.mounted);
                          },
                          text: FFLocalizations.of(context).getText(
                            '9ngyh6zj' /* Log Out */,
                          ),
                          icon: Icon(
                            Icons.logout_rounded,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
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
                                      onTap: () {
                                        FocusScope.of(dialogContext).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: UserAccountWidget(),
                                    ),
                                  );
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'iubtocaw' /* Delete */,
                            ),
                            icon: Icon(
                              Icons.delete_outline_rounded,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).error,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nunito Sans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.changePhotoController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
