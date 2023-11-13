// ignore_for_file: unnecessary_new, prefer_final_fields, unused_field, prefer_const_constructors, must_be_immutable, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'produto.dart';
import 'produto_repository.dart';


class ProdutoEdit extends StatefulWidget {
  Produto produto;
  int index;

  ProdutoEdit(this.produto, this.index, {super.key});
  

  @override
  State<ProdutoEdit> createState() => _ProdutoEditState();
}

class _ProdutoEditState extends State<ProdutoEdit> {
  
  ProdutoRepository produtoRepo = new ProdutoRepository();
  @override
  TextEditingController _nomeEdit = new TextEditingController();
  TextEditingController _quantidadeEdit = TextEditingController();
  TextEditingController _codigoEdit = TextEditingController();
    TextEditingController _precoEdit = TextEditingController();


  String nome = "";
  int quantidade = 0;
  String codigo = "";
  double preco = 0;

  GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();

  @override
  void initState() {
    _nomeEdit.text = widget.produto.nome;
    _quantidadeEdit.text = widget.produto.quantidade.toString();
    _codigoEdit.text = widget.produto.codigo.toString();
    _precoEdit.text = widget.produto.preco.toString();
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,



        appBar: AppBar   (
backgroundColor: Color.fromARGB(255, 11, 4, 31), 
        


         iconTheme: IconThemeData(color: Colors.black)
         ,
        
          title: Text('Edição de ' + widget.produto.nome, style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)), ),   ),

      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
         
        key: _formKey2,
        child: Column(children: [


           SizedBox(height: 20),

          TextFormField(
              controller: _nomeEdit,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O nome não pode ser vazio.';
                } else {}
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite o nome do produto',
                border: OutlineInputBorder(),
              )),
          
           SizedBox(height: 20),
      
      
          TextFormField(
              controller: _codigoEdit,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'O código não pode ser vazio.';
                } else {
                  if (value.length < 3) {
                    return 'O código deve ter mais de 3 caracteres.';
                  }
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Código',
                hintText: 'Digite o código do produto',
                border: OutlineInputBorder(),
              )),
      
      
      
       SizedBox(height: 20),
      
          TextFormField(
              controller: _quantidadeEdit,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'A quantidade não pode ser vazia.';
                } else {
                  if (int.parse(_quantidadeEdit.text) < 0) {
                    return 'A quantidade deve ser maior que 0.';
                  }
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'quantidade',
                hintText: 'Digite quantidade',
                border: OutlineInputBorder(),
              )),
      
       SizedBox(height: 20),

          TextFormField(
              controller: _precoEdit,
            
              validator: (value) {
                if (value!.isEmpty) {
                  return 'O preço não pode ser vazia.';
                } else {
                  if (value.length < 0) {
                    return 'O preço deve ser maior que 0.';
                  }
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'preço',
                hintText: 'Crie um preço',
                border: OutlineInputBorder(),
              )),
               SizedBox(height: 20),

          ElevatedButton(onPressed: () {
            if (_formKey2.currentState!.validate()) {
              String nome = _nomeEdit.text;
              int quantidade = int.parse(_quantidadeEdit.text);
              int codigo = int.parse(_codigoEdit.text);
              int preco = int.parse(_precoEdit.text);
              Produto produto = new Produto.produtoupdate(
                codigo: codigo,
                preco: preco,
                nome: nome,
                quantidade: quantidade
              );
              ProdutoRepository.getProdutos()[widget.index] = produto;
      
      
              mostrarMsgSucesso();
              
              Navigator.pushNamed(context, '/Consulta');
      
      
        
      
                  
            }
          }, child: Text("Atualizar"))
        ]),
          ),
      ));
  }

  
   void mostrarMsgSucesso ()
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar (content:Text('Produto alterado com sucesso')));
  }




}
