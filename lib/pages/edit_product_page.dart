import 'package:basic_flutter_api/api/api_service.dart';
import 'package:basic_flutter_api/models/product_model.dart';
import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  final ProductModel product;

  const EditProductPage({super.key, required this.product});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final ApiService apiService = ApiService();

  final _formKey = GlobalKey<FormState>();

  late String title;
  late String category;
  late double price;
  late String description;
  late String image;

  @override
  void initState() {
    super.initState();
    title = widget.product.title;
    category = widget.product.category;
    price = widget.product.price;
    description = widget.product.description;
    image = widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 155, 175, 138),
            size: 30,
          ),
        ),
        title: Text(
          "Edit Product",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 155, 175, 138),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: title,
                      decoration: InputDecoration(
                        labelText: "Title",
                        fillColor: const Color.fromARGB(255, 224, 224, 224),
                        filled: true,
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter a Title";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        title = value!;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      initialValue: category,
                      decoration: InputDecoration(
                        labelText: "Category",
                        fillColor: const Color.fromARGB(255, 224, 224, 224),
                        filled: true,
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter the Category";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        category = value!;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      initialValue: price.toString(),
                      decoration: InputDecoration(
                        labelText: "Price",
                        fillColor: const Color.fromARGB(255, 224, 224, 224),
                        filled: true,
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter the Price";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        price = double.parse(value!);
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      initialValue: description,
                      decoration: InputDecoration(
                        labelText: "Description",
                        fillColor: const Color.fromARGB(255, 224, 224, 224),
                        filled: true,
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter the Description";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        description = value!;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      initialValue: image,
                      decoration: InputDecoration(
                        labelText: "Image URL",
                        fillColor: const Color.fromARGB(255, 224, 224, 224),
                        filled: true,
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 136, 169, 185),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter the ImageUrl";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        image = value!;
                      },
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          ProductModel updateProduct = ProductModel(
                            category: category,
                            title: title,
                            price: price,
                            description: description,
                            image: image,
                          );
                          try {
                            apiService.updateProduct(
                              widget.product.id!,
                              updateProduct,
                            );
                            Navigator.pop(context);
                          } catch (error) {
                            throw Exception("Error: $error");
                          }
                        }
                      },
                      child: Text(
                        "Update Product",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
