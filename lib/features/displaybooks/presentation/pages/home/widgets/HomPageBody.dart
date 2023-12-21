import 'package:bookstore/core/constants/constant.dart';
import 'package:bookstore/features/displaybooks/presentation/Blocs/local/bloc/local_bok_bloc.dart';
import 'package:bookstore/features/displaybooks/presentation/pages/cart/CartPage.dart';
import 'package:bookstore/features/displaybooks/presentation/pages/home/widgets/filterTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Blocs/Theme/themeCubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Blocs/bloc/remote_book_bloc.dart';
import '../../details/BookDetailsPage.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 31.h, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // appbar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8)),
                child: Icon(
                  Icons.sort,
                  color: TColor.primary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CartPage(),
                              ));
                        },
                        child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: TColor.serconday.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8)),
                          child: Icon(
                            Icons.shopping_bag,
                            color: TColor.serconday,
                          ),
                        ),
                      ),
                      BlocBuilder<LocalBokBloc, LocalBokState>(
                        builder: (context, state) {
                          int booksLength = state.books?.length ?? 0;
                          return Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: TColor.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                '$booksLength',
                              )));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  //switch theme
                  GestureDetector(
                    onTap: () {
                      context.read<AppthemeCubit>().init();
                    },
                    child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: BoxDecoration(
                          color: TColor.serconday.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8)),
                      child: BlocBuilder<AppthemeCubit, bool>(
                        builder: (context, state) {
                          return state
                              ? Icon(
                                  Icons.sunny,
                                  color: TColor.serconday,
                                )
                              : Icon(Icons.dark_mode, color: TColor.serconday);
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          // discover book text
          Text(
            'Discover books',
            style: GoogleFonts.catamaran(
                fontWeight: FontWeight.w900, fontSize: 40.sp, height: 1),
          ),
          // book horizz list view
          const FilterTabBar(),

          // authore follow row
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Authors to follow',
                  style: GoogleFonts.catamaran(
                      fontWeight: FontWeight.w900,
                      fontSize: 20.sp,
                      height: 1,
                      letterSpacing: 3)),
              Text('show all',
                  style: textTheme.labelLarge!.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                    color: Colors.grey.withOpacity(0.5),
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 200,
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
                      itemCount: state.books!.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookDetailsPage(book: state.books![index]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              height: 100.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  color: TColor.serconday.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 1,
                                        blurRadius: 12,
                                        offset: const Offset(4, 10))
                                  ]),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image(
                                        image: NetworkImage(
                                            state.books![index].simpleThumb)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(state.books![index].author,
                                          style: textTheme.labelMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  letterSpacing: 3)),
                                      Text(
                                        state.books![index].slug,
                                        style: textTheme.labelLarge!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                            color: TColor.primary,
                                            letterSpacing: 3),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
