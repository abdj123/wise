import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_recent_chats_model.dart';
export 'empty_recent_chats_model.dart';

class EmptyRecentChatsWidget extends StatefulWidget {
  const EmptyRecentChatsWidget({super.key});

  @override
  State<EmptyRecentChatsWidget> createState() => _EmptyRecentChatsWidgetState();
}

class _EmptyRecentChatsWidgetState extends State<EmptyRecentChatsWidget> {
  late EmptyRecentChatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyRecentChatsModel());

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
      width: 610.0,
      height: 363.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_outlined,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 54.0,
          ),
          Text(
            FFLocalizations.of(context).getText(
              'ingvj2qp' /* No Recent Chats! */,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Nunito Sans',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
