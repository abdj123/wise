import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'app_settings_model.dart';
export 'app_settings_model.dart';

class AppSettingsWidget extends StatefulWidget {
  const AppSettingsWidget({super.key});

  @override
  State<AppSettingsWidget> createState() => _AppSettingsWidgetState();
}

class _AppSettingsWidgetState extends State<AppSettingsWidget> {
  late AppSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppSettingsModel());

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
      width: MediaQuery.sizeOf(context).width * 0.5,
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                '5i6s9bco' /* App Settings */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nunito Sans',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'qi7lfnrq' /* Tap here to access the setting... */,
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nunito Sans',
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
