window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price"); 
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const afterTax = inputValue/10
      const afterTaxMath = Math.floor(afterTax);
      addTaxDom.innerHTML = afterTaxMath;
      const profit = document.getElementById("profit");
      const netIncome = inputValue - afterTaxMath
      profit.innerHTML =  netIncome
    });
});

