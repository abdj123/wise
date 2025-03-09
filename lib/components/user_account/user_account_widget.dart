import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'user_account_model.dart';
export 'user_account_model.dart';

class UserAccountWidget extends StatefulWidget {
  const UserAccountWidget({super.key});

  @override
  State<UserAccountWidget> createState() => _UserAccountWidgetState();
}

class _UserAccountWidgetState extends State<UserAccountWidget> {
  late UserAccountModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserAccountModel());

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
      width: MediaQuery.sizeOf(context).width * 0.75,
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'm2i2fzrc' /* Are you sure you want to delet... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'p0y0a940' /* All your data will be permanen... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                'uinal84v' /* You will lose access to all yo... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    letterSpacing: 0.0,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      '9sliogc9' /* Cancel */,
                    ),
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Nunito Sans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await currentUserReference!.delete();
                      await authManager.deleteUser(context);

                      context.goNamed(AuthPageWidget.routeName);
                    },
                    text: FFLocalizations.of(context).getText(
                      'zzufz7g4' /* Delete */,
                    ),
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).error,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Nunito Sans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
