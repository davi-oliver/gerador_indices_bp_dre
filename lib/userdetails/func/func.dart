// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:contabilidade/userdetails/DATA/ativo_circulante2022.dart';
import 'package:contabilidade/userdetails/DATA/ativo_circulante2023.dart';
import 'package:contabilidade/userdetails/DATA/passivo_circulante2022.dart';
import 'package:contabilidade/userdetails/DATA/passivo_circulante2023.dart';
import 'package:contabilidade/userdetails/DATA/passivo_n_circulante2022.dart';
import 'package:contabilidade/userdetails/DATA/passivo_n_circulante2023.dart';
import 'package:contabilidade/userdetails/DATA/pl2022.dart';
import 'package:contabilidade/userdetails/DATA/pl2023.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

TextEditingController controllervendaLiquida = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerlucroLiquido = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerimobilizadopl2022 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerPassivoCirculante = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerPassivoNaoCirculante =
    MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerAtivoCirculante = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerAtivoNaoCirculante = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerPl = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerLucroBruto = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerEstoque = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerInvestimentos = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
////
TextEditingController controllervendaLiquida2 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerlucroLiquido2 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerimobilizadopl2023 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerPassivoCirculante2 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerPassivoNaoCirculante2 =
    MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerAtivoCirculante2 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerAtivoNaoCirculante2 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerPl2 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerLucroBruto2 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerEstoque2 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);
TextEditingController controllerInvestimentos2 = MoneyMaskedTextController(
  leftSymbol: 'R\$ ',
  decimalSeparator: ',',
  thousandSeparator: '.',
);

class UserDetailsFunction {
  BuildContext context;
  UserDetailsFunction(this.context);

  Future<double> tratada(formattedValue) async {
    String cleanValue = await formattedValue.replaceAll(RegExp(r'[^0-9,]'), '');

// Substituir vírgula por ponto decimal
    String decimalValue = cleanValue.replaceAll(',', '.');

// Converter para double
    double value = double.parse(decimalValue);

    print(value); // Output: 2558795.0
    return value;
  }

  Future gerarVariacao() async {
    List list = [];
    final totalPassivoCir = await tratada(controllerPassivoCirculante.text);
    final totalPassivoNaoCir =
        await tratada(controllerPassivoNaoCirculante.text);
    final totalAtivoCir = await tratada(controllerAtivoCirculante.text);
    final totalAtivoNaoCir = await tratada(controllerAtivoNaoCirculante.text);
    final totalPl = await tratada(controllerPl.text);
    final totalLucroBruto = await tratada(controllerLucroBruto.text);
    final totalEstoque = await tratada(controllerEstoque.text);
    final totalInvestimentos = await tratada(controllerInvestimentos.text);
    final totalVendaLiquida = await tratada(controllervendaLiquida.text);
    final totalLucroLiquido = await tratada(controllerlucroLiquido.text);
    final totalImobilizado = await tratada(controllerimobilizadopl2022.text);
    //
    final totalPassivoCir2 = await tratada(controllerPassivoCirculante2.text);
    final totalPassivoNaoCir2 =
        await tratada(controllerPassivoNaoCirculante2.text);
    final totalAtivoCir2 = await tratada(controllerAtivoCirculante2.text);
    final totalAtivoNaoCir2 = await tratada(controllerAtivoNaoCirculante2.text);
    final totalPl2 = await tratada(controllerPl2.text);
    final totalLucroBruto2 = await tratada(controllerLucroBruto2.text);
    final totalEstoque2 = await tratada(controllerEstoque2.text);
    final totalInvestimentos2 = await tratada(controllerInvestimentos2.text);
    final totalVendaLiquida2 = await tratada(controllervendaLiquida2.text);
    final totalLucroLiquido2 = await tratada(controllerlucroLiquido2.text);
    final totalImobilizado2 = await tratada(controllerimobilizadopl2023.text);

    final totalAtivo2022 = totalAtivoCir + totalAtivoNaoCir;
    final totalAtivo2023 = totalAtivoCir2 + totalAtivoNaoCir2;
    final totalPassivo2022 = totalPassivoCir + totalPassivoNaoCir;
    final totalPassivo2023 = totalPassivoCir2 + totalPassivoNaoCir2;
    final totalPl2022 = totalPl;
    final totalPl2023 = totalPl2;
    final totalLucroBruto2022 = totalLucroBruto;
    final totalLucroBruto2023 = totalLucroBruto2;
    final totalEstoque2022 = totalEstoque;
    final totalEstoque2023 = totalEstoque2;
    final totalInvestimentos2022 = totalInvestimentos;
    final totalInvestimentos2023 = totalInvestimentos2;
    final totalVendaLiquida2022 = totalVendaLiquida;
    final totalVendaLiquida2023 = totalVendaLiquida2;
    final totalLucroLiquido2022 = totalLucroLiquido;
    final totalLucroLiquido2023 = totalLucroLiquido2;
    final totalImobilizado2022 = totalImobilizado;
    final totalImobilizado2023 = totalImobilizado2;

    final variacaoPassivo = totalPassivo2023 - totalPassivo2022;
    final porcentagemVariacaoPassivo =
        (variacaoPassivo / totalPassivo2022) * 100;
    list.add(
      {
        "nome": "Variação do Passivo",
        "valor": "$variacaoPassivo",
        "percent": porcentagemVariacaoPassivo
      },
    );

    final variacaoAtivo = totalAtivo2023 - totalAtivo2022;
    final porcentagemVariacaoAtivo = (variacaoAtivo / totalAtivo2022) * 100;
    list.add(
      {
        "nome": "Variação do Ativo",
        "valor": "$variacaoAtivo",
        "percent": porcentagemVariacaoAtivo
      },
    );

    final variacaoPl = totalPl2023 - totalPl2022;
    final porcentagemVariacaoPl = (variacaoPl / totalPl2022) * 100;

    list.add(
      //
      {
        "nome": "Variação do PL",
        "valor": "$variacaoPl",
        "percent": porcentagemVariacaoPl
      },
    );

    final variacaoLucroBruto = totalLucroBruto2023 - totalLucroBruto2022;
    final porcentagemVariacaoLucroBruto =
        (variacaoLucroBruto / totalLucroBruto2022) * 100;
    list.add({
      "nome": "Variação do Lucro Bruto",
      "valor": "$variacaoLucroBruto",
      "percent": porcentagemVariacaoLucroBruto
    });

    final variacaoEstoque = totalEstoque2023 - totalEstoque2022;
    final porcentagemVariacaoEstoque =
        (variacaoEstoque / totalEstoque2022) * 100;
    list.add({
      "nome": "Variação do Estoque",
      "valor": "$variacaoEstoque",
      "percent": porcentagemVariacaoEstoque
    });

    final variacaoInvestimentos =
        totalInvestimentos2023 - totalInvestimentos2022;
    final porcentagemVariacaoInvestimentos =
        (variacaoInvestimentos / totalInvestimentos2022) * 100;
    list.add({
      "nome": "Variação do Investimentos",
      "valor": "$variacaoInvestimentos",
      "percent": porcentagemVariacaoInvestimentos
    });

    final variacaoVendaLiquida = totalVendaLiquida2023 - totalVendaLiquida2022;
    final porcentagemVariacaoVendaLiquida =
        (variacaoVendaLiquida / totalVendaLiquida2022) * 100;
    list.add({
      "nome": "Variação da Venda Liquida",
      "valor": "$variacaoVendaLiquida",
      "percent": porcentagemVariacaoVendaLiquida
    });

    final variacaoLucroLiquido = totalLucroLiquido2023 - totalLucroLiquido2022;
    final porcentagemVariacaoLucroLiquido =
        (variacaoLucroLiquido / totalLucroLiquido2022) * 100;
    list.add({
      "nome": "Variação do Lucro Liquido",
      "valor": "$variacaoLucroLiquido",
      "percent": porcentagemVariacaoLucroLiquido
    });

    final variacaoImobilizado = totalImobilizado2023 - totalImobilizado2022;
    final porcentagemVariacaoImobilizado =
        (variacaoImobilizado / totalImobilizado2022) * 100;

    list.add({
      "nome": "Variação do Imobilizado",
      "valor": "$variacaoImobilizado",
      "percent": porcentagemVariacaoImobilizado
    });

    print("ListaVariacao : ${list.length}");

    return list;
  }

  Future gerarIndices2() async {
    List list = [];
    final totalPassivoCir = await tratada(controllerPassivoCirculante2.text);
    final totalPassivoNaoCir =
        await tratada(controllerPassivoNaoCirculante2.text);
    final totalAtivoCir = await tratada(controllerAtivoCirculante2.text);
    final totalAtivoNaoCir = await tratada(controllerAtivoNaoCirculante2.text);
    final totalPl = await tratada(controllerPl2.text);
    final totalLucroBruto = await tratada(controllerLucroBruto2.text);
    final totalEstoque = await tratada(controllerEstoque2.text);
    final totalInvestimentos = await tratada(controllerInvestimentos2.text);
    final totalVendaLiquida = await tratada(controllervendaLiquida2.text);
    final totalLucroLiquido = await tratada(controllerlucroLiquido2.text);
    final totalImobilizadoPl = await tratada(controllerimobilizadopl2023.text);

    double indiceEstruturaCapital = await calculaIndiceEstruturaCapital(
      totalpassivoCirculante: totalPassivoCir,
      totalpassivoNaoCirculante: totalPassivoNaoCir,
      totalPatrimonioLiquido: totalPl,
    );
    double indiceComposicaoEndividamento =
        await calculaIndiceComposicaoEndividamento(
      totalpassivoCirculante: totalPassivoCir,
      totalpassivoNaoCirculante: totalPassivoNaoCir,
    );
    double indiceImobilizadoPl = await calculaIndiceImobilizadoPl(
      totalImobilizado: totalImobilizadoPl,
      totalPatrimonioLiquido: totalPl,
    );
    double indiceLiquidezGeral = await calculaIndicesLiquidezGeral(
      totalAtivoCirculante: totalAtivoCir,
      contaAtivonaoCirculante1: 0,
      contaAtivonaoCirculante2: 0,
      totalPassivoCirculante: totalPassivoCir,
      totalPassivoNaoCirculante: totalPassivoNaoCir,
    );
    double indiceLiquidezCorrente = await calculaIndicesLiquidezCorrente(
      totalAtivoCirculante: totalAtivoCir,
      totalPassivoCirculante: totalPassivoCir,
    );
    double indiceLiquidezSeca = await calculaIndiceLiquidezSeca(
      totalAtivoCirculante: totalAtivoCir,
      totalEstoque: totalEstoque,
      totalPassivoCirculante: totalPassivoCir,
    );

    double indiceGiroAtivo = await calculaGiroDoAtivo(
      vendasLiquida: totalVendaLiquida,
      totalAtivo: totalAtivoCir + totalAtivoNaoCir,
    );

    double indiceMargemLiquida = await calculaMargemLiquida(
        lucroLiquido: totalLucroLiquido, receitaLiquida: totalVendaLiquida);

    double indiceRentabilidadeAtivo = await calculaRentabilidadeDoAtivo(
        lucroLiquido: totalLucroLiquido,
        totalAtivo: totalAtivoCir + totalAtivoNaoCir);

    double indiceRentabilidadePatrimonioLiquido =
        await calculaRentabilidadeDoPatrimonioLiquido(
            lucroLiquido: totalLucroLiquido, totalPatrimonioLiquido: totalPl);

    double indiceMargemBruta = await calculaMargemBruta(
        lucroBruto: totalLucroBruto, receitaLiquida: totalVendaLiquida);

    double indiceRoi = await calculaROI(
        lucroLiquido: totalLucroLiquido, investimentos: totalInvestimentos);
    /*
    "nome": "indice de estrutura de capital",
    "percent": 0.0,
    "valor": 10,
    "percentText" : "0.0%",
     */

    print("Estrutura de capital: $indiceEstruturaCapital");
    if (indiceEstruturaCapital > 0.99) {
      list.add({
        "nome": "Estrutura de capital",
        "percent": 1.0,
        "percentText": "${(indiceEstruturaCapital * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceEstruturaCapital < 1.0) {
      list.add({
        "nome": "Estrutura de capital",
        "percent": indiceEstruturaCapital,
        "percentText": "${(indiceEstruturaCapital * 100).toStringAsFixed(2)}%",
      });
    }
    if (indiceComposicaoEndividamento > 0.99) {
      list.add({
        "nome": "Composição de Endividamento",
        "percent": 1.0,
        "percentText":
            "${(indiceComposicaoEndividamento * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceComposicaoEndividamento < 1.0) {
      list.add({
        "nome": "Composição de Endividamento",
        "percent": indiceComposicaoEndividamento,
        "percentText":
            "${(indiceComposicaoEndividamento * 100).toStringAsFixed(2)}%",
      });
    }
    if (indiceImobilizadoPl > 0.99) {
      list.add({
        "nome": "Imobilização do PL",
        "percent": 1.0,
        "percentText": "${(indiceImobilizadoPl * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceImobilizadoPl < 1.0) {
      list.add({
        "nome": "Imobilização do PL",
        "percent": indiceImobilizadoPl,
        "percentText": "${(indiceImobilizadoPl * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceLiquidezGeral > 0.99) {
      list.add({
        "nome": "Liquidez Geral",
        "percent": 1.0,
        "percentText": "${(indiceLiquidezGeral * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceLiquidezGeral < 1.0) {
      list.add({
        "nome": "Liquidez Geral",
        "percent": indiceLiquidezGeral,
        "percentText": "${(indiceLiquidezGeral * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceLiquidezCorrente > 0.99) {
      list.add({
        "nome": "Liquidez Corrente",
        "percent": 1.0,
        "percentText": "${(indiceLiquidezCorrente * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceLiquidezCorrente < 1.0) {
      list.add({
        "nome": "Liquidez Corrente",
        "percent": indiceLiquidezCorrente,
        "percentText": "${(indiceLiquidezCorrente * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceLiquidezSeca > 0.99) {
      list.add({
        "nome": "Liquidez Seca",
        "percent": 1.0,
        "percentText": "${(indiceLiquidezSeca * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceLiquidezSeca < 1.0) {
      list.add({
        "nome": "Liquidez Seca",
        "percent": indiceLiquidezSeca,
        "percentText": "${(indiceLiquidezSeca * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceGiroAtivo > 0.99) {
      list.add({
        "nome": "Giro do Ativo",
        "percent": 1.0,
        "percentText": "${(indiceGiroAtivo * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceGiroAtivo < 1.0) {
      list.add({
        "nome": "Giro do Ativo",
        "percent": indiceGiroAtivo,
        "percentText": "${(indiceGiroAtivo * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceMargemLiquida > 0.99) {
      list.add({
        "nome": "Margem Líquida",
        "percent": 1.0,
        "percentText": "${(indiceMargemLiquida * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceGiroAtivo < 1.0) {
      list.add({
        "nome": "Margem Líquida",
        "percent": indiceMargemLiquida,
        "percentText": "${(indiceMargemLiquida * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceRentabilidadeAtivo > 0.99) {
      list.add({
        "nome": "Rentabilidade do Ativo",
        "percent": 1.0,
        "percentText":
            "${(indiceRentabilidadeAtivo * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceRentabilidadeAtivo < 1.0) {
      list.add({
        "nome": "Rentabilidade do Ativo",
        "percent": indiceRentabilidadeAtivo,
        "percentText":
            "${(indiceRentabilidadeAtivo * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceRentabilidadePatrimonioLiquido > 0.99) {
      list.add({
        "nome": "Rentabilidade do PL",
        "percent": 1.0,
        "percentText":
            "${(indiceRentabilidadePatrimonioLiquido * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceRentabilidadePatrimonioLiquido < 1.0) {
      list.add({
        "nome": "Rentabilidade do PL",
        "percent": indiceRentabilidadePatrimonioLiquido,
        "percentText":
            "${(indiceRentabilidadePatrimonioLiquido * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceRoi > 0.99) {
      list.add({
        "nome": "Retorno sobre Investimento",
        "percent": 1.0,
        "percentText": "${(indiceRoi * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceRoi < 1.0) {
      list.add({
        "nome": "Retorno sobre Investimento",
        "percent": indiceRoi,
        "percentText": "${(indiceRoi * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceMargemBruta > 0.99) {
      list.add({
        "nome": "Margem Bruta",
        "percent": 1.0,
        "percentText": "${(indiceMargemBruta * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceMargemBruta < 1.0) {
      list.add({
        "nome": "Margem Bruta",
        "percent": indiceMargemBruta,
        "percentText": "${(indiceMargemBruta * 100).toStringAsFixed(2)}%",
      });
    }

    print("Lista de Indice: ${list.length}");
    return list;
  }

  Future gerarIndices() async {
    List list = [];
    final totalPassivoCir = await tratada(controllerPassivoCirculante.text);
    final totalPassivoNaoCir =
        await tratada(controllerPassivoNaoCirculante.text);
    final totalAtivoCir = await tratada(controllerAtivoCirculante.text);
    final totalAtivoNaoCir = await tratada(controllerAtivoNaoCirculante.text);
    final totalPl = await tratada(controllerPl.text);
    final totalLucroBruto = await tratada(controllerLucroBruto.text);
    final totalEstoque = await tratada(controllerEstoque.text);
    final totalInvestimentos = await tratada(controllerInvestimentos.text);
    final totalVendaLiquida = await tratada(controllervendaLiquida.text);
    final totalLucroLiquido = await tratada(controllerlucroLiquido.text);
    final totalImobilizadoPl = await tratada(controllerimobilizadopl2022.text);

    double indiceEstruturaCapital = await calculaIndiceEstruturaCapital(
      totalpassivoCirculante: totalPassivoCir,
      totalpassivoNaoCirculante: totalPassivoNaoCir,
      totalPatrimonioLiquido: totalPl,
    );
    double indiceComposicaoEndividamento =
        await calculaIndiceComposicaoEndividamento(
      totalpassivoCirculante: totalPassivoCir,
      totalpassivoNaoCirculante: totalPassivoNaoCir,
    );
    double indiceImobilizadoPl = await calculaIndiceImobilizadoPl(
      totalImobilizado: totalImobilizadoPl,
      totalPatrimonioLiquido: totalPl,
    );
    double indiceLiquidezGeral = await calculaIndicesLiquidezGeral(
      totalAtivoCirculante: totalAtivoCir,
      contaAtivonaoCirculante1: 0,
      contaAtivonaoCirculante2: 0,
      totalPassivoCirculante: totalPassivoCir,
      totalPassivoNaoCirculante: totalPassivoNaoCir,
    );
    double indiceLiquidezCorrente = await calculaIndicesLiquidezCorrente(
      totalAtivoCirculante: totalAtivoCir,
      totalPassivoCirculante: totalPassivoCir,
    );
    double indiceLiquidezSeca = await calculaIndiceLiquidezSeca(
      totalAtivoCirculante: totalAtivoCir,
      totalEstoque: totalEstoque,
      totalPassivoCirculante: totalPassivoCir,
    );

    double indiceGiroAtivo = await calculaGiroDoAtivo(
      vendasLiquida: totalVendaLiquida,
      totalAtivo: totalAtivoCir + totalAtivoNaoCir,
    );

    double indiceMargemLiquida = await calculaMargemLiquida(
        lucroLiquido: totalLucroLiquido, receitaLiquida: totalVendaLiquida);

    double indiceRentabilidadeAtivo = await calculaRentabilidadeDoAtivo(
        lucroLiquido: totalLucroLiquido,
        totalAtivo: totalAtivoCir + totalAtivoNaoCir);

    double indiceRentabilidadePatrimonioLiquido =
        await calculaRentabilidadeDoPatrimonioLiquido(
            lucroLiquido: totalLucroLiquido, totalPatrimonioLiquido: totalPl);

    double indiceMargemBruta = await calculaMargemBruta(
        lucroBruto: totalLucroBruto, receitaLiquida: totalVendaLiquida);

    double indiceRoi = await calculaROI(
        lucroLiquido: totalLucroLiquido, investimentos: totalInvestimentos);
    /*
    "nome": "indice de estrutura de capital",
    "percent": 0.0,
    "valor": 10,
    "percentText" : "0.0%",
     */

    print("Estrutura de capital: $indiceEstruturaCapital");
    if (indiceEstruturaCapital > 0.99) {
      list.add({
        "nome": "Estrutura de capital",
        "percent": 1.0,
        "percentText": "${(indiceEstruturaCapital * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceEstruturaCapital < 1.0) {
      list.add({
        "nome": "Estrutura de capital",
        "percent": indiceEstruturaCapital,
        "percentText": "${(indiceEstruturaCapital * 100).toStringAsFixed(2)}%",
      });
    }
    if (indiceComposicaoEndividamento > 0.99) {
      list.add({
        "nome": "Composição de Endividamento",
        "percent": 1.0,
        "percentText":
            "${(indiceComposicaoEndividamento * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceComposicaoEndividamento < 1.0) {
      list.add({
        "nome": "Composição de Endividamento",
        "percent": indiceComposicaoEndividamento,
        "percentText":
            "${(indiceComposicaoEndividamento * 100).toStringAsFixed(2)}%",
      });
    }
    if (indiceImobilizadoPl > 0.99) {
      list.add({
        "nome": "Imobilização do PL",
        "percent": 1.0,
        "percentText": "${(indiceImobilizadoPl * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceImobilizadoPl < 1.0) {
      list.add({
        "nome": "Imobilização do PL",
        "percent": indiceImobilizadoPl,
        "percentText": "${(indiceImobilizadoPl * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceLiquidezGeral > 0.99) {
      list.add({
        "nome": "Liquidez Geral",
        "percent": 1.0,
        "percentText": "${(indiceLiquidezGeral * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceLiquidezGeral < 1.0) {
      list.add({
        "nome": "Liquidez Geral",
        "percent": indiceLiquidezGeral,
        "percentText": "${(indiceLiquidezGeral * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceLiquidezCorrente > 0.99) {
      list.add({
        "nome": "Liquidez Corrente",
        "percent": 1.0,
        "percentText": "${(indiceLiquidezCorrente * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceLiquidezCorrente < 1.0) {
      list.add({
        "nome": "Liquidez Corrente",
        "percent": indiceLiquidezCorrente,
        "percentText": "${(indiceLiquidezCorrente * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceLiquidezSeca > 0.99) {
      list.add({
        "nome": "Liquidez Seca",
        "percent": 1.0,
        "percentText": "${(indiceLiquidezSeca * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceLiquidezSeca < 1.0) {
      list.add({
        "nome": "Liquidez Seca",
        "percent": indiceLiquidezSeca,
        "percentText": "${(indiceLiquidezSeca * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceGiroAtivo > 0.99) {
      list.add({
        "nome": "Giro do Ativo",
        "percent": 1.0,
        "percentText": "${(indiceGiroAtivo * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceGiroAtivo < 1.0) {
      list.add({
        "nome": "Giro do Ativo",
        "percent": indiceGiroAtivo,
        "percentText": "${(indiceGiroAtivo * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceMargemLiquida > 0.99) {
      list.add({
        "nome": "Margem Líquida",
        "percent": 1.0,
        "percentText": "${(indiceMargemLiquida * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceGiroAtivo < 1.0) {
      list.add({
        "nome": "Margem Líquida",
        "percent": indiceMargemLiquida,
        "percentText": "${(indiceMargemLiquida * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceRentabilidadeAtivo > 0.99) {
      list.add({
        "nome": "Rentabilidade do Ativo",
        "percent": 1.0,
        "percentText":
            "${(indiceRentabilidadeAtivo * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceRentabilidadeAtivo < 1.0) {
      list.add({
        "nome": "Rentabilidade do Ativo",
        "percent": indiceRentabilidadeAtivo,
        "percentText":
            "${(indiceRentabilidadeAtivo * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceRentabilidadePatrimonioLiquido > 0.99) {
      list.add({
        "nome": "Rentabilidade do PL",
        "percent": 1.0,
        "percentText":
            "${(indiceRentabilidadePatrimonioLiquido * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceRentabilidadePatrimonioLiquido < 1.0) {
      list.add({
        "nome": "Rentabilidade do PL",
        "percent": indiceRentabilidadePatrimonioLiquido,
        "percentText":
            "${(indiceRentabilidadePatrimonioLiquido * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceRoi > 0.99) {
      list.add({
        "nome": "Retorno sobre Investimento",
        "percent": 1.0,
        "percentText": "${(indiceRoi * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceRoi < 1.0) {
      list.add({
        "nome": "Retorno sobre Investimento",
        "percent": indiceRoi,
        "percentText": "${(indiceRoi * 100).toStringAsFixed(2)}%",
      });
    }

    if (indiceMargemBruta > 0.99) {
      list.add({
        "nome": "Margem Bruta",
        "percent": 1.0,
        "percentText": "${(indiceMargemBruta * 100).toStringAsFixed(2)}%",
      });
    } else if (indiceMargemBruta < 1.0) {
      list.add({
        "nome": "Margem Bruta",
        "percent": indiceMargemBruta,
        "percentText": "${(indiceMargemBruta * 100).toStringAsFixed(2)}%",
      });
    }

    print("Lista de Indice: ${list}");
    return list;
  }

  Future calculaIndiceEstruturaCapital({
    // passivo circulante  + passivo nao circulante / patrimonio liquido
    required double totalpassivoCirculante,
    required double totalpassivoNaoCirculante,
    required double totalPatrimonioLiquido,
  }) async {
    var resultado = (totalpassivoCirculante + totalpassivoNaoCirculante) /
        totalPatrimonioLiquido;
    return resultado;
  }

  Future calculaIndiceComposicaoEndividamento({
    // passivo circulante  + passivo nao circulante / ativo total
    required double totalpassivoCirculante,
    required double totalpassivoNaoCirculante,
    // required double totalAtivo,
  }) async {
    var resultado = totalpassivoCirculante /
        (totalpassivoCirculante + totalpassivoNaoCirculante);
    return resultado;
  }

  Future calculaIndiceImobilizadoPl({
    required double totalImobilizado,
    required double totalPatrimonioLiquido,
  }) async {
    return totalImobilizado / totalPatrimonioLiquido;
  }

  Future calculaIndicesLiquidezGeral({
    // ativo circulante / passivo circulante
    required double totalAtivoCirculante,
    required double contaAtivonaoCirculante1,
    required double contaAtivonaoCirculante2,
    required double totalPassivoCirculante,
    required double totalPassivoNaoCirculante,
  }) async {
    var resultado = (totalAtivoCirculante +
            contaAtivonaoCirculante1 +
            contaAtivonaoCirculante2) /
        (totalPassivoCirculante + totalPassivoNaoCirculante);
    return resultado;
  }

  Future calculaIndicesLiquidezCorrente({
    // ativo circulante / passivo circulante
    required double totalAtivoCirculante,
    required double totalPassivoCirculante,
  }) async {
    var resultado = totalAtivoCirculante / totalPassivoCirculante;
    return resultado;
  }

  Future calculaGiroDoAtivo({
    // vendas liquida / ativo total
    required double vendasLiquida,
    required double totalAtivo,
  }) async {
    var resultado = vendasLiquida / totalAtivo;
    return resultado;
  }

  Future calculaMargemLiquida({
    // lucro liquido / vendas liquida
    required double lucroLiquido,
    required double receitaLiquida,
  }) async {
    var resultado = lucroLiquido / receitaLiquida;
    return resultado;
  }

  Future calculaRentabilidadeDoAtivo({
    // lucro liquido / ativo total
    required double lucroLiquido,
    required double totalAtivo,
  }) async {
    var resultado = lucroLiquido / totalAtivo;
    return resultado;
  }

  Future calculaRentabilidadeDoPatrimonioLiquido({
    // lucro liquido / patrimonio liquido
    required double lucroLiquido,
    required double totalPatrimonioLiquido,
  }) async {
    var resultado = lucroLiquido / totalPatrimonioLiquido;
    return resultado;
  }

  Future calculaMargemBruta({
    // lucro bruto / vendas liquida
    required double lucroBruto,
    required double receitaLiquida,
  }) async {
    var resultado = lucroBruto / receitaLiquida;
    return resultado;
  }

  Future calculaROI({
    // lucro liquido / ativo total
    required double lucroLiquido,
    required double investimentos,
  }) async {
    var resultado = lucroLiquido / investimentos;
    return resultado;
  }

  Future calculaIndiceLiquidezSeca({
    // ativo circulante - estoque / passivo circulante
    required double totalAtivoCirculante,
    required double totalEstoque,
    required double totalPassivoCirculante,
  }) async {
    var resultado =
        (totalAtivoCirculante - totalEstoque) / totalPassivoCirculante;
    return resultado;
  }

  Future<List<ModelItems>> getListAtivoCirculante2022() async {
    final jsonB = jsonAtivoCirculante2022;
    List<ModelItems> listAtivo2022 = [];
    for (var i = 0; i < jsonB.length; i++) {
      listAtivo2022.add(ModelItems.fromMap(jsonB[i]));
    }
    return listAtivo2022;
  }
  //

  Future<List<ModelItems>> getListAtivoCirculante2023() async {
    final jsonB = jsonAtivoCirculante2023;
    List<ModelItems> list = [];
    for (var i = 0; i < jsonB.length; i++) {
      list.add(ModelItems.fromMap(jsonB[i]));
    }
    return list;
  }

  Future<List<ModelItems>> getListPassivoCirculante2022() async {
    final jsonB = jsonPassivoCirculante2022;
    List<ModelItems> list = [];
    for (var i = 0; i < jsonB.length; i++) {
      list.add(ModelItems.fromMap(jsonB[i]));
    }
    return list;
  }

  Future<List<ModelItems>> getListPassivoCirculante2023() async {
    final jsonB = jsonPassivoCirculante2023;
    List<ModelItems> list = [];
    for (var i = 0; i < jsonB.length; i++) {
      list.add(ModelItems.fromMap(jsonB[i]));
    }
    return list;
  }

  Future<List<ModelItems>> getListAtivoNaoCirculante2023() async {
    final jsonB = jsonAtivoCirculante2023;
    List<ModelItems> list = [];
    for (var i = 0; i < jsonB.length; i++) {
      list.add(ModelItems.fromMap(jsonB[i]));
    }
    return list;
  }

  Future<List<ModelItems>> getListAtivoNaoCirculante2022() async {
    final jsonB = jsonAtivoCirculante2022;
    List<ModelItems> list = [];
    for (var i = 0; i < jsonB.length; i++) {
      list.add(ModelItems.fromMap(jsonB[i]));
    }
    return list;
  }

  Future<List<ModelItems>> getListPassivoNaoCirculante2022() async {
    final jsonB = jsonPassinvoNaoCirculante2022;
    List<ModelItems> list = [];
    for (var i = 0; i < jsonB.length; i++) {
      list.add(ModelItems.fromMap(jsonB[i]));
    }
    return list;
  }

  Future<List<ModelItems>> getListPassivoNaoCirculante2023() async {
    final jsonB = jsonPassivoNaoCirculante2023;
    List<ModelItems> list = [];
    for (var i = 0; i < jsonB.length; i++) {
      list.add(ModelItems.fromMap(jsonB[i]));
    }
    return list;
  }

  Future<List<ModelItems>> getListpL2O22() async {
    final jsonB = jsonPl2022;
    List<ModelItems> list = [];
    for (var i = 0; i < jsonB.length; i++) {
      list.add(ModelItems.fromMap(jsonB[i]));
    }
    return list;
  }

  Future<List<ModelItems>> getListpL2O23() async {
    final jsonB = jsonPl2023;
    List<ModelItems> list = [];
    for (var i = 0; i < jsonB.length; i++) {
      list.add(ModelItems.fromMap(jsonB[i]));
    }
    return list;
  }
}

class ModelItems {
  String? title;
  int? value;
  ModelItems({this.title, this.value});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'campo': title,
      'value': value,
    };
  }

  factory ModelItems.fromMap(Map<String, dynamic> map) {
    return ModelItems(
      title: map['campo'] != null ? map['campo'] as String : null,
      value: map['value'] != null ? map['value'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelItems.fromJson(String source) =>
      ModelItems.fromMap(json.decode(source) as Map<String, dynamic>);
}
