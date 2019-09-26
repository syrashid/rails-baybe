import "bootstrap";
import 'select2/dist/css/select2.css';

import { confirmBox } from '../components/confirm_btn'
import { deliveryForm } from '../components/delivery_form'
import { priceCalc } from '../components/price_calc';
import { initSelect2 } from '../components/init_select2';
import { popover } from '../components/popover';
import {  } from '../plugins/init_sweetalert';

confirmBox();
initSelect2();
priceCalc();
popover();
deliveryForm();
