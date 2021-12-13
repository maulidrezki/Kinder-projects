const shareProject = () => {
  const btn = document.getElementById("share-project")
  btn.addEventListener("click", () => {
    const data = {
      url: window.location.href,
      title: btn.dataset.title,
      text: btn.dataset.description
    }

    if (navigator.share) {
      navigator.share(data)
    }
  })
}

export { shareProject }
