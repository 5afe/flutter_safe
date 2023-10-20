import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'balances_list.g.dart';

@immutable
@JsonSerializable()
final class BalancesList extends Equatable {
  const BalancesList({this.fiatTotal = "", this.items = const <BalanceItem>[]});

  final String fiatTotal;
  final List<BalanceItem> items; 

  @override
  List<Object?> get props => [fiatTotal, items];

  factory BalancesList.fromJson(Map<String, dynamic> json) => _$BalancesListFromJson(json);
  Map<String, dynamic> toJson() => _$BalancesListToJson(this);
}

@immutable
@JsonSerializable()
final class BalanceItem extends Equatable {
  const BalanceItem({required this.balance, required this.fiatBalance, required this.tokenInfo});

  final String balance;
  final String fiatBalance;
  final TokenInfo tokenInfo;

  @override
  List<Object?> get props => [balance, fiatBalance, tokenInfo];

  factory BalanceItem.fromJson(Map<String, dynamic> json) => _$BalanceItemFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceItemToJson(this);
}

@immutable
@JsonSerializable()
final class TokenInfo extends Equatable {
  const TokenInfo({required this.address, required this.decimals, required this.logoUri, required this.name, required this.symbol, required this.type});

  final String address;
  final int? decimals;
  final String logoUri;
  final String name;
  final String symbol;
  final String type;

  @override
  List<Object?> get props => [address, decimals, logoUri, name, symbol, type];

  factory TokenInfo.fromJson(Map<String, dynamic> json) => _$TokenInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}

enum TokenType { 
  @JsonValue("ERC721")
  erc721,

  @JsonValue("ERC20")
  erc20, 

  @JsonValue("NATIVE_TOKEN")
  nativeToken, 

  @JsonValue("UNKNOWN")
  unknown 
}
