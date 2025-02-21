import 'package:basic_flutter_api/api/api_service.dart';
import 'package:basic_flutter_api/models/product_model.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();

    final _formKey = GlobalKey<FormState>();

    String title = "";
    String category = "";
    double price = 0.0;
    String description = "";
    String imageUrl = "";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          "Add a Product",
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
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
                  decoration: InputDecoration(
                    labelText: "price",
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
                      return "Please Enter a Price";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    price = double.parse(value!);
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
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
                      return "Please Enter a Description";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    description = value!;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Image URl",
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
                      return "Please Enter a ImageURL";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    imageUrl = value!;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
        
                      ProductModel product = ProductModel(
                        category: category,
                        title: title,
                        price: price,
                        description: description,
                        image: imageUrl,
                      );
                      apiService.addProduct(product).then((value){
                        if(context.mounted) {
                          Navigator.pop(context);
                        }
                      });
                    }
                  },
                  child: Text(
                    "Add a Product",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
