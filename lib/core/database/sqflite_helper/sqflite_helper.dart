import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/features/task/data/model/task_model.dart';

class SqfliteHelper {
  late Database database;

  Future<void> initializeDatabase() async {
    database = await initDb();
  }
  //create db
  //create table
  //insert to db create
  //get from db  read
  //update db update
  //delete from db delete

//init db
  Future<Database> initDb() async {
    return await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE tasks( 
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            note TEXT,
            date TEXT,
            starttime TEXT,
            endtime TEXT,
            color INTEGER,
            iscompleted INTEGER
          )
''').then((value) => print('Db table is created'));
      },
      onOpen: (db) => print('Db is opened'),
    ).catchError(
      (error) {
        print('Error when open db $error');
      },
    );
  }

// get data from db
  Future<List<Map<String, dynamic>>> getTasks() async {
    return await database.rawQuery('SELECT * FROM tasks');
  }

  //insert data to db
  Future<int> insertTask(TaskModel taskmodel) async {
    return await database.rawInsert('''
    INSERT INTO tasks(
    title,
    note,
    date,
    starttime,
    endtime,
    color,
    iscompleted
    ) VALUES(
    '${taskmodel.title}',
    '${taskmodel.note}',
   ' ${taskmodel.date}',
   ' ${taskmodel.starttime}',
    '${taskmodel.endtime}',
   ' ${taskmodel.color}',
   ' ${taskmodel.isCompleted}'
    )
''');
  }

  //update data to db
  Future<int> updateTask(int id) async {
    return await database.rawUpdate('''
    UPDATE tasks
     SET iscompleted = ?
      WHERE id = ?
''', [1, id]);
  }

  //delete data from db
  Future<int> deleteTask(int id) async {
    return await database.rawDelete('''
    DELETE FROM tasks
    WHERE id = ?
''', [id]);
  }
}
