# Pin npm packages by running ./bin/importmap
pin "turbo-rails", to: "turbo.min.js", preload: true
pin "stimulus", to: "stimulus.umd.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "application"


pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
