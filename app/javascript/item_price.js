function textInput(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    const saleProfit = document.getElementById("profit")
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    saleProfit.innerHTML = inputValue - Math.floor(inputValue * 0.1)
 })
}

window.addEventListener('load',textInput)