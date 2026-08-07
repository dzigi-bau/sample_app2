// app/javascript/custom/menu.js

// Funkcija za dodavanje toggle listener-a sa proverom postojanja elemenata
function addToggleListener(selected_id, menu_id, toggle_class = "show") {
  let selected_element = document.querySelector(`#${selected_id}`);
  let menu = document.querySelector(`#${menu_id}`);

  if (selected_element && menu) {
    selected_element.addEventListener("click", function(event) {
      event.preventDefault();
      menu.classList.toggle(toggle_class);
    });
  }
}

// Dodavanje listener-a nakon učitavanja Turbo stranice
document.addEventListener("turbo:load", function() {
  addToggleListener("hamburger", "navbar-menu", "show");
  addToggleListener("account", "dropdown-menu", "show");
});