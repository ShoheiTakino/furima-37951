window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price"); 
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = inputValue/10
      const tax = addTaxDom.innerHTML
      const taxPrice = Math.floor(tax);
      console.log(taxPrice);
    });
});