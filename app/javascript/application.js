// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener('turbo:load', function() {
  const flashMessages = document.getElementById('flash-messages');

  if (flashMessages) {
    const messages = flashMessages.querySelectorAll('.flash');

    if (messages.length > 0) {
      flashMessages.style.display = 'block';
      setTimeout(function() {
        flashMessages.style.display = 'none';
      }, 5000);
    } else {

      flashMessages.style.display = 'none';
    }
  }
});
