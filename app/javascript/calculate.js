window.addEventListener('load',()=>{
  const priceInputEl = document.getElementById("item-price");
  const priceTaxEl = document.getElementById("add-tax-price");
  const priceProfitEl = document.getElementById("profit");

  priceInputEl.addEventListener('input',() => {
    const price = priceInputEl.value;
    const priceTax = Math.floor(price*0.1)
    priceTaxEl.innerHTML = `
      <span id="add-tax-price">
        ${priceTax}
      </span>`;
    priceProfitEl.innerHTML = `
      <span id = "profit">
        ${price - priceTax}
      </span>`;
  });
});