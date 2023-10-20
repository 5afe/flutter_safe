import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import 'balances_list.dart';

part 'balances_event.dart';
part 'balances_state.dart';

class BalancesBloc extends Bloc<BalancesEvent, BalancesState> {
  BalancesBloc(
      {required this.httpClient,
      required this.chainId,
      required this.safeAddress,
      required this.fiatCode,
      required this.trusted,
      required this.excludeSpam})
      : super(const BalancesState()) {
    on<BalancesFetched>(_onBalancesFetched);
  }

  final http.Client httpClient;

  final String chainId;
  final String safeAddress;
  final String fiatCode;
  final bool trusted;
  final bool excludeSpam;

  Future<void> _onBalancesFetched(
      BalancesFetched event, Emitter<BalancesState> emit) async {
    try {
      final list = await _fetchBalances(
          chainId, safeAddress, fiatCode, trusted, excludeSpam);
      emit(state.copyWith(status: BalancesStatus.success, list: list));
    } catch (_) {
      emit(state.copyWith(status: BalancesStatus.failure));
    }
  }

  Future<BalancesList> _fetchBalances(String chainId, String safeAddress,
      String fiatCode, bool? trusted, bool? excludeSpam) async {
    final response = await httpClient.get(Uri.https(
        'safe-client.safe.global',
        '/v1/chains/$chainId/safes/$safeAddress/balances/$fiatCode',
        {'trusted': '$trusted', 'exclude_spam': '$excludeSpam'}));

    if (response.statusCode != 200) {
      throw Exception('error fetching balances');
    }

    final body = json.decode(response.body) as Map<String, dynamic>;
    return BalancesList.fromJson(body);
  }
}
