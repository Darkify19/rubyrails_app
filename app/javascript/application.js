import "bootstrap"  // Import Bootstrap JS
import { Turbo } from "turbo"  // Import Turbo
import Rails from "@rails/ujs"  // Import Rails UJS
import "controllers"  // Import Stimulus controllers

// Initialize Rails UJS
Rails.start()

// Initialize Turbo
Turbo.start()
