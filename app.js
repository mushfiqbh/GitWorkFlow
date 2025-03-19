const btn = document.querySelector("button");
btn.addEventListener("click", (e) => {
    localStorage.setItem("bv", e.target.value);
})