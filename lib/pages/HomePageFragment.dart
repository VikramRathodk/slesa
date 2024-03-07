import 'package:Note/utility/notecard.dart';
import 'package:flutter/material.dart';
import '../models/NotesCategories.dart';

class HomePageFragment extends StatefulWidget {
  @override
  _HomePageFragmentState createState() => _HomePageFragmentState();
}

class _HomePageFragmentState extends State<HomePageFragment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<NotesCategories> notescategories = [
    NotesCategories(CategoryId: "1", CategoryName: "All"),
    NotesCategories(CategoryId: "2", CategoryName: "Personal"),
    NotesCategories(CategoryId: "3", CategoryName: "Work"),
    NotesCategories(CategoryId: "4", CategoryName: "Study"),
    NotesCategories(CategoryId: "5", CategoryName: "Shopping"),
    NotesCategories(CategoryId: "6", CategoryName: "Health"),
    NotesCategories(CategoryId: "7", CategoryName: "Study"),
    NotesCategories(CategoryId: "8", CategoryName: "Shopping"),
    NotesCategories(CategoryId: "9", CategoryName: "Health"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: notescategories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //title and add new note button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Your Notes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.black,size: 32,),
                  onPressed: () {
                    //navigation to add new note
                  },
                ),
              ],
            ),
          ),

          // Tab bar
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[100],
            ),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              automaticIndicatorColorAdjustment: true,
              tabs: notescategories
                  .map(
                    (e) => Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Tab(text: e.CategoryName),
                    ),
                  )
                  .toList(),
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: notescategories.map((category) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: 10, // Change itemCount as needed
                  itemBuilder: (context, index) {
                    return NoteCard(
                      title: "Item ${index + 1}",
                      content:
                          'Lorem ipsum dolor sit amfsfsffa afkja fkjaf lkajflkjaf kljalkfjlkajflkjfj et, f fs sffsf sf afakjf lkjafakfja foiafoiuf aoifuoiaufoi uafoiuof sfsfsfsadipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', onDelete: (){},
                    );
                  },
                );
              }).toList(),
            ),
          ),

          // Tab content
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
