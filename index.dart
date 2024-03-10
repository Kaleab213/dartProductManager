import 'dart:io';

void main() {
  List<Product> products = [];
  ProductManager productManager = ProductManager();

  print("");
  print("");
  print("Welcome!!!");
  while (true) {
    print("");
    print("");
    print("to view the list of all available products insert 1");
    print("to view the list of completed products insert 2");
    print("to view the list of only pending products insert 3");
    print("to add a new product insert 4");
    print("to edit a product insert 5");
    print("to delete a product insert 6");
    print("");

    String? val = stdin.readLineSync();
    print("");
    if (val == '1') {
      productManager.viewProducts(products);
    } else if (val == "2") {
      productManager.viewCompletedProducts(products);
    } else if (val == "3") {
      productManager.viewPendingProducts(products);
    } else if (val == "4") {
      productManager.addProduct(products);
    } else if (val == "5") {
      productManager.editProduct(products);
    } else if (val == "6") {
      productManager.deleteProduct(products);
    }
  }
}

class Product {
  String? name, description, image, price, status;

  Product(String name, String description, String image, String price,
      String status) {
    this.name = name;
    this.description = description;
    this.image = image;
    this.price = price;
    this.status = status;
  }
}

class ProductManager {
  void addProduct(List<Product> products) {
    String name = '';
    while (name == '') {
      print("name:");
      name = stdin.readLineSync().toString();
    }
    String description = '';
    while (description == '') {
      print("description:");
      description = stdin.readLineSync().toString();
    }
    String image = '';
    while (image == '') {
      print("image:");
      image = stdin.readLineSync().toString();
    }
    String price = '';
    while (price == '') {
      print("price:");
      price = stdin.readLineSync().toString();
    }
    String status = '';
    while (status == '') {
      print("status:");
      status = stdin.readLineSync().toString();
    }

    Product productInstance = Product(name, description, image, price, status);
    products.add(productInstance);

    print("Product added successfully!");
  }

  void viewProducts(List<Product> products) {
    print("all products");
    products.forEach((product) {
      print(
          "name: ${product.name}, description: ${product.description}, price: ${product.price}, image url: ${product.image}, status: ${product.status}");
    });
  }

  void viewCompletedProducts(List<Product> products) {
    print("completed products");
    products.forEach((product) {
      if (product.status == 'completed') {
        print(
            "name: ${product.name}, description: ${product.description}, price: ${product.price}, image url: ${product.image}, status: ${product.status}");
      }
    });
  }

  void viewPendingProducts(List<Product> products) {
    print("pending products:");
    products.forEach((product) {
      if (product.status == 'pending') {
        print(
            "name: ${product.name}, description: ${product.description}, price: ${product.price}, image url: ${product.image}, status: ${product.status}");
      }
    });
  }

  void editProduct(List<Product> products) {
    print("Enter the name of the product you want to edit:");
    String? productName = stdin.readLineSync();

    Product? productToEdit = null;
    for (Product product in products) {
      if (product.name == productName) {
        productToEdit = product;
        break;
      }
    }

    if (productToEdit == null) {
      print("Product not found!");
      return;
    }

    print("Enter the new name:");
    String? newName = stdin.readLineSync();
    if (newName != null && newName.isNotEmpty) {
      productToEdit.name = newName;
    }

    print("Enter the new description:");
    String? newDescription = stdin.readLineSync();
    if (newDescription != null && newDescription.isNotEmpty) {
      productToEdit.description = newDescription;
    }

    print("Enter the new image:");
    String? newImage = stdin.readLineSync();
    if (newImage != null && newImage.isNotEmpty) {
      productToEdit.image = newImage;
    }

    print("Enter the new price:");
    String? newPrice = stdin.readLineSync();
    if (newPrice != null && newPrice.isNotEmpty) {
      productToEdit.price = newPrice;
    }

    print("Enter the new status:");
    String? newStatus = stdin.readLineSync();
    if (newStatus != null && newStatus.isNotEmpty) {
      productToEdit.status = newStatus;
    }

    print("Product edited successfully!");
  }

  void deleteProduct(List<Product> products) {
    print("Enter the name of the product you want to delete:");
    String? productName = stdin.readLineSync();

    Product? productToDelete = null;
    for (Product product in products) {
      if (product.name == productName) {
        productToDelete = product;
        break;
      }
    }

    if (productToDelete == null) {
      print("Product not found!");
      return;
    }

    products.remove(productToDelete);

    print("Product deleted successfully!");
  }
}
