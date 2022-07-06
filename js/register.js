const btnYes = document.getElementById("btn-pay-yes");
const btnNo = document.getElementById("btn-pay-no");
const paymentRegisterInput = document.getElementById("pay-register-input");
const btnPayRegister = document.getElementById("btn-pay-register");
const form = document.getElementById("register-payment");
const btnChoice = document.getElementById("btn-choice");
const paymentInput = document.getElementById("payment");
const priceInput = document.getElementById("price");
const oldPayment = document.getElementById("previous-payment");

btnNo?.addEventListener("click", (e) => {
  e.preventDefault();

  paymentRegisterInput.classList.add("active");
  btnPayRegister.classList.add("active");
  paymentInput.value = priceInput.value;
});

btnYes?.addEventListener("click", (e) => {
  e.preventDefault();

  paymentRegisterInput.classList.remove("active");
  btnPayRegister.classList.remove("active");
  paymentInput.value = oldPayment.value;
  form.submit();
});
