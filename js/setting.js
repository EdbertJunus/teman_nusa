const chgBtn = document.getElementById("chg-acc-btn");
const confirmationnGroup = document.getElementById("confirmation-msg");

const noBtn = document.getElementById("chg-btn-no");

chgBtn?.addEventListener("click", () => {
  confirmationnGroup.classList.add("active");
});

noBtn?.addEventListener("click", () => {
  confirmationnGroup.classList.remove("active");
});
