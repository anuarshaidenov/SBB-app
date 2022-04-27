// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';

window.addEventListener('load', () => {
  const hamburgerBtn = document.getElementById('hamburger-btn');
  const menu = document.getElementById('mobile-menu');
  const backdrop = document.getElementById('backdrop');
  hamburgerBtn.addEventListener('click', () => {
    menu.classList.remove('-translate-x-full');
    backdrop.classList.remove('hidden');
  });

  backdrop.addEventListener('click', () => {
    menu.classList.add('-translate-x-full');
    backdrop.classList.add('hidden');
  });
});
