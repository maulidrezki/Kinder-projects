const scrollSearch = () => {
  document.addEventListener("scroll", e => {
    if (window.scrollY > document.querySelector(".banner").offsetHeight) {
      document.querySelector(".search-container").classList.add("search-container-back")
    } else {
      document.querySelector(".search-container").classList.remove("search-container-back")
    }
  })

}

export { scrollSearch }
