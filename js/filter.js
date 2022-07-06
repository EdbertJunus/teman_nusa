const dropdownMenu = document.getElementsByClassName("dropdown-menu")[0];

dropdownMenu?.addEventListener("click", (e) => {
  e.stopPropagation();
});
