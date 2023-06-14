import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'top_up_model.dart';
export 'top_up_model.dart';

class TopUpWidget extends StatefulWidget {
  const TopUpWidget({Key? key}) : super(key: key);

  @override
  _TopUpWidgetState createState() => _TopUpWidgetState();
}

class _TopUpWidgetState extends State<TopUpWidget> {
  late TopUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopUpModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textController?.text = FFLocalizations.of(context).getText(
            '3acuo8zv' /* $247 */,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pop();
            },
            child: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).grayLight,
              size: 32.0,
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '40hoiexc' /* Payment */,
            ),
            style: FlutterFlowTheme.of(context).headlineSmall,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '1qcpq1vi' /* Below are a summary of your in... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'pylvyl0c' /* Enter the amount of top up */,
                          ),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Urbanist',
                                    color: Color(0xFF424242),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Container(
                          width: 380.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: Color(0xFF22BB9C),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            child: TextFormField(
                              controller: _model.textController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: FFLocalizations.of(context).getText(
                                  'wg5430yy' /* [Some hint text...] */,
                                ),
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF22BB9C),
                                    fontWeight: FontWeight.normal,
                                  ),
                              textAlign: TextAlign.center,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'jb9bvcgq' /* $10 */,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF22BB9C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF22BB9C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'u3yzh6u1' /* $20 */,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF22BB9C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF22BB9C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'qnq5j8mx' /* $50 */,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF22BB9C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF22BB9C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'sy8pnda2' /* $100 */,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF22BB9C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF22BB9C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                '4enpclpj' /* $200 */,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF22BB9C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF22BB9C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'x5jzv4nn' /* $250 */,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF22BB9C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF22BB9C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'rh5g9kti' /* $500 */,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF22BB9C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF22BB9C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'yig4hlcn' /* $750 */,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF22BB9C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF22BB9C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'jlvahqt0' /* $1,000 */,
                              ),
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Urbanist',
                                      color: Color(0xFF22BB9C),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFF22BB9C),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('PinC');
                  },
                  text: FFLocalizations.of(context).getText(
                    'y990igoy' /* Continue */,
                  ),
                  options: FFButtonOptions(
                    width: 190.0,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend',
                          color: FlutterFlowTheme.of(context).textColor,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
