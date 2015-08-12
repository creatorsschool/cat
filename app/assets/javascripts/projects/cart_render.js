function renderCart(items) {
  var outterDiv = document.createElement("div");
  var outterUl = document.createElement("ul");
  outterDiv.appendChild(outterUl);
  items.forEach(function(item,index){
    var outterLi = document.createElement("li");
    outterLi.className = "item"+ index;
    outterUl.appendChild(outterLi);
    var innerP = document.createElement("p");
    outterLi.appendChild(innerP);
    var pText = document.createTextNode(item.name);
    innerP.appendChild(pText);
    var innerSpan = document.createElement("span");
    outterLi.appendChild(innerSpan);
    var spanText = document.createTextNode(item.price);
    innerSpan.appendChild(spanText);
  });
}

var products = [
  { id: 1, name: "Apples", price: 0.32 },
  { id: 2, name: "Oranges", price: 0.40 },
  { id: 3, name: "Bananas", price: 0.70 }
];

console.log(renderCart(products));