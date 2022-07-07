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

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key, required this.headerName}) : super(key: key);

  final String headerName;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int page = 1;
  List<User> users = [];

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<ListUserCubit>().getListUser(page: page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        debugPrint("Page: $page");
        context.read<ListUserCubit>().getListUser(page: page);
        setState(() {
          users;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Third Page"),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            users.clear();
            await context.read<ListUserCubit>().getListUser(page: 1);
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
                users.addAll(state.listUser);
                return ListView.separated(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: users.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 26),
                  itemBuilder: (context, index) {
                    if (index < users.length) {
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
                                      headerName: widget.headerName,
                                      userName:
                                          "${user.firstName} ${user.lastName}",
                                    )),
                          );
                        },
                      );
                    } else {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
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
