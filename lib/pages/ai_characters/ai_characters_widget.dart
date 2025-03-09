import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_recent_chats/empty_recent_chats_widget.dart';
import '/components/paywall_page/paywall_page_widget.dart';
import '/components/user_account/user_account_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/app_setting.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:text_search/text_search.dart';
import 'ai_characters_model.dart';
export 'ai_characters_model.dart';

class AiCharactersWidget extends StatefulWidget {
  const AiCharactersWidget({super.key});

  static String routeName = 'Ai_Characters';
  static String routePath = '/aiCharacters';

  @override
  State<AiCharactersWidget> createState() => _AiCharactersWidgetState();
}

class _AiCharactersWidgetState extends State<AiCharactersWidget>
    with TickerProviderStateMixin {
  late AiCharactersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AiCharactersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.stopAudio();
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.sizeOf(context).width * 0.8,
                    ),
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: AutoSizeText(
                        FFLocalizations.of(context).getText(
                          'uij9qm2b' /* Choose your character to chat ... */,
                        ),
                        minFontSize: 12.0,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito Sans',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
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
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(dialogContext).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.3,
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                child: UserAccountWidget(),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(ProfilePageWidget.routeName);

                          await actions.stopAudio();
                        },
                        child: Icon(
                          Icons.settings_rounded,
                          color: FlutterFlowTheme.of(context).pureWhite,
                          size: 24.0,
                        ),
                      ).addWalkthrough(
                        icon7wreqift,
                        _model.appSettingController,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          centerTitle: false,
          toolbarHeight: 65.0,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Nunito Sans',
                                  letterSpacing: 0.0,
                                ),
                        indicatorColor: FlutterFlowTheme.of(context).primary,
                        tabs: [
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'tdr78ru9' /* Free */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              's8sn8g1n' /* Premium */,
                            ),
                          ),
                          Tab(
                            text: FFLocalizations.of(context).getText(
                              'tivxj0u0' /* Recent */,
                            ),
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [() async {}, () async {}, () async {}][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'okdr1sqm' /* 🧠 Critical Thinkers 💭 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Critical Thinkers',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'o0bsugyp' /* 🙏 Religious Figures ⛩️ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Religious Figures',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'cz9nuks1' /* 🎥 Cinema Legends ⭐ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Cinema Legends',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '21faypvm' /* ✨ Musical Idols 🎤 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Musical Idols',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ttqxxra2' /* 💵 Political Shapers 🏦 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Political Shapers',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '3fttn3ks' /* 🏰 Strategic Leaders ⚔️ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Strategic Leaders',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'vcvyg28n' /* ✒️ Iconic Writers 📜 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Iconic Writers',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'yumkgobv' /* 🧪 Scientific Pioneers 🔭 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Scientific Pioneers',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '5hvrwg7o' /* 👁️ Visionary Catalysts 🕰️ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Visionary Catalysts',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'asog97u3' /* 🎨 Influential Artists 🖌️ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Influential Artists',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'u6iqdqlf' /* ✊ Social Reformers 🏳️ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Nunito Sans',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(),
                                        child: StreamBuilder<
                                            List<AvatarModelRecord>>(
                                          stream: queryAvatarModelRecord(
                                            queryBuilder: (avatarModelRecord) =>
                                                avatarModelRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          'Social Reformers',
                                                    )
                                                    .where(
                                                      'isPremium',
                                                      isEqualTo: false,
                                                    )
                                                    .orderBy('name'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45.0,
                                                  height: 45.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 45.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AvatarModelRecord>
                                                listViewAvatarModelRecordList =
                                                snapshot.data!;

                                            return ListView.separated(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  listViewAvatarModelRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 8.0),
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewAvatarModelRecord =
                                                    listViewAvatarModelRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 3.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            listViewAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              listViewAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 82.0,
                                                          height: 82.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                listViewAvatarModelRecord
                                                                    .avatarImage,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewAvatarModelRecord
                                                              .name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Nunito Sans',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.7,
                                        child: Divider(
                                          thickness: 0.5,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 20.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              safeSetState(() {
                                                _model.tabBarController!
                                                    .animateTo(
                                                  min(
                                                      _model.tabBarController!
                                                              .length -
                                                          1,
                                                      _model.tabBarController!
                                                              .index +
                                                          1),
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              });
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'uw6c2uem' /* More in the PRO Version! ➡️ */,
                                            ),
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.8,
                                              height: 45.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .deepGold,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if ((valueOrDefault(
                                              currentUserDocument
                                                  ?.subscriptionType,
                                              '') !=
                                          '') &&
                                  (valueOrDefault(
                                          currentUserDocument?.subscriptionType,
                                          '') !=
                                      'free')) {
                                return SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            11.0, 16.0, 11.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () async {
                                                          await queryAvatarModelRecordOnce()
                                                              .then(
                                                                (records) => _model
                                                                        .simpleSearchResults =
                                                                    TextSearch(
                                                                  records
                                                                      .map(
                                                                        (record) => TextSearchItem.fromTerms(
                                                                            record,
                                                                            [
                                                                              record.name
                                                                            ]),
                                                                      )
                                                                      .toList(),
                                                                )
                                                                        .search(_model
                                                                            .textController
                                                                            .text)
                                                                        .map((r) =>
                                                                            r.object)
                                                                        .toList(),
                                                              )
                                                              .onError((_,
                                                                      __) =>
                                                                  _model.simpleSearchResults =
                                                                      [])
                                                              .whenComplete(() =>
                                                                  safeSetState(
                                                                      () {}));
                                                        },
                                                      ),
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'wfqkthx3' /* Search historical figures... */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                        filled: true,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    1.0),
                                                        prefixIcon: Icon(
                                                          Icons.search_rounded,
                                                        ),
                                                        suffixIcon: _model
                                                                .textController!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .textController
                                                                      ?.clear();
                                                                  await queryAvatarModelRecordOnce()
                                                                      .then(
                                                                        (records) =>
                                                                            _model.simpleSearchResults =
                                                                                TextSearch(
                                                                          records
                                                                              .map(
                                                                                (record) => TextSearchItem.fromTerms(record, [
                                                                                  record.name
                                                                                ]),
                                                                              )
                                                                              .toList(),
                                                                        ).search(_model.textController.text).map((r) => r.object).toList(),
                                                                      )
                                                                      .onError((_,
                                                                              __) =>
                                                                          _model.simpleSearchResults =
                                                                              [])
                                                                      .whenComplete(() =>
                                                                          safeSetState(
                                                                              () {}));

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 22,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      minLines: 1,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 12.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (_model.textController.text ==
                                                  '') {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 0.0),
                                              child: SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '245h5x54' /* 🧠 Critical Thinkers 💭 */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: StreamBuilder<
                                                          List<
                                                              AvatarModelRecord>>(
                                                        stream:
                                                            queryAvatarModelRecord(
                                                          queryBuilder:
                                                              (avatarModelRecord) =>
                                                                  avatarModelRecord
                                                                      .where(
                                                                        'category',
                                                                        isEqualTo:
                                                                            'Critical Thinkers',
                                                                      )
                                                                      .orderBy(
                                                                          'name'),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 45.0,
                                                                height: 45.0,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 45.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<AvatarModelRecord>
                                                              listViewAvatarModelRecordList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                listViewAvatarModelRecordList
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    width: 8.0),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewAvatarModelRecord =
                                                                  listViewAvatarModelRecordList[
                                                                      listViewIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      ChatPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'charcter':
                                                                            serializeParam(
                                                                          listViewAvatarModelRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'charcter':
                                                                            listViewAvatarModelRecord,
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            82.0,
                                                                        height:
                                                                            82.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              listViewAvatarModelRecord.avatarImage,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        listViewAvatarModelRecord
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'rfxvk35n' /* 🙏 Religious Figures 🕌 */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: StreamBuilder<
                                                          List<
                                                              AvatarModelRecord>>(
                                                        stream:
                                                            queryAvatarModelRecord(
                                                          queryBuilder:
                                                              (avatarModelRecord) =>
                                                                  avatarModelRecord
                                                                      .where(
                                                                        'category',
                                                                        isEqualTo:
                                                                            'Religious Figures',
                                                                      )
                                                                      .orderBy(
                                                                          'name'),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 45.0,
                                                                height: 45.0,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 45.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<AvatarModelRecord>
                                                              listViewAvatarModelRecordList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                listViewAvatarModelRecordList
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    width: 8.0),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewAvatarModelRecord =
                                                                  listViewAvatarModelRecordList[
                                                                      listViewIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      ChatPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'charcter':
                                                                            serializeParam(
                                                                          listViewAvatarModelRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'charcter':
                                                                            listViewAvatarModelRecord,
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            82.0,
                                                                        height:
                                                                            82.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              listViewAvatarModelRecord.avatarImage,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        listViewAvatarModelRecord
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          's5wmfpif' /* 🎥 Cinema Legends ⭐ */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                AvatarModelRecord>>(
                                                          stream:
                                                              queryAvatarModelRecord(
                                                            queryBuilder:
                                                                (avatarModelRecord) =>
                                                                    avatarModelRecord
                                                                        .where(
                                                                          'category',
                                                                          isEqualTo:
                                                                              'Cinema Legends',
                                                                        )
                                                                        .orderBy(
                                                                            'name'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AvatarModelRecord>
                                                                listViewAvatarModelRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewAvatarModelRecordList
                                                                      .length,
                                                              separatorBuilder:
                                                                  (_, __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              8.0),
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewAvatarModelRecord =
                                                                    listViewAvatarModelRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ChatPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'charcter':
                                                                              serializeParam(
                                                                            listViewAvatarModelRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'charcter':
                                                                              listViewAvatarModelRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                listViewAvatarModelRecord.avatarImage,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewAvatarModelRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ax5zeg1l' /* ✨ Musical Idols 🎤 */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                AvatarModelRecord>>(
                                                          stream:
                                                              queryAvatarModelRecord(
                                                            queryBuilder:
                                                                (avatarModelRecord) =>
                                                                    avatarModelRecord
                                                                        .where(
                                                                          'category',
                                                                          isEqualTo:
                                                                              'Musical Idols',
                                                                        )
                                                                        .orderBy(
                                                                            'name'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AvatarModelRecord>
                                                                listViewAvatarModelRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewAvatarModelRecordList
                                                                      .length,
                                                              separatorBuilder:
                                                                  (_, __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              8.0),
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewAvatarModelRecord =
                                                                    listViewAvatarModelRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ChatPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'charcter':
                                                                              serializeParam(
                                                                            listViewAvatarModelRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'charcter':
                                                                              listViewAvatarModelRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                listViewAvatarModelRecord.avatarImage,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewAvatarModelRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'p45jn50b' /* 💵 Political Shapers 🏦 */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 100.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: StreamBuilder<
                                                          List<
                                                              AvatarModelRecord>>(
                                                        stream:
                                                            queryAvatarModelRecord(
                                                          queryBuilder:
                                                              (avatarModelRecord) =>
                                                                  avatarModelRecord
                                                                      .where(
                                                                        'category',
                                                                        isEqualTo:
                                                                            'Political Shapers',
                                                                      )
                                                                      .orderBy(
                                                                          'name'),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 45.0,
                                                                height: 45.0,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 45.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<AvatarModelRecord>
                                                              listViewAvatarModelRecordList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                listViewAvatarModelRecordList
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    width: 8.0),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewAvatarModelRecord =
                                                                  listViewAvatarModelRecordList[
                                                                      listViewIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      ChatPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'charcter':
                                                                            serializeParam(
                                                                          listViewAvatarModelRecord,
                                                                          ParamType
                                                                              .Document,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        'charcter':
                                                                            listViewAvatarModelRecord,
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            82.0,
                                                                        height:
                                                                            82.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              listViewAvatarModelRecord.avatarImage,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        listViewAvatarModelRecord
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Nunito Sans',
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'zdk6ifv8' /* 🏰 Strategic Leaders ⚔️ */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                AvatarModelRecord>>(
                                                          stream:
                                                              queryAvatarModelRecord(
                                                            queryBuilder:
                                                                (avatarModelRecord) =>
                                                                    avatarModelRecord
                                                                        .where(
                                                                          'category',
                                                                          isEqualTo:
                                                                              'Strategic Leaders',
                                                                        )
                                                                        .orderBy(
                                                                            'name'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AvatarModelRecord>
                                                                listViewAvatarModelRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewAvatarModelRecordList
                                                                      .length,
                                                              separatorBuilder:
                                                                  (_, __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              8.0),
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewAvatarModelRecord =
                                                                    listViewAvatarModelRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ChatPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'charcter':
                                                                              serializeParam(
                                                                            listViewAvatarModelRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'charcter':
                                                                              listViewAvatarModelRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                listViewAvatarModelRecord.avatarImage,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewAvatarModelRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ygp2osxw' /* ✒️ Iconic Writers 📜 */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                AvatarModelRecord>>(
                                                          stream:
                                                              queryAvatarModelRecord(
                                                            queryBuilder:
                                                                (avatarModelRecord) =>
                                                                    avatarModelRecord
                                                                        .where(
                                                                          'category',
                                                                          isEqualTo:
                                                                              'Iconic Writers',
                                                                        )
                                                                        .orderBy(
                                                                            'name'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AvatarModelRecord>
                                                                listViewAvatarModelRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewAvatarModelRecordList
                                                                      .length,
                                                              separatorBuilder:
                                                                  (_, __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              8.0),
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewAvatarModelRecord =
                                                                    listViewAvatarModelRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ChatPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'charcter':
                                                                              serializeParam(
                                                                            listViewAvatarModelRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'charcter':
                                                                              listViewAvatarModelRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                listViewAvatarModelRecord.avatarImage,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewAvatarModelRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '57ny9bf3' /* 🧪 Scientific Pioneers 🔭 */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                AvatarModelRecord>>(
                                                          stream:
                                                              queryAvatarModelRecord(
                                                            queryBuilder:
                                                                (avatarModelRecord) =>
                                                                    avatarModelRecord
                                                                        .where(
                                                                          'category',
                                                                          isEqualTo:
                                                                              'Scientific Pioneers',
                                                                        )
                                                                        .orderBy(
                                                                            'name'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AvatarModelRecord>
                                                                listViewAvatarModelRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewAvatarModelRecordList
                                                                      .length,
                                                              separatorBuilder:
                                                                  (_, __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              8.0),
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewAvatarModelRecord =
                                                                    listViewAvatarModelRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ChatPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'charcter':
                                                                              serializeParam(
                                                                            listViewAvatarModelRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'charcter':
                                                                              listViewAvatarModelRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                listViewAvatarModelRecord.avatarImage,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewAvatarModelRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '5wje35lm' /* 👁️ Visionary Catalysts 🕰️ */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                AvatarModelRecord>>(
                                                          stream:
                                                              queryAvatarModelRecord(
                                                            queryBuilder:
                                                                (avatarModelRecord) =>
                                                                    avatarModelRecord
                                                                        .where(
                                                                          'category',
                                                                          isEqualTo:
                                                                              'Visionary Catalysts',
                                                                        )
                                                                        .orderBy(
                                                                            'name'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AvatarModelRecord>
                                                                listViewAvatarModelRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewAvatarModelRecordList
                                                                      .length,
                                                              separatorBuilder:
                                                                  (_, __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              8.0),
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewAvatarModelRecord =
                                                                    listViewAvatarModelRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ChatPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'charcter':
                                                                              serializeParam(
                                                                            listViewAvatarModelRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'charcter':
                                                                              listViewAvatarModelRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                listViewAvatarModelRecord.avatarImage,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewAvatarModelRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'kj3io6qv' /* 🎨 Influential Artists 🖌️ */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                AvatarModelRecord>>(
                                                          stream:
                                                              queryAvatarModelRecord(
                                                            queryBuilder:
                                                                (avatarModelRecord) =>
                                                                    avatarModelRecord
                                                                        .where(
                                                                          'category',
                                                                          isEqualTo:
                                                                              'Influential Artists',
                                                                        )
                                                                        .orderBy(
                                                                            'name'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AvatarModelRecord>
                                                                listViewAvatarModelRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewAvatarModelRecordList
                                                                      .length,
                                                              separatorBuilder:
                                                                  (_, __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              8.0),
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewAvatarModelRecord =
                                                                    listViewAvatarModelRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ChatPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'charcter':
                                                                              serializeParam(
                                                                            listViewAvatarModelRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'charcter':
                                                                              listViewAvatarModelRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                listViewAvatarModelRecord.avatarImage,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewAvatarModelRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'cz0m0gi9' /* ✊ Social Reformers 🏳️ */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nunito Sans',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: 0.7,
                                                      child: Divider(
                                                        thickness: 0.5,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        height: 102.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<
                                                                AvatarModelRecord>>(
                                                          stream:
                                                              queryAvatarModelRecord(
                                                            queryBuilder:
                                                                (avatarModelRecord) =>
                                                                    avatarModelRecord
                                                                        .where(
                                                                          'category',
                                                                          isEqualTo:
                                                                              'Social Reformers',
                                                                        )
                                                                        .orderBy(
                                                                            'name'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 45.0,
                                                                  height: 45.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 45.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<AvatarModelRecord>
                                                                listViewAvatarModelRecordList =
                                                                snapshot.data!;

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  listViewAvatarModelRecordList
                                                                      .length,
                                                              separatorBuilder:
                                                                  (_, __) =>
                                                                      SizedBox(
                                                                          width:
                                                                              8.0),
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewAvatarModelRecord =
                                                                    listViewAvatarModelRecordList[
                                                                        listViewIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ChatPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'charcter':
                                                                              serializeParam(
                                                                            listViewAvatarModelRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'charcter':
                                                                              listViewAvatarModelRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                listViewAvatarModelRecord.avatarImage,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          listViewAvatarModelRecord
                                                                              .name,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Nunito Sans',
                                                                                fontSize: 11.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final searchResult = _model
                                                            .simpleSearchResults
                                                            .toList();

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              searchResult
                                                                  .length,
                                                          itemBuilder: (context,
                                                              searchResultIndex) {
                                                            final searchResultItem =
                                                                searchResult[
                                                                    searchResultIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          6.0),
                                                              child: StreamBuilder<
                                                                  AvatarModelRecord>(
                                                                stream: AvatarModelRecord
                                                                    .getDocument(
                                                                        searchResultItem
                                                                            .reference),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            45.0,
                                                                        height:
                                                                            45.0,
                                                                        child:
                                                                            SpinKitPulse(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              45.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  final bgColorAvatarModelRecord =
                                                                      snapshot
                                                                          .data!;

                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        ChatPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'charcter':
                                                                              serializeParam(
                                                                            bgColorAvatarModelRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'charcter':
                                                                              bgColorAvatarModelRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        Material(
                                                                      color: Colors
                                                                          .transparent,
                                                                      elevation:
                                                                          2.0,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 42.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  bgColorAvatarModelRecord.avatarImage,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                      child: Text(
                                                                                        bgColorAvatarModelRecord.name,
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 18.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return wrapWithModel(
                                  model: _model.paywallPageModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: PaywallPageWidget(),
                                );
                              }
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:
                                        StreamBuilder<List<RecentChatsRecord>>(
                                      stream: queryRecentChatsRecord(
                                        queryBuilder: (recentChatsRecord) =>
                                            recentChatsRecord
                                                .where(
                                                  'uid',
                                                  isEqualTo: currentUserUid,
                                                )
                                                .orderBy('timeStamp',
                                                    descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 45.0,
                                              height: 45.0,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 45.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<RecentChatsRecord>
                                            listViewRecentChatsRecordList =
                                            snapshot.data!;
                                        if (listViewRecentChatsRecordList
                                            .isEmpty) {
                                          return EmptyRecentChatsWidget();
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewRecentChatsRecordList
                                                  .length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewRecentChatsRecord =
                                                listViewRecentChatsRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
                                              child: StreamBuilder<
                                                  AvatarModelRecord>(
                                                stream: AvatarModelRecord
                                                    .getDocument(
                                                        listViewRecentChatsRecord
                                                            .avatarRef!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 45.0,
                                                        height: 45.0,
                                                        child: SpinKitPulse(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 45.0,
                                                        ),
                                                      ),
                                                    );
                                                  }

                                                  final bgColorAvatarModelRecord =
                                                      snapshot.data!;

                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        ChatPageWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'charcter':
                                                              serializeParam(
                                                            bgColorAvatarModelRecord,
                                                            ParamType.Document,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'charcter':
                                                              bgColorAvatarModelRecord,
                                                        },
                                                      );
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 2.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(28.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      28.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      8.0,
                                                                      10.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                child:
                                                                    Container(
                                                                  width: 46.0,
                                                                  height: 46.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    bgColorAvatarModelRecord
                                                                        .avatarImage,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        bgColorAvatarModelRecord
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 17.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await listViewRecentChatsRecord
                                                                            .reference
                                                                            .delete();

                                                                        FFAppState()
                                                                            .update(() {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .delete_forever,
                                                                        color: Color(
                                                                            0xFFF0190A),
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.appSettingController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
