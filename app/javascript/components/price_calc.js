const priceCalc = () => {
  const select_condition = document.getElementById("selected-condition")
  const price = document.getElementById("product-price")

  function calculateTotalPrice() {

    var condition = document.getElementById("selected-condition").value

    const conds = document.getElementById('conditions')
    const conditions = JSON.parse(conds.dataset["conditions"])

    var prod = document.getElementById('product')
    var prod_price = parseInt(JSON.parse(prod.dataset["product"]).price)
    var buy_ratio = conditions.find(element => element.name === condition).buy_ratio

    price.innerText = `${Math.round(prod_price * buy_ratio, 2)} €`;
  }

  select_condition.addEventListener("change", calculateTotalPrice)
}

export { priceCalc }
