// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//

import "/vendor/assets/javascripts/admin/custom.js"
import "/vendor/assets/javascripts/admin/jquery.min.js"
import "/vendor/assets/javascripts/admin/sidebarmenu.js"

import "/vendor/assets/javascripts/admin/jquery-1.12.4.min.js"
import "/vendor/assets/javascripts/admin/slick.min.js"
import "/vendor/assets/javascripts/admin/jquery.slicknav.min.js"
import "/vendor/assets/javascripts/admin/jquery.nice-select.min.js"
import "/vendor/assets/javascripts/admin/jquery.sticky.js"
import "/vendor/assets/javascripts/admin/jquery.barfiller.js"
import "/vendor/assets/javascripts/admin/main.js"

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "bootstrap"
import 'bootstrap-icons/font/bootstrap-icons.css'
import "@fortawesome/fontawesome-free/css/all"

import { Tooltip, Popover } from "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("@popperjs/core")

// Import the specific modules you may need (Modal, Alert, etc)

// The stylesheet location we created earlier
require("../stylesheets/application.scss")

// If you're using Turbolinks. Otherwise simply use: jQuery(function () {
document.addEventListener("turbolinks:load", () => {
    // Both of these are from the Bootstrap 5 docs
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new Tooltip(tooltipTriggerEl)
    })

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new Popover(popoverTriggerEl)
    })
})
