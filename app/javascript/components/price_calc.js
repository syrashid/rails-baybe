const buyProduct = document.querySelector(".buy-product");
const sellProduct = document.querySelector(".sell-product");

const priceCalc = () => {
  if (buyProduct || sellProduct) {
    const select_condition = document.getElementById("selected-condition")
    const price = document.getElementById("product-price")
    const savings = document.getElementById("savings")


    function calculateTotalPrice() {

      var condition = document.getElementById("selected-condition").value

      const conds = document.getElementById('conditions')
      const conditions = JSON.parse(conds.dataset["conditions"])

      var prod = document.getElementById('product')
      var prod_price = parseInt(JSON.parse(prod.dataset["product"]).price)

      if (buyProduct) {
        var buy_ratio = conditions.find(element => element.name === condition).buy_ratio
        var new_price = Math.round(prod_price * buy_ratio, 2)
        price.innerText = `${new_price} €`;
        savings.innerText = `save ${ 100 - (buy_ratio * 100) }%`;

      } else if (sellProduct) {
        var sell_ratio = conditions.find(element => element.name === condition).sell_ratio
        var new_price = Math.round(prod_price * sell_ratio, 2)
        price.innerText = `${new_price} €`;
        savings.innerText = ``;
      }
    }

    select_condition.addEventListener("change", calculateTotalPrice)

    calculateTotalPrice();
  }
}


export { priceCalc }
