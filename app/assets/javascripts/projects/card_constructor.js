function Cart(){
  this.products_list=[];
}

Cart.prototype.add = function(product){
    this.products_list.push(product);
  };

Cart.prototype.total = function(){
    this.products_list.reduce(function(total,product){
      return total+product.price;
    });    
  };

Cart.prototype.remove = function(product_id){
    var product_to_delete = this.products_list.filter(function(product){
      return product.id == product_id;
    })[0];
    var index = this.products_list.indexOf(product_to_delete);
    this.products_list.splice(index,1);

  };

Cart.prototype.removeById = function(id){
  this.item = this.item.filter(function(item){
    return item.id !== id;
  });
};

var productA = { id: 1, price: 50 };
var productB = { id: 2, price: 100 };

var mycart = new Cart();

mycart.add(productA);
mycart.add(productB);
mycart.total();

mycart.removeById(productA.id);
mycart.total();