import 'package:flutter/material.dart';
import 'models/tenis.dart';
import 'services/api_service.dart';

enum marca { male, female }

enum Status { positive, dead, recovered }

class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  final _modeloController = TextEditingController();
 final _tamanhoController = TextEditingController();
  final _precoController = TextEditingController();
  final _marcaController = TextEditingController();
  String status = 'positive';
  Status _status = Status.positive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Tenis'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('modelo'),
                              TextFormField(
                                controller: _modeloController,
                                decoration: const InputDecoration(
                                  hintText: 'modelo',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Inserir modelo';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                       Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('marca'),
                              TextFormField(
                                controller: _marcaController,
                                decoration: const InputDecoration(
                                  hintText: 'marca',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Inserir marca';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('tamanho'),
                              TextFormField(
                                controller: _tamanhoController,
                                decoration: const InputDecoration(
                                  hintText: 'tamanho',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Inserir tamanho';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('preco'),
                              TextFormField(
                                controller: _precoController,
                                decoration: const InputDecoration(
                                  hintText: 'preco',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Inserir preco';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        
                        
                       
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.createTenis(Tenis(
                                        modelo: _modeloController.text,
                                        marca: _marcaController.text,
                                        tamanho: int.parse(_tamanhoController.text),
                                        preco: _precoController.text,
                                        id: ''));

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Save',
                                    style: TextStyle(color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
