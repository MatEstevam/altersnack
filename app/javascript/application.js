// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

// const slides = document.querySelectorAll(".item");
// const buttons = document.querySelectorAll(".button");

// let current = 0;
// let prev = slides.length - 1;
// let next = 1;

// buttons.forEach((button, index) => {
//   button.addEventListener("click", () => {
//     if (index === 0) {
//       gotoPrev();
//     } else {
//       gotoNext();
//     }
//   });
// });

// const gotoPrev = () => {
//   current = current > 0 ? current - 1 : slides.length - 1;
//   updateClasses();
// };

// const gotoNext = () => {
//   current = current < slides.length - 1 ? current + 1 : 0;
//   updateClasses();
// };

// const updateClasses = () => {
//   prev = current === 0 ? slides.length - 1 : current - 1;
//   next = current === slides.length - 1 ? 0 : current + 1;

//   slides.forEach((slide, index) => {
//     slide.classList.remove("active", "prev", "next");
//     if (index === prev) slide.classList.add("prev");
//     else if (index === current) slide.classList.add("active");
//     else if (index === next) slide.classList.add("next");
//   });
// };
