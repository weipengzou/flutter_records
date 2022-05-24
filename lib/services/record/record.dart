import 'package:records/common/index.dart' show DioClient, RecordScheme;

class RecordAPI {
  static final dio = DioClient().instance;
  Future<List<RecordScheme>> getRecordList() async {
    // print('getUserInfo');
    final res = await dio.post('/records/pageFind');
    final recordList = (res.data as List<dynamic>)
        .map((e) => RecordScheme.fromMap(e))
        .toList();
    return recordList;
  }

  createRecord({
    required String title,
    required String content,
  }) async {
    final res = await dio.post('/records', data: {
      'title': title,
      'content': content,
    });
    return RecordScheme.fromMap(res.data);
  }
}
