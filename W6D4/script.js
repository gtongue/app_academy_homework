document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const favorite = (e) => {
    e.preventDefault();

    let input = document.querySelector(".favorite-input");
    let favorite = input.value;
    input.value = "";

    let li = document.createElement("li");
    li.textContent = favorite;


    let ul = document.getElementById("sf-places");
    ul.appendChild(li);
  };

  let button = document.querySelector(".favorite-submit");
  button.addEventListener("click", favorite);




  // adding new photos

  // --- your code here!



});
