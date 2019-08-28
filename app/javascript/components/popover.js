import $ from 'jquery';

const popover = () => {
  $('[data-toggle="popover"]').popover({html:true})
};


export { popover };

