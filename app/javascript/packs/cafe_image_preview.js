document.addEventListener('turbolinks:load', function() {
  const imageInput = document.getElementById('cafe_images');
  const previewContainer = document.getElementById('image-preview');

  if (imageInput) {
    imageInput.addEventListener('change', function(event) {
      previewContainer.innerHTML = ''; // プレビューコンテナをクリア
      const files = event.target.files;

      for (let i = 0; i < files.length; i++) {
        const file = files[i];
        const reader = new FileReader();
        
        reader.onload = function(e) {
          const imageElement = document.createElement('div');
          imageElement.classList.add('image-preview-item');
          
          const img = document.createElement('img');
          img.src = e.target.result;
          img.classList.add('preview-image');
          imageElement.appendChild(img);
          
          const removeButton = document.createElement('button');
          removeButton.textContent = '削除';
          removeButton.classList.add('remove-image-button');
          removeButton.dataset.index = i;
          removeButton.addEventListener('click', function() {
            removeImage(i);
          });
          imageElement.appendChild(removeButton);
          
          previewContainer.appendChild(imageElement);
        };
        
        reader.readAsDataURL(file);
      }
    });
  }

  function removeImage(index) {
    const files = Array.from(imageInput.files);
    files.splice(index, 1);
    
    const dataTransfer = new DataTransfer();
    files.forEach(file => dataTransfer.items.add(file));
    
    imageInput.files = dataTransfer.files;
    document.querySelectorAll('.image-preview-item')[index].remove();
  }
});