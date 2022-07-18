//= require rails-ujs
//= require jquery
//= require_tree .
// app/javascript/jquery.js

import jquery from "jquery"
window.jQuery = jquery
window.$ = jquery
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
Rails.start()
Turbolinks.start()
ActiveStorage.start()
import "./bottle"
import "./preview"
import "./profile"
import "./raty"
import "./materialize"
import "./plan"
import "./registration"
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);




