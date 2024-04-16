// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// import * as bootstrap from "bootstrap"
import 'flowbite';
import "@fortawesome/fontawesome-free"

import Rails from "@rails/ujs";

Rails.start();

console.log("test")

// Start Stimulus
const application = Application.start();

// Load controllers
const context = require.context("./controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

// Export the application instance
export { application };