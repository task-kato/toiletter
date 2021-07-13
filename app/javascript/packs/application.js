import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '@fortawesome/fontawesome-free/js/all'
import "bootstrap";
import "../stylesheets/application";
import "../staff/flash_message"


Rails.start()
Turbolinks.start()
ActiveStorage.start()
