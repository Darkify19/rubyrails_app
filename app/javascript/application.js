import "bootstrap"; // Import Bootstrap
import { Turbo } from "@hotwired/turbo-rails"; // Import Turbo (for TurboLinks replacement)
import "@rails/ujs";  // Import Rails UJS
import "controllers";  // Import Stimulus controllers
import "bootstrap/dist/css/bootstrap.min.css"; // Import Bootstrap CSS

Rails.start(); // Initialize Rails UJS
