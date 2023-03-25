import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.resopnse,
  }) : super(key: key);

  final dynamic resopnse;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16.0,
        child: Align(
          alignment: AlignmentDirectional(0.05, -0.95),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/717/600',
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          getJsonField(
                            FFAppState().LoggedInUser.first,
                            r'''$.username''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Text(
                          getJsonField(
                            FFAppState().LoggedInUser.first,
                            r'''$.role''',
                          ).toString(),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ],
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('LogedInUserProfile');
                  },
                  text: 'My Profile\n',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'OtherPersLogedInUserProfileCopy',
                      queryParams: {
                        'userData': serializeParam(
                          FFAppState().LoggedInUser.first,
                          ParamType.JSON,
                        ),
                        'userId': serializeParam(
                          getJsonField(
                            FFAppState().LoggedInUser.first,
                            r'''$.userId''',
                          ).toString(),
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Others Person Profile',
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          'DoWell',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () async {
                  context.pushNamed('Loginrooms');
                },
                child: Text(
                  'Skip To Content',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              Image.network(
                'https://www.digitalq.dowellstore.org/wp-content/uploads/2022/09/artistic-logo-300x210.png',
                width: 392.5,
                height: 286.7,
                fit: BoxFit.cover,
              ),
              Text(
                'DoWell Cafe',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              InkWell(
                onTap: () async {
                  context.pushNamed('userList');
                },
                child: Text(
                  'Users',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              InkWell(
                onTap: () async {
                  context.pushNamed('product_List');
                },
                child: Text(
                  'Products',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
              InkWell(
                onTap: () async {
                  context.pushNamed('Loginrooms');
                },
                child: Text(
                  'rooms',
                  style: FlutterFlowTheme.of(context).bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
