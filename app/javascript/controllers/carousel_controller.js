import { Controller } from "@hotwired/stimulus"
import Splide from '@splidejs/splide';

export default class extends Controller {
  connect() {
    const slideCount = this.element.querySelectorAll('.splide__slide').length;

    const avatarWrappers = this.element.querySelectorAll('.avatar-wrapper');
    avatarWrappers.forEach(wrapper => {
      wrapper.style.transition = 'none';
    });

    const splide = new Splide(this.element, {
      type   : 'slide',
      perPage: 3,
      focus  : 'center',
      trimSpace: false,
      gap    : '10px',
      arrows : true,
      pagination: false,
      drag   : 'free',
    });

    splide.mount();

    setTimeout(() => {
      avatarWrappers.forEach(wrapper => {
        wrapper.style.transition = '';
      });
    }, 50);


    const slides = this.element.querySelectorAll('.splide__slide');
    slides.forEach(slide => {
      const link = slide.querySelector('a');
      if (link) {
        slide.addEventListener('click', (e) => {
          if (!splide.state.is('dragging')) {
            window.location.href = link.href;
          }
        });
      }
    });
  }
}
