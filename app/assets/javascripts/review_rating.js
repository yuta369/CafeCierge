document.addEventListener("DOMContentLoaded", function() {
  const stars = document.querySelectorAll(".star-rating .star");
  stars.forEach(star => {
    star.addEventListener("mouseover", function() {
      const onStar = parseInt(this.dataset.value, 10);
      stars.forEach((s, index) => {
        if (index < onStar) {
          s.classList.add("hover");
        } else {
          s.classList.remove("hover");
        }
      });
    });

    star.addEventListener("mouseout", function() {
      stars.forEach(star => star.classList.remove("hover"));
    });

    star.addEventListener("click", function() {
      const onStar = parseInt(this.dataset.value, 10);
      const ratingInput = document.querySelector("#review_rating");
      ratingInput.value = onStar;
      stars.forEach((star, index) => {
        if (index < onStar) {
          star.classList.add("selected");
        } else {
          star.classList.remove("selected");
        }
      });
    });
  });
});