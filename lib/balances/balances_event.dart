part of 'balances_bloc.dart';

sealed class BalancesEvent extends Equatable {
  const BalancesEvent();

  @override
  List<Object> get props => [];
}

final class BalancesFetched extends BalancesEvent {}
