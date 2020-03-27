import "bootstrap";
import {initAutocomplete} from "../plugins/init_autocomplete";
initAutocomplete();

import { dateListeners, rsvpListeners } from "../functions/polls";
dateListeners();
rsvpListeners();

import {initHangoutForm} from "../components/hangout_form";
import "../plugins/flatpickr";
initHangoutForm();
