import 'package:flutter/material.dart';

          import 'custom_button.dart';

          class TodoWidget extends StatelessWidget {
            final TextEditingController _controller = TextEditingController();
            final List<String> _statusOptions = ["Pending", "Completed"];
            String _selectedStatus = "Pending";

            @override
            Widget build(BuildContext context) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [

                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(hintText: "Enter a task"),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5
                                ),
                                child: DropdownButton<String>(
                                  value: _selectedStatus,
                                  onChanged: (newValue) {},
                                  items: _statusOptions.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )

                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 100000,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("Task Today"),
                          leading: Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {},
                          ),
                        );
                      },
                    ),
                  ),

                   CustomButton(
                     text: "Add Task",
                     icon: Icons.add,
                   )

                ],
              );
            }
          }