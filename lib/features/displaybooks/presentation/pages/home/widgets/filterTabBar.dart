import 'package:bookstore/core/constants/constant.dart';
import 'package:bookstore/features/displaybooks/presentation/pages/details/BookDetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Blocs/Theme/themeCubit.dart';
import '../../../Blocs/bloc/remote_book_bloc.dart';

class FilterTabBar extends StatefulWidget {
  const FilterTabBar({super.key});

  @override
  State<FilterTabBar> createState() => _FilterTabBarState();
}

class _FilterTabBarState extends State<FilterTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          BlocBuilder<AppthemeCubit, bool>(
            builder: (context, state) {
              return Container(
                height: 40.h,
                decoration: BoxDecoration(
                    color: state
                        ? Colors.white.withOpacity(0.5)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 8,
                          blurRadius: 12,
                          offset: const Offset(0, 8))
                    ]),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0.h),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: TColor.primary,
                    controller: _tabController,
                    labelColor: TColor.primary,
                    labelStyle: textTheme.labelLarge!.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3),
                    unselectedLabelColor: Colors.grey.withOpacity(0.5),
                    tabs: const [
                      Tab(
                        text: 'CLASSICS',
                      ),
                      Tab(
                        text: 'NEW',
                      ),
                      Tab(
                        text: 'UPCOMING',
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                      height: 500.h,
                      width: 100.w,
                      child: BlocBuilder<RemoteBookBloc, RemoteBookState>(
                        builder: (_, state) {
                          if (state is RemoteBooksLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: TColor.serconday,
                              ),
                            );
                          }
                          if (state is RemoteBooksFailed) {
                            return const Center(
                              child: Icon(Icons.refresh),
                            );
                          }
                          if (state is RemoteBooksDone) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.books!.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookDetailsPage(
                                              book: state.books![index]),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        height: 200.h,
                                        width: 200.w,
                                        child: Column(
                                          children: [
                                            Container(
                                              //
                                              height: 200.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 3,
                                                        blurRadius: 2,
                                                        offset:
                                                            const Offset(0, 8))
                                                  ],
                                                  // color: Colors.blue,
                                                  image: DecorationImage(
                                                      image: NetworkImage(state
                                                          .books![index]
                                                          .simpleThumb))),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              state.books![index].title,
                                              style: textTheme.labelLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                            ),
                                            Text(state.books![index].author,
                                                style: textTheme.labelMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                        color:
                                                            TColor.serconday))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                          return const SizedBox();
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                      height: 500.h,
                      width: 100.w,
                      child: BlocBuilder<RemoteBookBloc, RemoteBookState>(
                        builder: (_, state) {
                          if (state is RemoteBooksLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: TColor.serconday,
                              ),
                            );
                          }
                          if (state is RemoteBooksFailed) {
                            return const Center(
                              child: Icon(Icons.refresh),
                            );
                          }
                          if (state is RemoteBooksDone) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.books!.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookDetailsPage(
                                              book: state.books![index]),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        height: 200.h,
                                        width: 200.w,
                                        child: Column(
                                          children: [
                                            Container(
                                              //
                                              height: 200.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 3,
                                                        blurRadius: 2,
                                                        offset:
                                                            const Offset(0, 8))
                                                  ],
                                                  // color: Colors.blue,
                                                  image: DecorationImage(
                                                      image: NetworkImage(state
                                                          .books![index]
                                                          .simpleThumb))),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              state.books![index].title,
                                              style: textTheme.labelLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                            ),
                                            Text(state.books![index].author,
                                                style: textTheme.labelMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                        color:
                                                            TColor.serconday))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                          return const SizedBox();
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                      height: 500.h,
                      width: 100.w,
                      child: BlocBuilder<RemoteBookBloc, RemoteBookState>(
                        builder: (_, state) {
                          if (state is RemoteBooksLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: TColor.serconday,
                              ),
                            );
                          }
                          if (state is RemoteBooksFailed) {
                            return const Center(
                              child: Icon(Icons.refresh),
                            );
                          }
                          if (state is RemoteBooksDone) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.books!.length,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookDetailsPage(
                                              book: state.books![index]),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        height: 200.h,
                                        width: 200.w,
                                        child: Column(
                                          children: [
                                            Container(
                                              //
                                              height: 200.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        spreadRadius: 3,
                                                        blurRadius: 2,
                                                        offset:
                                                            const Offset(0, 8))
                                                  ],
                                                  // color: Colors.blue,
                                                  image: DecorationImage(
                                                      image: NetworkImage(state
                                                          .books![index]
                                                          .simpleThumb))),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              state.books![index].title,
                                              style: textTheme.labelLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                            ),
                                            Text(state.books![index].author,
                                                style: textTheme.labelMedium!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                        color:
                                                            TColor.serconday))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          }
                          return const SizedBox();
                        },
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
