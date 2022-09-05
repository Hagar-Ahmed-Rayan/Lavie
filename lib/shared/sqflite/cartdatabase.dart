import 'package:plantsshop/models/modelcart.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  static late Database dataBase;
  static String dbName = "cartitems.db";
  static const String tableName = "cart_productsitems";
//int
  static Future<void> initDB({
    String tableName = tableName,
  }) async {
    dataBase = await openDatabase(
      dbName,
      version: 1,
      onCreate: (Database database, int x) async {
        await onCreateDataBase(database: database);
      },
    );
  }
//oncreate
  static Future<void> onCreateDataBase({
    required Database database,
    String tableName = tableName,
  }) async {
    await database.execute(
        'CREATE TABLE $tableName(product_id TEXT PRIMARY KEY, name TEXT, image_url TEXT, quantity INTEGER,price INTEGER)');
  }
///close
  ///
  ///
  static Future<void> closeDataBase() async {
    return await dataBase.close();
  }


//insert
  static Future<void> insertProduct(CartModel cartModel, {String tableName = tableName,}) async
  {
    await dataBase.rawInsert(
      'INSERT INTO $tableName(product_id, name, image_url, quantity,price) VALUES(?, ?, ?, ?,?)',
      [cartModel.id, cartModel.name, cartModel.imageUrl, cartModel.quantity,cartModel.price],
    );
  }

  static Future<void> updateProductQuantity(String id, int quantity, {String tableName = tableName}) async
  {
    await initDB();
    await dataBase.rawUpdate(
      'UPDATE $tableName SET quantity = ? WHERE product_id = ?',
      [
        quantity,
        id,
      ],
    );
  }
///////////////
  //Future<List<Map<String, Object?>>>

      static Future<List<Map<String, dynamic>>> getAllCartProducts({String tableName = tableName}) async

  {
    await initDB();
    return await dataBase.rawQuery('SELECT * FROM $tableName');
  }
//delete
  static Future<void> deleteRecorde(String id, {String tableName = tableName}) async {
    await initDB();
    await dataBase.rawDelete(
      'DELETE FROM $tableName WHERE product_id = ?',
      [
        id,
      ],
    );
  }
}
