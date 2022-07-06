const chgBtn = document.getElementById("chg-acc-btn");
const warningGroup = document.getElementById("warning-msg");

const noBtn = document.getElementById("chg-btn-no");

chgBtn?.addEventListener("click", () => {
  warningGroup.classList.add("active");
});

noBtn?.addEventListener("click", () => {
  warningGroup.classList.remove("active");
});
