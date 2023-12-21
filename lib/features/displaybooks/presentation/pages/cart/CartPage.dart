import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookstore/features/displaybooks/presentation/Blocs/local/bloc/local_bok_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../injection_container.dart';
import '../../Blocs/Theme/themeCubit.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LocalBokBloc>()..add(const getSavedBooks()),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 31.h, 10, 10),
          child: Column(
            children: [
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
                      SizedBox(
                        width: 5.w,
                      ),
                      //switch theme
                      GestureDetector(
                        onTap: () {
                          context.read<AppthemeCubit>().init();
                          final snackBar = SnackBar(
                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Book Removed!',
                              message: 'book removed from cart!',
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
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
                                  : Icon(Icons.dark_mode,
                                      color: TColor.serconday);
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: BlocBuilder<LocalBokBloc, LocalBokState>(
                    builder: (context, state) {
                  if (state is localBookLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is localbookDone) {
                    return ListView.builder(
                      itemCount: state.books!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150.h,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      // color: Colors.amber,
                                      image: DecorationImage(
                                          image: NetworkImage(state
                                              .books![index].simpleThumb))),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 24.0.h),
                                      child: Text(
                                        state.books![index].title,
                                        style: textTheme.labelLarge!.copyWith(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 4),
                                      ),
                                    ),
                                    Text(state.books![index].author,
                                        style: textTheme.labelLarge!.copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 3,
                                            color: TColor.primary)),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        context.read<LocalBokBloc>().add(
                                            removeBook(state.books![index]));
                                      },
                                      child: Container(
                                          height: 45.h,
                                          width: 45.w,
                                          decoration: BoxDecoration(
                                              color: TColor.serconday
                                                  .withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Icon(
                                            Icons.delete,
                                            color: TColor.serconday,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return SizedBox();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
