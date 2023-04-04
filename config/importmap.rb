# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "vue", to: "https://ga.jspm.io/npm:vue@3.2.26/dist/vue.esm-browser.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "application", preload: true