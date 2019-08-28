import "bootstrap";
import 'select2/dist/css/select2.css';

import { confirmBox } from '../components/confirm_btn'
import { priceCalc } from '../components/price_calc';
import { initSelect2 } from '../components/init_select2';
import { initSweetalert, initSweetalertCallback } from '../plugins/init_sweetalert';
import { popover } from '../components/popover';


confirmBox();
priceCalc();
initSelect2();
initSweetalert();
initSweetalertCallback();
popover();
