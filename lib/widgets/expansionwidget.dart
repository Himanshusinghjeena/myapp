// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, avoid_function_literals_in_foreach_calls, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:myapp/widgets/userApi.dart';

class AccordianWidget extends StatefulWidget {
  const AccordianWidget({super.key});

  @override
  State<AccordianWidget> createState() => _AccordianWidgetState();
}

class _AccordianWidgetState extends State<AccordianWidget> {
  late Future<List<UserDto>> _futureData;
  late List<bool> _isExpanded;

  @override
  void initState() {
    super.initState();
    _futureData = callServices();
  }

  Future<List<UserDto>> callServices() async {
    List<dynamic> apiDataGetData = await userDataService().getData();
    List<UserDto> apiFinalData = await userDataService().mapdata(apiDataGetData);
    _isExpanded = List.generate(apiFinalData.length, (index) => false); 
    return apiFinalData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Accordian Widget', style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<List<UserDto>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            List<UserDto> apiFinalData = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                color: Colors.amber[100],
                child: ExpansionPanelList(
                  expansionCallback: (index, isExpanded) {
                    setState(() {
                      _isExpanded[index] = isExpanded;
                    });
                  },
                  children: apiFinalData.map((user) {
                    int index = apiFinalData.indexOf(user);
                    return ExpansionPanel( 
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title:  Text('id: ${user.id ?? 'No id'}'),
                          subtitle: Text('phone: ${user.name ?? 'No name'}'),

                        );
                      },
                      isExpanded: _isExpanded[index],
                      body: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromARGB(255, 154, 255, 253),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                          child: Column(
                            children: [
                              Text('phone: ${user.phone ?? 'No phone'}'),
                              Text('Street: ${user.userAddress?.street ?? 'No Street'}'),
                              Text('Zipcode: ${user.userAddress?.zipcode ?? 'No Zipcode'}')
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
