// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balances_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalancesList _$BalancesListFromJson(Map<String, dynamic> json) => BalancesList(
      fiatTotal: json['fiatTotal'] as String? ?? "",
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => BalanceItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BalanceItem>[],
    );

Map<String, dynamic> _$BalancesListToJson(BalancesList instance) =>
    <String, dynamic>{
      'fiatTotal': instance.fiatTotal,
      'items': instance.items,
    };

BalanceItem _$BalanceItemFromJson(Map<String, dynamic> json) => BalanceItem(
      balance: json['balance'] as String,
      fiatBalance: json['fiatBalance'] as String,
      tokenInfo: TokenInfo.fromJson(json['tokenInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BalanceItemToJson(BalanceItem instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'fiatBalance': instance.fiatBalance,
      'tokenInfo': instance.tokenInfo,
    };

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) => TokenInfo(
      address: json['address'] as String,
      decimals: json['decimals'] as int?,
      logoUri: json['logoUri'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
      'address': instance.address,
      'decimals': instance.decimals,
      'logoUri': instance.logoUri,
      'name': instance.name,
      'symbol': instance.symbol,
      'type': instance.type,
    };
