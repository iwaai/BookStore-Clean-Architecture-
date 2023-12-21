import 'package:bookstore/core/constants/constant.dart';
import 'package:bookstore/features/displaybooks/presentation/pages/cart/CartPage.dart';
import 'package:bookstore/features/displaybooks/presentation/pages/home/widgets/filterTabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Blocs/Theme/themeCubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
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
          const FilterTabBar(),
          // book horizz list view
          // authore follow row
        ],
      ),
    );
  }
}
