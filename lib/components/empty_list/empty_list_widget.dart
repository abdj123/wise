import '/backend/backend.dart';
import '/components/about_ai/about_ai_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'empty_list_model.dart';
export 'empty_list_model.dart';

class EmptyListWidget extends StatefulWidget {
  const EmptyListWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.model,
  });

  final String? imagePath;
  final String? name;
  final String? description;
  final AvatarModelRecord? model;

  @override
  State<EmptyListWidget> createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyListWidget> {
  late EmptyListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.5,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
            child: RichText(
              textScaler: MediaQuery.of(context).textScaler,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      'hd53pom8' /* Hi, I'm  */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  TextSpan(
                    text: widget.name!,
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  )
                ],
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          Builder(
            builder: (context) => Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          child: AboutAiWidget(
                            character: widget.model!,
                            fromHome: false,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    widget.imagePath!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Builder(
            builder: (context) => FFButtonWidget(
              onPressed: () async {
                await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.7,
                        child: AboutAiWidget(
                          character: widget.model!,
                          fromHome: false,
                        ),
                      ),
                    );
                  },
                );
              },
              text: FFLocalizations.of(context).getText(
                'tv3r24i3' /* See profile */,
              ),
              icon: Icon(
                Icons.location_history,
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 15.0,
              ),
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
