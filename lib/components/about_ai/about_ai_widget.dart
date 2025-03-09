import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'about_ai_model.dart';
export 'about_ai_model.dart';

class AboutAiWidget extends StatefulWidget {
  const AboutAiWidget({
    super.key,
    required this.character,
    required this.fromHome,
  });

  final AvatarModelRecord? character;
  final bool? fromHome;

  @override
  State<AboutAiWidget> createState() => _AboutAiWidgetState();
}

class _AboutAiWidgetState extends State<AboutAiWidget> {
  late AboutAiModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutAiModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              color: Color(0x2F1D2429),
              offset: Offset(
                0.0,
                3.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(17.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 35.0,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                Container(
                  width: 110.0,
                  height: 110.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    widget.character!.avatarImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          widget.character!.name,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.3,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AutoSizeText(
                          widget.character!.role,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nunito Sans',
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: AutoSizeText(
                          widget.character!.description,
                          textAlign: TextAlign.justify,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Nunito Sans',
                                    fontSize: 13.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.fromHome ?? true)
                        FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              ChatPageWidget.routeName,
                              queryParameters: {
                                'charcter': serializeParam(
                                  widget.character,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'charcter': widget.character,
                              },
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            'vyiqldmh' /* Let's Chat */,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).accent4,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(16.0),
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
  }
}
