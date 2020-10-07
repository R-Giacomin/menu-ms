import $ from 'jquery';
import 'select2';
const initSelect2 = () => {
  const formatResult = (result) => {
    console.log(result);
    if (result.loading) return result.text;
      var html = result.text;
      return $(html);
  };
  $('.select2_autocomplete').select2({
    language: {
      inputTooShort: function () { return ''; }
    },
    ajax: {
      url: 'autocomplete',
      dataType: 'json',
      delay: 250,
    },
    templateResult: formatResult,
    templateSelection: formatResult,
    // placeholder: 'O que você procura?',
    width: "80%",
    minimumInputLength: 3
  });
  $('.select2_autocomplete').on('select2:select', (e) => {
  // Do something
    document.getElementById("autocomplete-form").submit();
  });
};
export { initSelect2 };
