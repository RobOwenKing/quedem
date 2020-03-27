import "bootstrap";
import {initAutocomplete} from "../plugins/init_autocomplete";
initAutocomplete();

import { dateListeners, locationListeners, rsvpListeners } from "../functions/polls";
dateListeners();
rsvpListeners();
locationListeners();
import {initHangoutForm} from "../components/hangout_form";
import "../plugins/flatpickr";
initHangoutForm();
