const thumbIcon = document.getElementsByClassName("thumb-icon");
const userDetailId = document.getElementById("UserDetailId");

for (let i = 0; i < thumbIcon.length; i++) {
  thumbIcon[i]?.addEventListener("click", () => {
    const form = document.createElement("form");
    const input = document.createElement("input");
    form.method = "post";
    form.action = "controller/addWishlistController.jsp";

    input.name = "FavoritedUserId";
    input.value = userDetailId.value;
    form.appendChild(input);

    document.body.appendChild(form);
    form.submit();
  });
}
