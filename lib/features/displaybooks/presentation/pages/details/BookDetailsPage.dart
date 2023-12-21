import 'package:bookstore/core/constants/constant.dart';
import 'package:bookstore/features/displaybooks/domain/entites/BookEntity.dart';
import 'package:bookstore/features/displaybooks/presentation/Blocs/local/bloc/local_bok_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsPage extends StatelessWidget {
  static const routeName = '-/book-detail';
  final BookEntity book;
  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: 450.h,
                  width: 360.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(book.simpleThumb),
                          fit: BoxFit.cover),
                      color: Colors.pink),
                ),
                Positioned(
                  top: 50.h,
                  left: 10.h,
                  child: Row(
                    children: [
                      Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8)),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back),
                            color: TColor.primary,
                          )),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        book.author,
                        style: textTheme.labelLarge!.copyWith(
                            color: TColor.background,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 10),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 200.h,
                    left: 70.h,
                    child: Text(
                      book.title,
                      style: textTheme.labelLarge!.copyWith(
                        color: TColor.background,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 10,
                      ),
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: TColor.background,
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 22),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: textTheme.labelLarge!.copyWith(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 8),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              book.author,
                              style: textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                  color: TColor.serconday),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                                'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using making it look like readable English.',
                                style: textTheme.labelMedium!.copyWith(
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                )),
                            const SizedBox(
                              height: 80,
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<LocalBokBloc>()
                                        .add(saveBook(book));
                                    // Scaffold.of(context).showSnackBar(const SnackBar(content: content));
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: 200.w,
                                    decoration: BoxDecoration(
                                        color: TColor.primary,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                        child: Text('Get a copy',
                                            style: textTheme.labelMedium!
                                                .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22.sp,
                                                    color: TColor.background,
                                                    letterSpacing: 4))),
                                  ),
                                ))
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
