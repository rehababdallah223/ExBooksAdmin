import 'package:admin_gp/dummy-data.dart';
import 'package:admin_gp/models/category.dart';
import 'package:admin_gp/widgets/new-category.dart';
import 'package:flutter/material.dart';

class AdminCategoriesScreen extends StatefulWidget {
  @override
  _AdminCategoriesScreenState createState() => _AdminCategoriesScreenState();
}

class _AdminCategoriesScreenState extends State<AdminCategoriesScreen> {

  void removeCategory (String id)
  {

    setState(() {
      DUMMY_CATEGORIES.removeWhere((category){
        return category.id == id;
      });
    });

  }

  //-------------- function of add new category ------------------
  void addNewCategory(String categoryTitle, String categoryid) {
    final newcat = Category(
        id: categoryid,
      title: categoryTitle,
    );
    setState(() {
      DUMMY_CATEGORIES.add(newcat);
    });
  }

  //---------------------------------'
//---------------------function of pop up the add new category ---------------
  void showAddNewCategory(
      BuildContext ctx,
      ) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewCategory(addNewCategory),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  //------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return CategoryItem(
              id: DUMMY_CATEGORIES[index].id,
              title: DUMMY_CATEGORIES[index].title,
              removeCategoy: removeCategory,

            );
          },
          itemCount: DUMMY_CATEGORIES.length,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showAddNewCategory(context);
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Function removeCategoy ;

  const CategoryItem({
    @required this.id,
    @required this.title,
    @required this.removeCategoy
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),

        trailing: IconButton(
          onPressed: () => removeCategoy(id),
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
