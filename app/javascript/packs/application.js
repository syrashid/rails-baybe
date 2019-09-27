import "bootstrap";
import 'select2/dist/css/select2.css';

import { deliveryForm } from '../components/delivery_form'
import { priceCalc } from '../components/price_calc';
import { initSelect2 } from '../components/init_select2';
import { popover } from '../components/popover';
import {  } from '../plugins/init_sweetalert';

initSelect2();
priceCalc();
popover();
deliveryForm();
