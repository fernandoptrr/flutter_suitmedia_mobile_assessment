part of 'list_user_cubit.dart';

abstract class ListUserState extends Equatable {
  const ListUserState();

  @override
  List<Object> get props => [];
}

class ListUserInitial extends ListUserState {}

class ListUserLoaded extends ListUserState {
  final List<User> listUser;

  const ListUserLoaded({
    required this.listUser,
  });

  @override
  List<Object> get props => [listUser];

  @override
  String toString() => 'ListUserLoaded(listUser: $listUser)';
}

class ListUserLoadingFailed extends ListUserState {
  final String message;

  const ListUserLoadingFailed({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'ListUserLoadingFailed(message: $message)';
}
