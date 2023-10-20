part of 'balances_bloc.dart';

enum BalancesStatus { initial, success, failure 
}

final class BalancesState extends Equatable {
  const BalancesState({this.status = BalancesStatus.initial, this.list = const BalancesList()});

  final BalancesStatus status;
  final BalancesList list;
  
  @override
  List<Object> get props => [status, list];

  BalancesState copyWith({
    BalancesStatus? status,
    BalancesList? list,
  }) {
    return BalancesState(
      status: status ?? this.status,
      list: list ?? this.list
    );
  }
}

