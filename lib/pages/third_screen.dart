import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suitmedia_mobile_assessment/components/custom_app_bar.dart';
import 'package:flutter_suitmedia_mobile_assessment/components/shimmer_loading.dart';
import 'package:flutter_suitmedia_mobile_assessment/components/user_item_card.dart';
import 'package:flutter_suitmedia_mobile_assessment/cubits/list_user_cubit.dart';
import 'package:flutter_suitmedia_mobile_assessment/models/user.dart';
import 'package:flutter_suitmedia_mobile_assessment/pages/second_screen.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/colors.dart';
import 'package:flutter_suitmedia_mobile_assessment/theme/theme.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  static const nameRoute = '/third';

  @override
  Widget build(BuildContext context) {
    context.read<ListUserCubit>().getListUser(page: 1, perPage: 6);
    return Scaffold(
      appBar: CustomAppBar(title: "Third Page"),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await context
                .read<ListUserCubit>()
                .getListUser(page: 1, perPage: 6);
          },
          child: BlocBuilder<ListUserCubit, ListUserState>(
            builder: (context, state) {
              if (state is ListUserInitial) {
                return ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: 12,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  itemBuilder: (context, index) {
                    return ShimmerLoading(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8);
                  },
                );
              } else if (state is ListUserLoaded) {
                final List<User> users = state.listUser;
                return ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: users.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 26),
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return UserItemCard(
                      title: "${user.firstName ?? ""} ${user.lastName ?? ""}",
                      subtitle: user.email ?? "-",
                      imagePath: user.avatar ?? "-",
                      onTapped: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(
                                userName: "${user.firstName} ${user.lastName}"),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(height: 0.5, color: AppColor.ink);
                  },
                );
              } else {
                if (state is ListUserLoadingFailed) {
                  debugPrint(state.toString());
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/undraw.png",
                      height: 150,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Something Went Wrong",
                      style: AppTheme.h3,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
