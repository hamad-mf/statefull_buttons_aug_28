import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dropvalue;
  bool? a = true;
  bool onoroff = true;
  String? Gender = "";
  bool r2 = true;
  bool r3 = true;

  List<String> countries = [
    'United States',
    'Canada',
    'Australia',
    'India',
    'Germany',
    'France',
    'Brazil',
    'Japan',
    'South Africa',
    'Mexico'
  ];

  @override
  Widget build(BuildContext context) {
     final List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];
    String? selectedItem; // To store the selected item
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Checkbox(
              value: a,
              onChanged: (value) {
                a = value;
                print(a);
                setState(() {});
              }),
          Switch(
              value: onoroff,
              onChanged: (value) {
                onoroff = value;
                setState(() {});
              }),
          RadioListTile(
              title: Text("male"),
              value: "male",
              groupValue: Gender,
              onChanged: (value) {
                Gender = value;
                setState(() {});
              }),
          RadioListTile(
              title: Text("female"),
              value: "female",
              groupValue: Gender,
              onChanged: (value) {
                Gender = value;
                setState(() {});
              }),
          RadioListTile(
              title: Text("others"),
              value: "others",
              groupValue: Gender,
              onChanged: (value) {
                Gender = value;
                setState(() {});
              }),
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("profile"),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      child: Text("settings"),
                      onTap: () {},
                    )
                  ]),
          DropdownButton(
            value: dropvalue,
            items: List.generate(
              countries.length,
              (index) => DropdownMenuItem(
                child: Text(countries[index]),
                value: countries[index],
              ),
            ),
            onChanged: (value) {
              print(value);
              dropvalue = value;
              setState(() {});
            },
          ),
          ExpansionTile(
            title: Text("my tile"),
            backgroundColor: Colors.blue,
            collapsedBackgroundColor: Colors.green,
            children: [
              Container(
                height: 200,
                color: Colors.red,
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Exit"),
                    content: Text("Do you want to Exit"),
                    actions: [
                      ElevatedButton(onPressed: () {}, child: Text("Yes")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("No"))
                    ],
                  ),
                );
              },
              child: Text("Alert")),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => StatefulBuilder(
                          builder: (context, setBottomState) => Checkbox(
                              value: a,
                              onChanged: (value) {
                                a = value;
                                print(a);
                                setState(() {});
                              }),
                        ));
              },
              child: Text("bottom sheet")),













              DropdownButton<String>(
                  value: selectedItem,
                  hint: Text("select an item"),
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (String? newvalue) {
                    setState(() {
                      selectedItem = newvalue;
                    });
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
        ]),
      ),
    );
  }
}
