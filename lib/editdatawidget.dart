import 'package:flutter/material.dart';
import 'models/tenis.dart';
import 'services/api_service.dart';



enum Status { positive, dead, recovered }

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.tenis);

  final Tenis tenis;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _modeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _tamanhoController = TextEditingController();
  final _precoController = TextEditingController();
  String status = 'positive';
  Status _status = Status.positive;

 
  void initState() {
    id = widget.tenis.id;
    _modeloController.text = widget.tenis.modelo;
    _marcaController.text = widget.tenis.marca;
    _tamanhoController.text = widget.tenis.tamanho.toString();
    _precoController.text = widget.tenis.preco;
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar'),
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
                                    return 'inserir modelo';
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
                                    return 'inserir marca';
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
                                    return 'inserir tamanho';
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
                                    return 'inserir preco';
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
                                    api.updateTenis(
                                        id,
                                        Tenis(
                                            id: '',
                                            modelo: _modeloController.text,
                                            marca: _marcaController.text,
                                            tamanho: int.parse(_tamanhoController.text),
                                            preco: _precoController.text,
                                           
                                            
                                            ));

                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('Salvar',
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
