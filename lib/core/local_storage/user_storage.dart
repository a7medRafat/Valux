import 'package:hive/hive.dart';
import 'package:valux/features/profile/data/models/GetProfileModel.dart';
import 'hive_keys.dart';
import 'local_storage.dart';

class UserData implements LocalStorage<ProfileData> {
  static Box<ProfileData>? _box;

  @override
  Future<void> init() async {
    _box = await Hive.openBox(Keys.user);
  }

  @override
  ProfileData? getData({required String id}) => _box!.get(id);

  @override
  Future<void> saveData(
      {required String id, required ProfileData data}) async {
    await _box!.put(id, data);
    await _box!.flush();
  }

  @override
  Future<void> deleteData({required String id}) async {
    await _box!.delete(id);
  }
}
