import $ from 'jquery';
import 'select2';
const initSelect2 = () => {
  $('.select2_autocomplete').select2({
    ajax: {
      url: 'autocomplete',
      dataType: 'json',
      delay: 250,
      // Additional AJAX parameters go here; see the end of this chapter for the full code of this example
    },
    minimumInputLength: 1,
    placeholder: 'O que você procura',
    width: "80%"
  });
};
export { initSelect2 };
