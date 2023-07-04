import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:contabilidade/flutter_flow/flutter_flow_widgets.dart';
import 'package:contabilidade/userdetails/DATA/balanco.dart';
import 'package:contabilidade/userdetails/func/func.dart';
import 'package:contabilidade/userdetails/sumary.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'userdetails_model.dart';
export 'userdetails_model.dart';

const List<DropdownMenuItem<String>> paymentOptions = [
  DropdownMenuItem(
    value: '2023',
    child: Text('2023'),
  ),
  DropdownMenuItem(
    value: '2022',
    child: Text('2022'),
  ),
];

class UserdetailsWidget extends StatefulWidget {
  const UserdetailsWidget({Key? key}) : super(key: key);

  @override
  _UserdetailsWidgetState createState() => _UserdetailsWidgetState();
}

class _UserdetailsWidgetState extends State<UserdetailsWidget>
    with TickerProviderStateMixin {
  late UserdetailsModel _model;
  // create color for variables
  var corAtivoCirc = Color.fromARGB(255, 74, 56, 236);
  var corPassivoCirc = Color(0xFF06D6A0);

  var corAtivoNCirc = Color(0xFFFFD166);
  var corPassivoNCirc = Color(0xFF118AB2);
  var corPL = Color(0xFFE55934);
  bool showshowAnalises = false;
  bool showFormulario1 = true;
  bool showFormulario2 = false;
  bool showconcluirf1 = true;
  bool showconcluirf2 = false;
  bool showgerar = false;
  bool showEdit2023 = false;
  bool showEdit2022 = false;

  List listacores = [
    Color.fromARGB(255, 74, 56, 236),
    Color.fromARGB(255, 214, 82, 6),
    Color.fromARGB(255, 105, 255, 102),
    Color.fromARGB(255, 0, 51, 255),
    Color.fromARGB(250, 233, 0, 0),
  ];

  List<ModelItems> listaAtivoCirculante2022 = [];
  //
  List<ModelItems> listaAtivoCirculante2023 = [];
  //
  List<ModelItems> listaAtivoNaoCirculante2022 = [];
  //
  List<ModelItems> listaAtivoNaoCirculante2023 = [];
  //
  List<ModelItems> listaPassivoCirculante2022 = [];
  //
  List<ModelItems> listaPassivoCirculante2023 = [];
  //
  List<ModelItems> listaPassivoNaoirculante2022 = [];
  //
  List<ModelItems> listaPassivoNaoirculante2023 = [];
  //
  List<ModelItems> listaPl2022 = [];
  //
  List<ModelItems> listaPl203 = [];
  //
  List listaIndices2022 = [];
  List listaIndices2023 = [];

  List listaVariacaoAnos = [];

  bool _carregando = true;
  bool visibilidadebalanco22 = true;

  bool visibilidadebalanco23 = false;
  bool visibilidadeAtivoCirculanteList = false;
  bool visibilidadeAtivoNaoCirculanteList = false;
  bool visibilidadePassivoCirculanteList = false;
  bool visibilidadePassivoNaoCirculanteList = false;
  bool visibilidadePLList = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedYear;
  List<PieData> pieChartData = [
    // Adicione mais dados conforme necessário
  ];
  List<PieData> pieChartData23 = [
    // Adicione mais dados conforme necessário
  ];
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 3.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  bool showIndicadoresRent = false;
  bool showIndicadoresLiquidez = false;
  bool showIndicadoresEndividamento = false;
  bool showIndicadoresdeEst = false;

  Future setColorPieChar() async {
    List<PieData> list = [
      PieData('Ativo Circulante', 25.0, corAtivoCirc),
      PieData('Ativo não circulante', 15, corAtivoNCirc),
      PieData('Passivo circulante', 13.6, corPassivoCirc),
      PieData('Passivo não circulante', 19.3, corPassivoNCirc),
      PieData('Patrimonio Liquido', 34, corPL),
      // Adicione mais dados conforme necessário
    ];
    pieChartData.addAll(list);
  }

  Future setColorPieChar23() async {
    List<PieData> list = [
      PieData('Ativo Circulante', 20.0, corAtivoCirc),
      PieData('Ativo não circulante', 11, corAtivoNCirc),
      PieData('Passivo circulante', 13.0, corPassivoCirc),
      PieData('Passivo não circulante', 20.3, corPassivoNCirc),
      PieData('Patrimonio Liquido', 29, corPL),
      // Adicione mais dados conforme necessário5,051,969
    ];
    pieChartData23.addAll(list);
  }

  Future setLists() async {
    listaAtivoCirculante2022 =
        await UserDetailsFunction(context).getListAtivoCirculante2022();
    listaAtivoCirculante2023 =
        await UserDetailsFunction(context).getListAtivoCirculante2023();
    listaAtivoNaoCirculante2022 =
        await UserDetailsFunction(context).getListAtivoNaoCirculante2022();
    listaAtivoNaoCirculante2023 =
        await UserDetailsFunction(context).getListAtivoNaoCirculante2023();
    listaPassivoCirculante2022 =
        await UserDetailsFunction(context).getListPassivoCirculante2022();
    listaPassivoCirculante2023 =
        await UserDetailsFunction(context).getListPassivoCirculante2023();
    listaPassivoNaoirculante2022 =
        await UserDetailsFunction(context).getListPassivoNaoCirculante2022();
    listaPassivoNaoirculante2023 =
        await UserDetailsFunction(context).getListPassivoNaoCirculante2023();
    listaPl2022 = await UserDetailsFunction(context).getListpL2O22();
    listaPl203 = await UserDetailsFunction(context).getListpL2O23();

    if (listaAtivoCirculante2022.isNotEmpty ||
        listaAtivoCirculante2023.isNotEmpty ||
        listaAtivoNaoCirculante2022.isNotEmpty ||
        listaAtivoNaoCirculante2023.isNotEmpty ||
        listaPassivoCirculante2022.isNotEmpty ||
        listaPassivoCirculante2023.isNotEmpty ||
        listaPassivoNaoirculante2022.isNotEmpty ||
        listaPassivoNaoirculante2023.isNotEmpty ||
        listaPl2022.isNotEmpty ||
        listaPl203.isNotEmpty) {
      setState(() {
        _carregando = false;
      });
    }

    print(
        "first : ${listaAtivoCirculante2022.length}\n ${listaAtivoCirculante2022[3].title}");
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserdetailsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    setColorPieChar();
    setColorPieChar23();
    setLists();
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
        body: _carregando
            ?
            // CircularProgressIndicator()
            Container(
                color: FlutterFlowTheme.of(context).primaryBackground,
                child: DefaultTextStyle(
                  style: FlutterFlowTheme.of(context).headlineLarge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/6/65/Logo_camil.png',
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 20.0, height: 100.0),
                          AnimatedTextKit(
                            totalRepeatCount: 1,
                            animatedTexts: [
                              RotateAnimatedText('Aguarde...',
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .copyWith(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      )),
                              RotateAnimatedText('Estou processando seus dados',
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .copyWith(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      )),
                              RotateAnimatedText('Finalizando...',
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .copyWith(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      )),
                              RotateAnimatedText('Pronto!',
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .copyWith(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      )),
                            ],
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 400.0,
                              child: Stack(
                                children: [
                                  Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/6/65/Logo_camil.png',
                                    width: double.infinity,
                                    height: 385.0,
                                    fit: BoxFit.fitWidth,
                                  ).animateOnPageLoad(animationsMap[
                                      'imageOnPageLoadAnimation']!),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 4.0,
                                                sigmaY: 4.0,
                                              ),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 90.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x63F4F4F4),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 90.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x06FFFFFF),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 5.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Camil',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .displaySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFF021C27),
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .star_rounded,
                                                                  color: Color(
                                                                      0xFFFDB861),
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                '5',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFF021C27),
                                                                      fontSize:
                                                                          15.0,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  height: 25.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF021C27),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'DASHBOARD',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ],
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
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10.0,
                                              color: Color(0x33C8C8C8),
                                              offset: Offset(0.0, 5.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                    'Balanço atual',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              1.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  )),
                                                                ),
                                                                Container(
                                                                  height: 25.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x82BBF7D0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Ano 23',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color.fromARGB(255, 0, 0, 0),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 40.0,
                                                              child:
                                                                  VerticalDivider(
                                                                width: 30.0,
                                                                thickness: 1.0,
                                                                indent: 1.0,
                                                                endIndent: 1.0,
                                                                color: Color(
                                                                    0xFFC0C0C0),
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                    'DEPARTAMENTO',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              1.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  )),
                                                                ),
                                                                Container(
                                                                  height: 25.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x81C7D2FE),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Text(
                                                                          'Forne Alimentício',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color.fromARGB(255, 4, 15, 56),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            // Padding(
                                                            //   padding:
                                                            //       EdgeInsetsDirectional
                                                            //           .fromSTEB(
                                                            //               30.0,
                                                            //               0.0,
                                                            //               0.0,
                                                            //               0.0),
                                                            //   child: Row(
                                                            //     mainAxisSize:
                                                            //         MainAxisSize
                                                            //             .max,
                                                            //     children: [
                                                            //       Column(
                                                            //         mainAxisSize:
                                                            //             MainAxisSize
                                                            //                 .max,
                                                            //         children: [
                                                            //           FlutterFlowIconButton(
                                                            //             borderColor:
                                                            //                 Colors.transparent,
                                                            //             borderRadius:
                                                            //                 30.0,
                                                            //             borderWidth:
                                                            //                 1.0,
                                                            //             buttonSize:
                                                            //                 48.0,
                                                            //             icon:
                                                            //                 Icon(
                                                            //               Icons
                                                            //                   .file_present,
                                                            //               color:
                                                            //                   Color(0xFF487CF6),
                                                            //               size:
                                                            //                   30.0,
                                                            //             ),
                                                            //             onPressed:
                                                            //                 () {
                                                            //               print(
                                                            //                   'IconButton pressed ...');
                                                            //             },
                                                            //           ),
                                                            //           Text(
                                                            //             'PDF',
                                                            //             style: FlutterFlowTheme.of(context)
                                                            //                 .bodyMedium
                                                            //                 .override(
                                                            //                   fontFamily: 'Montserrat',
                                                            //                   color: Color(0xFF487CF6),
                                                            //                 ),
                                                            //           ),
                                                            //         ],
                                                            //       ),
                                                            //     ],
                                                            //   ),
                                                            // ),
                                                          ],
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
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // analises

                            // allanalises(),
                            // comparativo
                            comparativo(context),

                            // balancoPiechart(),

                            // contas
                            variacao(),

                            contas(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget allanalises() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              showshowAnalises = !showshowAnalises;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              children: [
                Text(
                  showshowAnalises ? "Ver menos" : "Ver todas",
                  style: FlutterFlowTheme.of(context)
                      .bodyMedium
                      .copyWith(color: FlutterFlowTheme.of(context).primary),
                ),
              ],
            ),
          ),
        ),
        analises(),
      ],
    );
  }

  Widget rowLinePercent(color, title, percent, textpercent) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: FlutterFlowTheme.of(context).bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              percent: percent,
              width: MediaQuery.sizeOf(context).width * 0.08,
              lineHeight: 15.0,
              animation: true,
              progressColor: color,
              backgroundColor: Color(0xFFF1F4F8),
              barRadius: Radius.circular(50.0),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
            child: SelectionArea(
                child: Text(
              textpercent,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF487CF6),
                    fontSize: 12.0,
                  ),
            )),
          ),
        ),
      ],
    );
  }

  Widget rowLinePercent2(color, title, percent, textpercent) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: FlutterFlowTheme.of(context).bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            LinearPercentIndicator(
              percent: percent,
              width: MediaQuery.sizeOf(context).width * 0.5,
              lineHeight: 15.0,
              animation: true,
              progressColor: color,
              backgroundColor: Color(0xFFF1F4F8),
              barRadius: Radius.circular(50.0),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
            child: SelectionArea(
                child: Text(
              textpercent,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: Color(0xFF487CF6),
                    fontSize: 12.0,
                  ),
            )),
          ),
        ),
      ],
    );
  }

  Widget ano2022() {
    return Column(
      children: [
        Visibility(
          visible: showEdit2022,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: FlutterFlowTheme.of(context).success,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Ano 2022",
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                IconButton(
                    onPressed: () {
                      if (showEdit2023) {
                        setState(() {
                          showFormulario1 = true;
                          showFormulario2 = false;
                          showconcluirf1 = true;
                          showEdit2022 = false;
                          showgerar = false;
                        });
                      } else {
                        setState(() {
                          showFormulario1 = true;
                          showFormulario2 = false;
                          showconcluirf1 = true;
                          showEdit2022 = false;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.edit,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ))
              ],
            ),
          ),
        ),
        Visibility(
          visible: showFormulario1,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.15),
                child: SelectionArea(
                    child: Text(
                  'Insira os dados do ano de 2022',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                      ),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              FFButtonWidget(
                onPressed: () async {
                  setState(() {
                    _carregando = true;
                  });

                  await Future.delayed(Duration(seconds: 3));

                  setState(() {
                    controllerAtivoCirculante.text = "4,829,110.00";
                    controllerAtivoNaoCirculante.text = "3,101,860.00";
                    controllerPassivoCirculante.text = "1,964,667.00";

                    controllerPassivoNaoCirculante.text = "3,087,302.00";
                    controllerPl.text = " 2,878,601.00";
                    controllerimobilizadopl2022.text = " 1,595,529.00";
                    controllerEstoque.text = " 1,691,150.00";
                    controllerInvestimentos.text = " 34,746.00";
                    controllervendaLiquida.text = " 9,015,855.00";
                    controllerlucroLiquido.text = "478,721.00";
                    controllerLucroBruto.text = " 1,778,153.00";
                    _carregando = false;
                  });
                },
                text: 'Importar Dados',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerAtivoCirculante,
                decoration: InputDecoration(
                  labelText: "Total Ativo Circulante",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerAtivoNaoCirculante,
                decoration: InputDecoration(
                  labelText: "Total Ativo Não Circulante",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerPassivoCirculante,
                decoration: InputDecoration(
                  labelText: "Total Passivo Circulante",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerPassivoNaoCirculante,
                decoration: InputDecoration(
                  labelText: "Total Passivo Não Circulante",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerPl,
                decoration: InputDecoration(
                  labelText: "Patrimônio Líquido",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerimobilizadopl2022,
                decoration: InputDecoration(
                  labelText: "Total Imobilizado",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerEstoque,
                decoration: InputDecoration(
                  labelText: "Total Estoque",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerInvestimentos,
                decoration: InputDecoration(
                  labelText: "Total De Investimentos",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerlucroLiquido,
                decoration: InputDecoration(
                  labelText: "Total Lucro Líquido",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllervendaLiquida,
                decoration: InputDecoration(
                  labelText: "Total Venda Líquida",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerLucroBruto,
                decoration: InputDecoration(
                  labelText: "Total Lucro Bruto",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              // botao para gerar graficos
            ]),
          ),
        ),
        Visibility(
          visible: showconcluirf1,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    if (showEdit2023) {
                      setState(() {
                        showFormulario1 = false;
                        showFormulario2 = false;
                        showconcluirf1 = false;
                        showconcluirf2 = false;
                        showEdit2022 = true;
                        showgerar = true;
                      });
                    } else {
                      setState(() {
                        showFormulario1 = false;
                        showFormulario2 = true;
                        showconcluirf1 = false;
                        showconcluirf2 = true;
                        showEdit2022 = true;
                      });
                    }
                  },
                  text: 'Concluir',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget ano2023() {
    return Column(
      children: [
        Visibility(
          visible: showEdit2023,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: FlutterFlowTheme.of(context).success,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Ano 2023",
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        showFormulario1 = false;
                        showFormulario2 = true;
                        showconcluirf2 = true;
                        showEdit2023 = false;
                        showEdit2022 = true;
                        showconcluirf1 = false;
                        showgerar = false;
                      });
                    },
                    icon: Icon(
                      Icons.edit,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ))
              ],
            ),
          ),
        ),
        Visibility(
          visible: showFormulario2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.15),
                child: SelectionArea(
                    child: Text(
                  'Insira os dados do ano de 2023',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Montserrat',
                      ),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              FFButtonWidget(
                onPressed: () async {
                  setState(() {
                    _carregando = true;
                  });

                  await Future.delayed(Duration(seconds: 3));

                  setState(() {
                    controllerAtivoCirculante2.text = "5,087,060.00";
                    controllerAtivoNaoCirculante2.text = "4,126,821.00";
                    controllerPassivoCirculante2.text = "2,558,795.00";

                    controllerPassivoNaoCirculante2.text = "3,655,664.00";
                    controllerPl2.text = " 2,999,193.00";
                    controllerimobilizadopl2023.text = "2,087,614.00";
                    controllerEstoque2.text = " 2,254,614.00";
                    controllerInvestimentos2.text = " 34,703.00";
                    controllervendaLiquida2.text = " 10,205,488.00";
                    controllerlucroLiquido2.text = "395,225.00";
                    controllerLucroBruto2.text = " 2,119,863.00";
                    _carregando = false;
                  });
                },
                text: 'Importar Dados',
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerAtivoCirculante2,
                decoration: InputDecoration(
                  labelText: "Total Ativo Circulante",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerAtivoNaoCirculante2,
                decoration: InputDecoration(
                  labelText: "Total Ativo Não Circulante",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerPassivoCirculante2,
                decoration: InputDecoration(
                  labelText: "Total Passivo Circulante",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerPassivoNaoCirculante2,
                decoration: InputDecoration(
                  labelText: "Total Passivo Não Circulante",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerPl2,
                decoration: InputDecoration(
                  labelText: "Patrimônio Líquido",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerimobilizadopl2023,
                decoration: InputDecoration(
                  labelText: "Total Imobilizado",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerEstoque2,
                decoration: InputDecoration(
                  labelText: "Total Estoque",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerInvestimentos2,
                decoration: InputDecoration(
                  labelText: "Total De Investimentos",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerlucroLiquido2,
                decoration: InputDecoration(
                  labelText: "Total Lucro Líquido",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllervendaLiquida2,
                decoration: InputDecoration(
                  labelText: "Total Venda Líquida",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controllerLucroBruto2,
                decoration: InputDecoration(
                  labelText: "Total Lucro Bruto",
                  labelStyle: TextStyle(
                    color: FlutterFlowTheme.of(context).primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 9, 19, 204),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD9D9D9),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodySmall,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              // botao para gerar graficos
            ]),
          ),
        ),
        Visibility(
          visible: showconcluirf2,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    setState(() {
                      showFormulario1 = false;
                      showFormulario2 = false;
                      showconcluirf2 = false;
                      showgerar = true;
                      showEdit2023 = true;
                    });
                  },
                  text: 'Concluir',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget variacao() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Variação", style: FlutterFlowTheme.of(context).headlineSmall),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.trending_up,
              size: 48,
              color: FlutterFlowTheme.of(context).primary,
            ),
          ],
        ),

        // grafico de variação
        Container(
            child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: (listaVariacaoAnos.length / 2).ceil(),
          itemBuilder: (context, index) {
            Random random = Random();
            int indiceAleatorio = random.nextInt(listacores.length);
            var splitMenos;

            var splitMenos2 = 0.0;

            double doubleFix12 = 0.0;
            if (index * 2 < listaVariacaoAnos.length) {
              // Acessar o primeiro elemento da linha
              var item1 = listaVariacaoAnos[index];
              if (item1["percent"] < 0) {
                var aux = item1["percent"].toStringAsFixed(2).split("-");
                var aux2 = double.parse(aux[1].toString());
                if (aux2 > 1) {
                  splitMenos = 1.0;
                } else
                  splitMenos = aux2;
              }
              double doubleFix22 =
                  double.parse(item1["percent"].toStringAsFixed(2));

              // Acessar o segundo elemento da linha
              var item2 = index * 2 + 1 < listaVariacaoAnos.length
                  ? listaVariacaoAnos[index * 2 + 1]
                  : null;
              if (item2 != null) {
                if (item2["percent"] < 0) {
                  var aux = item2["percent"].toStringAsFixed(2).split("-");
                  var aux2 = double.parse(aux[1].toString());
                  if (aux2 > 1) {
                    splitMenos2 = 1.0;
                  } else
                    splitMenos2 = aux2;
                }

                doubleFix12 = double.parse(item2["percent"].toStringAsFixed(2));
              }

              // Construir o widget com os itens da linha
              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: charCirculo(
                              "${item1["nome"]}",
                              item1["percent"] > 1
                                  ? 1
                                  : item1["percent"] < 0
                                      ? splitMenos
                                      : item1["percent"],
                              "$doubleFix22 %",
                              listacores[indiceAleatorio]),
                        ),
                      ),
                      if (item2 != null)
                        Expanded(
                          child: Container(
                            child: charCirculo(
                                "${item2["nome"]}",
                                item2["percent"] > 1
                                    ? 1
                                    : item2["percent"] < 0
                                        ? splitMenos2
                                        : item2["percent"],
                                "$doubleFix12 %",
                                listacores[indiceAleatorio]),
                          ),
                        ),
                    ],
                  ),
                ],
              );
            }
            return SizedBox();

            // Random random = Random();
            // int indiceAleatorio = random.nextInt(listacores.length);
            // var splitMenos;
            // if (item1["percent"] < 0) {
            //   var aux = item1["percent"]
            //       .toStringAsFixed(2)
            //       .split("-");
            //   var aux2 = double.parse(aux[1].toString());
            //   if (aux2 > 1) {
            //     splitMenos = 1.0;
            //   } else
            //     splitMenos = aux2;
            // }

            // var splitMenos2 = 0.0;
            // if (item2["percent"] < 0) {
            //   var aux = item2["percent"]
            //       .toStringAsFixed(2)
            //       .split("-");
            //   var aux2 = double.parse(aux[1].toString());
            //   if (aux2 > 1) {
            //     splitMenos2 = 1.0;
            //   } else
            //     splitMenos2 = aux2;
            // }

            // double doubleFix22 = double.parse(
            //     item1["percent"].toStringAsFixed(2));
            // double doubleFix12 = double.parse(
            //     item2["percent"].toStringAsFixed(2));
            // return Column(children: [
            //   SizedBox(
            //     height: 20,
            //   ),
            //   index * 2 + 1 == listaVariacaoAnos.length + 1
            //       ? Text("asdasd")
            //       : Row(
            //           children: [
            //             Expanded(
            //               child: Container(
            //                 child: charCirculo(
            //                     "${item1["nome"]}",
            //                     item1["percent"] > 1
            //                         ? 1
            //                         : item1["percent"] <
            //                                 0
            //                             ? splitMenos
            //                             : item1
            //                                 ["percent"],
            //                     "$doubleFix22 %",
            //                     listacores[indiceAleatorio]),
            //               ),
            //             ),
            //             Expanded(
            //               child: Container(
            //                 child: charCirculo(
            //                     "${item2["nome"]}",
            //                     item2["percent"] > 1
            //                         ? 1
            //                         : item2
            //                                     ["percent"] <
            //                                 0
            //                             ? splitMenos2
            //                             : item2
            //                                 ["percent"],
            //                     "$doubleFix12 %",
            //                     listacores[indiceAleatorio]),
            //               ),
            //             ),
            //           ],
            //         ),
            // ]);
          },
        )),
      ],
    );
  }

  Widget comparativo(BuildContext context) {
    return Column(
      children: [
        ano2022(),
        ano2023(),
        Visibility(
          visible: showgerar,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    setState(() {
                      _carregando = true;
                      listaIndices2022.clear();
                      listaIndices2023.clear();
                      listaVariacaoAnos.clear();
                    });
                    await Future.delayed(Duration(seconds: 10));

                    listaIndices2022.addAll(
                        await UserDetailsFunction(context).gerarIndices());
                    listaIndices2023.addAll(
                        await UserDetailsFunction(context).gerarIndices2());
                    listaVariacaoAnos.addAll(
                        await UserDetailsFunction(context).gerarVariacao());
                    print("listaVariacaoAnos: $listaVariacaoAnos");
                    setState(() {
                      _carregando = false;
                    });
                  },
                  text: 'Gerar Gráficos',
                  icon: Icon(Icons.dashboard_outlined),
                  options: FFButtonOptions(
                    width: MediaQuery.of(context).size.width * .5,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showIndicadoresdeEst = !showIndicadoresdeEst;
                            });
                          },
                          child: Row(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.15),
                                child: SelectionArea(
                                    child: Text(
                                  'Índices de estrutura de capital',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                      ),
                                )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: showIndicadoresdeEst,
                          child: listaIndices2022.length >= 2
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[0]["percent"],
                                            listaIndices2022[0]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[0]["percent"],
                                            listaIndices2023[0]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .alternate),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[0]["nome"],
                                            listaIndices2022[0]["percent"],
                                            listaIndices2022[0]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                            "",
                                            listaIndices2023[0]["percent"],
                                            listaIndices2023[0]["percentText"]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    /// endividamento
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[1]["percent"],
                                            listaIndices2022[1]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[1]["percent"],
                                            listaIndices2023[1]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .alternate),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[1]["nome"],
                                            listaIndices2022[1]["percent"],
                                            listaIndices2022[1]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                            "",
                                            listaIndices2023[1]["percent"],
                                            listaIndices2023[1]["percentText"]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    /// Imobilização do PL
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[2]["percent"],
                                            listaIndices2022[2]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[2]["percent"],
                                            listaIndices2023[2]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .alternate),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[2]["nome"],
                                            listaIndices2022[2]["percent"],
                                            listaIndices2022[2]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                            "",
                                            listaIndices2023[2]["percent"],
                                            listaIndices2023[2]["percentText"]),
                                      ],
                                    ),

                                    // gere inputs com textformfield
                                  ],
                                )
                              : Container(
                                  child: Text(
                                      "Não há dados suficientes para gerar os gráficos"),
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showIndicadoresLiquidez =
                                  !showIndicadoresLiquidez;
                            });
                          },
                          child: Row(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.15),
                                child: SelectionArea(
                                    child: Text(
                                  'Índices de Líquidez',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                      ),
                                )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: showIndicadoresLiquidez,
                          child: listaIndices2022.length >= 5
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[3]["percent"],
                                            listaIndices2022[3]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[3]["percent"],
                                            listaIndices2023[3]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .warning),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[3]["nome"],
                                            listaIndices2022[3]["percent"],
                                            listaIndices2022[3]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .warning,
                                            "",
                                            listaIndices2023[3]["percent"],
                                            listaIndices2023[3]["percentText"]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    /// endividamento
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[4]["percent"],
                                            listaIndices2022[4]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[4]["percent"],
                                            listaIndices2023[4]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .warning),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[4]["nome"],
                                            listaIndices2022[4]["percent"],
                                            listaIndices2022[4]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .warning,
                                            "",
                                            listaIndices2023[4]["percent"],
                                            listaIndices2023[4]["percentText"]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    /// Imobilização do PL
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[5]["percent"],
                                            listaIndices2022[5]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[5]["percent"],
                                            listaIndices2023[5]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .warning),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[5]["nome"],
                                            listaIndices2022[5]["percent"],
                                            listaIndices2022[5]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .warning,
                                            "",
                                            listaIndices2023[5]["percent"],
                                            listaIndices2023[5]["percentText"]),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(
                                  child: Text(
                                      "Não há dados suficientes para gerar os gráficos"),
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showIndicadoresRent = !showIndicadoresRent;
                            });
                          },
                          child: Row(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.15),
                                child: SelectionArea(
                                    child: Text(
                                  'Índices de Rentabilidade',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                      ),
                                )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: showIndicadoresRent,
                          child: listaIndices2022.length >= 8
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[6]["percent"],
                                            listaIndices2022[6]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[6]["percent"],
                                            listaIndices2023[6]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .tertiary),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[6]["nome"],
                                            listaIndices2022[6]["percent"],
                                            listaIndices2022[6]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                            "",
                                            listaIndices2023[6]["percent"],
                                            listaIndices2023[6]["percentText"]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    /// endividamento
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[7]["percent"],
                                            listaIndices2022[7]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[7]["percent"],
                                            listaIndices2023[7]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .tertiary),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[7]["nome"],
                                            listaIndices2022[7]["percent"],
                                            listaIndices2022[7]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                            "",
                                            listaIndices2023[7]["percent"],
                                            listaIndices2023[7]["percentText"]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    /// Imobilização do PL
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[8]["percent"],
                                            listaIndices2022[8]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[8]["percent"],
                                            listaIndices2023[8]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .tertiary),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[8]["nome"],
                                            listaIndices2022[8]["percent"],
                                            listaIndices2022[8]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                            "",
                                            listaIndices2023[8]["percent"],
                                            listaIndices2023[8]["percentText"]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // outros
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[9]["percent"],
                                            listaIndices2022[9]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[9]["percent"],
                                            listaIndices2023[9]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .tertiary),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[9]["nome"],
                                            listaIndices2022[9]["percent"],
                                            listaIndices2022[9]["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                            "",
                                            listaIndices2023[9]["percent"],
                                            listaIndices2023[9]["percentText"]),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Divider(
                                      indent: 0,
                                      endIndent: 0,
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    /// endividamento
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        charCirculo(
                                            "2022",
                                            listaIndices2022[10]["percent"],
                                            listaIndices2022[10]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .primary),
                                        charCirculo(
                                            "2023",
                                            listaIndices2023[10]["percent"],
                                            listaIndices2023[10]["percentText"],
                                            FlutterFlowTheme.of(context)
                                                .tertiary),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // variacao
                                    Column(
                                      children: [
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            listaIndices2022[10]["nome"],
                                            listaIndices2022[10]["percent"],
                                            listaIndices2022[10]
                                                ["percentText"]),
                                        rowLinePercent2(
                                            FlutterFlowTheme.of(context)
                                                .tertiary,
                                            "",
                                            listaIndices2023[10]["percent"],
                                            listaIndices2023[10]
                                                ["percentText"]),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(
                                  child: Text(
                                      "Não há dados suficientes para gerar os gráficos"),
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Divider(
          indent: 30,
          endIndent: 30,
          color: FlutterFlowTheme.of(context).accent2,
          thickness: 1,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget analises() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.15),
            child: SelectionArea(
                child: Text(
              'Análises Deduções de Vendas',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontSize: 13.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
            )),
          ),
          Divider(
            thickness: 1,
            indent: 40,
            endIndent: 40,
            color: FlutterFlowTheme.of(context).info,
          ),
          SizedBox(
            height: 20,
          ),
          widgethorizontalVertical(
            titleH: "Receita Bruta Vendas",
            percentH: 0.14,
            percenteTexth: "14%",
            colorH: FlutterFlowTheme.of(context).primary,
            titleV1: "Vertical 2022",
            percentV1: 1.0,
            percenteTextV1: "114%",
            colorV1: FlutterFlowTheme.of(context).primary,
            titleV2: "Vertical 2023",
            percentV2: 1.0,
            percenteTextV2: "115%",
            colorV2: FlutterFlowTheme.of(context).secondary,
          ),
          SizedBox(
            height: 40,
          ),
          widgethorizontalVertical(
            titleH: "Receita Líquida Vendas",
            percentH: 0.13,
            percenteTexth: "13%",
            colorH: FlutterFlowTheme.of(context).primary,
            titleV1: "Vertical 2022",
            percentV1: 1.0,
            percenteTextV1: "100%",
            colorV1: FlutterFlowTheme.of(context).primary,
            titleV2: "Vertical 2023",
            percentV2: 1.0,
            percenteTextV2: "100%",
            colorV2: FlutterFlowTheme.of(context).secondary,
          ),
          SizedBox(
            height: 40,
          ),
          Visibility(
              visible: showshowAnalises,
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.15),
                    child: SelectionArea(
                        child: Text(
                      'Receitas (Despesas) Operacionais',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 13.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                    )),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                    color: FlutterFlowTheme.of(context).info,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  widgethorizontalVertical(
                    titleH: "Lucro - Receitas e Despesas",
                    percentH: 0.08,
                    percenteTexth: "8%",
                    colorH: FlutterFlowTheme.of(context).primary,
                    titleV1: "Vertical 2022",
                    percentV1: .071,
                    percenteTextV1: "7.1%",
                    colorV1: FlutterFlowTheme.of(context).primary,
                    titleV2: "Vertical 2023",
                    percentV2: .067,
                    percenteTextV2: "6.7%",
                    colorV2: FlutterFlowTheme.of(context).secondary,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  widgethorizontalVertical(
                    titleH: "Lucro antes dos Impostos",
                    percentH: 0.22,
                    percenteTexth: "-22%",
                    colorH: FlutterFlowTheme.of(context).primary,
                    titleV1: "Vertical 2022",
                    percentV1: .056,
                    percenteTextV1: "5.6%",
                    colorV1: FlutterFlowTheme.of(context).primary,
                    titleV2: "Vertical 2023",
                    percentV2: 0.039,
                    percenteTextV2: "3.9%",
                    colorV2: FlutterFlowTheme.of(context).secondary,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.15),
                    child: SelectionArea(
                        child: Text(
                      'Imposto de Renda e Contribuição Social',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 13.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                    )),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                    color: FlutterFlowTheme.of(context).info,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  widgethorizontalVertical(
                    titleH: " Total Imposto de Renda e CSLL",
                    percentH: 0.36,
                    percenteTexth: "36%",
                    colorH: FlutterFlowTheme.of(context).primary,
                    titleV1: "Vertical 2022",
                    percentV1: .03,
                    percenteTextV1: "-0.3%",
                    colorV1: FlutterFlowTheme.of(context).primary,
                    titleV2: "Vertical 2023",
                    percentV2: .04,
                    percenteTextV2: "-0.4%",
                    colorV2: FlutterFlowTheme.of(context).primary,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  widgethorizontalVertical(
                    titleH: "Lucro Líquido do Exercicio",
                    percentH: 0.26,
                    percenteTexth: "-26%",
                    colorH: FlutterFlowTheme.of(context).primary,
                    titleV1: "Vertical 2022",
                    percentV1: .053,
                    percenteTextV1: "5.3%",
                    colorV1: FlutterFlowTheme.of(context).primary,
                    titleV2: "Vertical 2023",
                    percentV2: 0.035,
                    percenteTextV2: "3.5%",
                    colorV2: FlutterFlowTheme.of(context).primary,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.15),
                    child: SelectionArea(
                        child: Text(
                      'Lucro do Período Atribuído A',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 13.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                    )),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                    color: FlutterFlowTheme.of(context).info,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  widgethorizontalVertical(
                    titleH: " Acionistas Controladores",
                    percentH: 0.26,
                    percenteTexth: "-26%",
                    colorH: FlutterFlowTheme.of(context).primary,
                    titleV1: "Vertical 2022",
                    percentV1: .053,
                    percenteTextV1: "5.3%",
                    colorV1: FlutterFlowTheme.of(context).primary,
                    titleV2: "Vertical 2023",
                    percentV2: .035,
                    percenteTextV2: "3.5%",
                    colorV2: FlutterFlowTheme.of(context).primary,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  widgethorizontalVertical(
                    titleH: "Acionistas Não Controladores",
                    percentH: 0.72,
                    percenteTexth: "-72%",
                    colorH: FlutterFlowTheme.of(context).primary,
                    titleV1: "Vertical 2022",
                    percentV1: .0,
                    percenteTextV1: "0%",
                    colorV1: FlutterFlowTheme.of(context).primary,
                    titleV2: "Vertical 2023",
                    percentV2: 0.0,
                    percenteTextV2: "0%",
                    colorV2: FlutterFlowTheme.of(context).primary,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.15),
                    child: SelectionArea(
                        child: Text(
                      'Resultado',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 13.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.w500,
                          ),
                    )),
                  ),
                  Divider(
                    thickness: 1,
                    indent: 40,
                    endIndent: 40,
                    color: FlutterFlowTheme.of(context).info,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  widgethorizontalVertical(
                    titleH: " ",
                    percentH: 0.26,
                    percenteTexth: "-26%",
                    colorH: FlutterFlowTheme.of(context).primary,
                    titleV1: "Vertical 2022",
                    percentV1: .053,
                    percenteTextV1: "5.3%",
                    colorV1: FlutterFlowTheme.of(context).primary,
                    titleV2: "Vertical 2023",
                    percentV2: .035,
                    percenteTextV2: "3.5%",
                    colorV2: FlutterFlowTheme.of(context).primary,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Widget widgethorizontalVertical(
      {titleH,
      percentH,
      percenteTexth,
      colorH,
      titleV1,
      percentV1,
      percenteTextV1,
      colorV1,
      titleV2,
      percentV2,
      percenteTextV2,
      colorV2}) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.15),
          child: SelectionArea(
              child: Text(
            'Horizontal',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Montserrat',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  fontSize: 13.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w500,
                ),
          )),
        ),
        SizedBox(
          height: 10,
        ),
        charCirculo(titleH, percentH, percenteTexth, colorH),
        Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  charCirculo(titleV1, percentV1, percenteTextV1, colorV1),
                  charCirculo(titleV2, percentV2, percenteTextV2, colorV2),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget rowCardTitle({String? title, Color? color}) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title!,
          style: FlutterFlowTheme.of(context).bodySmall,
        ),
      ],
    );
  }

  Widget balancoPiechart() {
    return Column(
      children: [
        // balanco22
        Visibility(
          visible: visibilidadebalanco22,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Balanço atual",
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                PieChartScreen(data: pieChartData),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corAtivoCirc,
                            title: "Ativo Circulante",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corAtivoNCirc,
                            title: "Ativo Não Circulante",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corPassivoCirc,
                            title: "Passivo Circulante",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corPassivoNCirc,
                            title: "Passivo Não Circulante",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corPL,
                            title: "Patrimonio Líquido",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        //  balanço 23
        Visibility(
          visible: visibilidadebalanco23,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("Balanço atual",
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                PieChartScreen(data: pieChartData23),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corAtivoCirc,
                            title: "Ativo Circulante",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corAtivoNCirc,
                            title: "Ativo Não Circulante",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corPassivoCirc,
                            title: "Passivo Circulante",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corPassivoNCirc,
                            title: "Passivo Não Circulante",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          rowCardTitle(
                            color: corPL,
                            title: "Patrimonio Líquido",
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),

        // ambos
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                PieChartScreen(
                  data: pieChartData,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * .3,
                ),
                Text("2022",
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(width: 20),
            Column(
              children: [
                PieChartScreen(
                  data: pieChartData23,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * .3,
                ),
                Text("2023",
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget contas() {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 20.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Contas e Grupos",
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 20),
          // lista de ativos circulantes
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                decoration: BoxDecoration(
                  color: corAtivoCirc.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      visibilidadeAtivoCirculanteList =
                          !visibilidadeAtivoCirculanteList;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ativo Circulantes",
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500)),
                      visibilidadeAtivoCirculanteList
                          ? Icon(Icons.arrow_drop_up)
                          : Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: visibilidadeAtivoCirculanteList,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2022",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaAtivoCirculante2022.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index1) {
                          double value = double.parse(
                              listaAtivoCirculante2022[_index1]
                                  .value
                                  .toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                        "${listaAtivoCirculante2022[_index1].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2023",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaAtivoCirculante2023.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index1) {
                          double value = double.parse(
                              listaAtivoCirculante2023[_index1]
                                  .value
                                  .toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                        "${listaAtivoCirculante2023[_index1].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // lista de ativos nao circulantes
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: corAtivoCirc.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      visibilidadeAtivoNaoCirculanteList =
                          !visibilidadeAtivoNaoCirculanteList;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ativo Não Circulante",
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500)),
                      visibilidadeAtivoNaoCirculanteList
                          ? Icon(Icons.arrow_drop_up)
                          : Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: visibilidadeAtivoNaoCirculanteList,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2022",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaAtivoNaoCirculante2022.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index1) {
                          double value = double.parse(
                              listaAtivoNaoCirculante2022[_index1]
                                  .value
                                  .toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                        "${listaAtivoNaoCirculante2022[_index1].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2023",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaAtivoNaoCirculante2023.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index1) {
                          double value = double.parse(
                              listaAtivoNaoCirculante2023[_index1]
                                  .value
                                  .toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                        "${listaAtivoNaoCirculante2023[_index1].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // lista de passivo circulante
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: corAtivoCirc.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      visibilidadePassivoCirculanteList =
                          !visibilidadePassivoCirculanteList;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Passivo Circulante",
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500)),
                      visibilidadePassivoCirculanteList
                          ? Icon(Icons.arrow_drop_up)
                          : Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: visibilidadePassivoCirculanteList,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2022",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaPassivoCirculante2022.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index2) {
                          double value = double.parse(
                              listaPassivoCirculante2022[_index2]
                                  .value
                                  .toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                        "${listaPassivoCirculante2022[_index2].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2023",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaPassivoCirculante2023.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index2) {
                          double value = double.parse(
                              listaPassivoCirculante2023[_index2]
                                  .value
                                  .toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                        "${listaPassivoCirculante2023[_index2].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          // lista de passivo nao circulante
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: corAtivoCirc.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      visibilidadePassivoNaoCirculanteList =
                          !visibilidadePassivoNaoCirculanteList;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Passivo Não Circulante",
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500)),
                      visibilidadePassivoNaoCirculanteList
                          ? Icon(Icons.arrow_drop_up)
                          : Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: visibilidadePassivoNaoCirculanteList,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2022",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaPassivoNaoirculante2022.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index1) {
                          double value = double.parse(
                              listaPassivoNaoirculante2022[_index1]
                                  .value
                                  .toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                        "${listaPassivoNaoirculante2022[_index1].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2023",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaPassivoNaoirculante2023.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index1) {
                          double value = double.parse(
                              listaPassivoNaoirculante2023[_index1]
                                  .value
                                  .toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                        "${listaPassivoNaoirculante2023[_index1].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: corAtivoCirc.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      visibilidadePLList = !visibilidadePLList;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Patrimonio Liquido",
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontWeight: FontWeight.w500)),
                      visibilidadePLList
                          ? Icon(Icons.arrow_drop_up)
                          : Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: visibilidadePLList,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2022",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaPl2022.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index1) {
                          double value = double.parse(
                              listaPl2022[_index1].value.toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child:
                                        Text("${listaPl2022[_index1].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Ano: 2023",
                            style: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: listaPl203.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, _index1) {
                          double value = double.parse(
                              listaPl203[_index1].value.toString());
                          NumberFormat currencyFormat =
                              NumberFormat.currency(symbol: 'R\$');
                          String formattedValue = currencyFormat.format(value);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("${listaPl203[_index1].title}"),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.041,
                                    margin: EdgeInsets.symmetric(vertical: 3),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: corAtivoCirc.withOpacity(0.0),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text("$formattedValue"),
                                  ),
                                ],
                              ),
                              Divider(
                                color: corAtivoCirc.withOpacity(0.5),
                                height: 1,
                                thickness: 1,
                                indent: 5,
                                endIndent: 20,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget charCirculo(String title, double valor, String percentText, color) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SelectionArea(
            child: Text(
          title,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 13.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.w500,
              ),
        )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: CircularPercentIndicator(
            percent: valor,
            radius: 50.0,
            lineWidth: 15.0,
            animation: true,
            progressColor: color,
            backgroundColor: Color.fromARGB(255, 39, 39, 39),
            center: Text(
              percentText,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Montserrat',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 13.0,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
