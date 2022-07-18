# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "materialize", to: "https://ga.jspm.io/npm:materialize@1.0.0/index.js"
pin_all_from 'app/javascript/packs/bottle.js', under: 'packs'
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.0/dist/jquery.js"
