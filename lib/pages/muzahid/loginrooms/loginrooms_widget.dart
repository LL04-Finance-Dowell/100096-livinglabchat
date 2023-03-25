import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loginrooms_model.dart';
export 'loginrooms_model.dart';

class LoginroomsWidget extends StatefulWidget {
  const LoginroomsWidget({Key? key}) : super(key: key);

  @override
  _LoginroomsWidgetState createState() => _LoginroomsWidgetState();
}

class _LoginroomsWidgetState extends State<LoginroomsWidget> {
  late LoginroomsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginroomsModel());
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
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Login Rooms',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: InkWell(
              onTap: () async {
                context.pushNamed('LogedInUserProfile');
              },
              child: Icon(
                Icons.location_history,
                color: Colors.black,
                size: 35.0,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter ??=
                            Completer<ApiCallResponse>()
                              ..complete(ProductslistCall.call()))
                        .future,
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitFadingCircle(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      final dropDownProductslistResponse = snapshot.data!;
                      return FlutterFlowDropDown<String>(
                        controller: _model.dropDownController ??=
                            FormFieldController<String>(null),
                        options: (getJsonField(
                          dropDownProductslistResponse.jsonBody,
                          r'''$.product_list''',
                        ) as List)
                            .map<String>((s) => s.toString())
                            .toList()!
                            .toList(),
                        onChanged: (val) async {
                          setState(() => _model.dropDownValue = val);
                          _model.apiResultvzi =
                              await ProductwiseroomlistCall.call(
                            productName: _model.dropDownValue,
                          );
                          if ((_model.apiResultvzi?.succeeded ?? true)) {
                            setState(() {
                              FFAppState().roomlistvar = [];
                            });
                            setState(() {
                              FFAppState().roomlistvar =
                                  ProductwiseroomlistCall.allrooms(
                                (_model.apiResultvzi?.jsonBody ?? ''),
                              )!
                                      .toList();
                            });
                          }

                          setState(() {});
                        },
                        width: 180.0,
                        height: 50.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                ),
                        hintText: 'Please select Products...',
                        fillColor: Colors.white,
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 10.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 4.0, 12.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: false,
                      );
                    },
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) {
                          final roomlistvariable =
                              FFAppState().roomlistvar.toList();
                          return RefreshIndicator(
                            onRefresh: () async {
                              setState(() => _model.apiRequestCompleter = null);
                              await _model.waitForApiRequestCompleted();
                            },
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: roomlistvariable.length,
                              itemBuilder: (context, roomlistvariableIndex) {
                                final roomlistvariableItem =
                                    roomlistvariable[roomlistvariableIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 20.0, 10.0, 0.0),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                        color: Color(0xFFC2CDDC),
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'ChatPage',
                                          queryParams: {
                                            'roomid': serializeParam(
                                              getJsonField(
                                                roomlistvariableItem,
                                                r'''$.room_id''',
                                              ),
                                              ParamType.int,
                                            ),
                                            'sessionId': serializeParam(
                                              getJsonField(
                                                roomlistvariableItem,
                                                r'''$.room_name''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 20.0, 10.0),
                                            child: InkWell(
                                              onTap: () async {
                                                context
                                                    .pushNamed('profilepage');
                                              },
                                              child: Container(
                                                width: 80.0,
                                                height: 80.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  'https://chat.dowellstore.org/wp-content/uploads/2023/02/chat-avatar-01-1-300x300.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  roomlistvariableItem,
                                                  r'''$.room_name''',
                                                ).toString(),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Text(
                                                getJsonField(
                                                  roomlistvariableItem,
                                                  r'''$.company''',
                                                ).toString(),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 10.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
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
