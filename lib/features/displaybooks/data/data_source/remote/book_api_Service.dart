import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constant.dart';
import 'package:bookstore/features/displaybooks/data/models/Book.dart';
import 'package:dio/dio.dart';
part 'book_api_Service.g.dart';

@RestApi(baseUrl: bookAPIBaseUrl)
abstract class BookApiService {
  factory BookApiService(Dio dio) = _BookApiService;

  @GET('/books/')
  Future<HttpResponse<List<BookModel>>> GetBooksEntity();
}
