// app/javascript/components/photo_preview.js
const previewImageOnFileSelect = () => {
  // we select the photo input
  const input = document.getElementById('message_photo');
  // console.log(input)
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener('change', () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    })
  }
}

const displayPreview = (input) => {
  // console.log(input)
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      // console.log(event.currentTarget.result)
      document.getElementById('photo-preview').src = event.currentTarget.result;
    }
    reader.readAsDataURL(input.files[0])
    document.getElementById('photo-preview').classList.remove('d-none');
  }
}

export { previewImageOnFileSelect };
