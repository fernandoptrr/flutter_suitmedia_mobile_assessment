import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_suitmedia_mobile_assessment/models/api_return_value.dart';
import 'package:flutter_suitmedia_mobile_assessment/models/user.dart';
import 'package:flutter_suitmedia_mobile_assessment/services/user_service.dart';

part 'list_user_state.dart';

class ListUserCubit extends Cubit<ListUserState> {
  ListUserCubit() : super(ListUserInitial());

  Future<void> getListUser({required int page}) async {
    if (page == 1) emit(ListUserInitial());

    final ApiReturnValue<List<User>> result =
        await UserService().getListUser(page: 1);

    if (result.value != null) {
      emit(ListUserLoaded(listUser: result.value!));
    } else {
      emit(ListUserLoadingFailed(message: result.message!));
    }
  }
}
