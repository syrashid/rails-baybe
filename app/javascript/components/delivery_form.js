const deliveryForm = () => {
  $(document).ready(function(){
    $("input[type='radio']").click(function(){
      var radioValue = $("input[name='delivery_place']:checked").val();
        if(radioValue === "home"){
          console.log("true home")
          $("input[name='first_name']").attr('disabled','');
          $("input[name='last_name']").attr('disabled','');
          $("input[name='address']").attr('disabled','');
          $("input[name='address2']").attr('disabled','');
          $("input[name='country']").attr('disabled','');
          $("input[name='city']").attr('disabled','');
          $("input[name='zip']").attr('disabled','');
        }
        else {
          console.log("false home")
          $("input[name='first_name']").removeAttr('disabled');
          $("input[name='last_name']").removeAttr('disabled');
          $("input[name='address']").removeAttr('disabled');
          $("input[name='address2']").removeAttr('disabled');
          $("input[name='country']").removeAttr('disabled');
          $("input[name='city']").removeAttr('disabled');
          $("input[name='zip']").removeAttr('disabled');
        }
    });
  });
}

export { deliveryForm };
