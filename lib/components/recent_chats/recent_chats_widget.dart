import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_recent_chats/empty_recent_chats_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'recent_chats_model.dart';
export 'recent_chats_model.dart';

class RecentChatsWidget extends StatefulWidget {
  const RecentChatsWidget({super.key});

  @override
  State<RecentChatsWidget> createState() => _RecentChatsWidgetState();
}

class _RecentChatsWidgetState extends State<RecentChatsWidget> {
  late RecentChatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecentChatsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.ress = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord.whereArrayContainsAny(
            'RecentChats', (currentUserDocument?.recentChats.toList() ?? [])),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 1.0, 0.0),
      child: SafeArea(
        child: Container(
          width: 270.0,
          height: double.infinity,
          constraints: BoxConstraints(
            maxWidth: 300.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFE5E7EB),
                offset: Offset(
                  1.0,
                  0.0,
                ),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.chat_rounded,
                        color: Color(0xFF6F61EF),
                        size: 32.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'jxftfl9m' /* Recent Chats */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(AiCharactersWidget.routeName);

                      FFAppState().chatHistory = [];
                      FFAppState().currentCovnersation = [];
                      safeSetState(() {});
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outlined,
                              color: Color(0xFF606A85),
                              size: 28.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'b8ghwb2d' /* New chat */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'b0apxlui' /* Chats */,
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF606A85),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                    child: StreamBuilder<List<RecentChatsRecord>>(
                      stream: queryRecentChatsRecord(
                        queryBuilder: (recentChatsRecord) => recentChatsRecord
                            .where(
                              'uid',
                              isEqualTo: currentUserUid,
                            )
                            .orderBy('timeStamp', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 45.0,
                              height: 45.0,
                              child: SpinKitPulse(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 45.0,
                              ),
                            ),
                          );
                        }
                        List<RecentChatsRecord> listViewRecentChatsRecordList =
                            snapshot.data!;
                        if (listViewRecentChatsRecordList.isEmpty) {
                          return EmptyRecentChatsWidget();
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewRecentChatsRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewRecentChatsRecord =
                                listViewRecentChatsRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 6.0),
                              child: StreamBuilder<AvatarModelRecord>(
                                stream: AvatarModelRecord.getDocument(
                                    listViewRecentChatsRecord.avatarRef!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 45.0,
                                        height: 45.0,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 45.0,
                                        ),
                                      ),
                                    );
                                  }

                                  final bgColorAvatarModelRecord =
                                      snapshot.data!;

                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        ChatPageWidget.routeName,
                                        queryParameters: {
                                          'charcter': serializeParam(
                                            bgColorAvatarModelRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'charcter': bgColorAvatarModelRecord,
                                        },
                                      );
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 1.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(17.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(17.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 35.0,
                                                height: 35.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  bgColorAvatarModelRecord
                                                      .avatarImage,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: Text(
                                                        bgColorAvatarModelRecord
                                                            .name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                                                          1.0, 0.0),
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
                                                      await listViewRecentChatsRecord
                                                          .reference
                                                          .delete();

                                                      FFAppState()
                                                          .update(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.delete_forever,
                                                      color: Color(0xFFF0190A),
                                                      size: 34.0,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
