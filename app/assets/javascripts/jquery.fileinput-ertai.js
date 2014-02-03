
/*=========================================================================================
  Fix para label click no firefox (importante para o inputFile)
=========================================================================================*/
if($.browser.mozilla) {
  $(document).on('click', 'label.file', function(e) {
    if(e.currentTarget === this && e.target.nodeName !== 'INPUT') {
      $(this.control).click();
    }
  });
}


/*=========================================================================================
  Fix para label click no firefox (importante para o inputFile)
=========================================================================================*/

function inputFile() {
  $('input.file').each(function(){
    var inputId = $(this).prop('id');
    var inputValue = $(this).prop('value');
    $(this).hide().parent().addClass('js-wrapper-file').find('label').after("<div class='row collapse js-row-file'><div class='large-10 columns'><input data-id='" + inputId + "' value='" + inputValue + "' class='js-input-file' type='text' readonly></input></div><div class='large-2 columns'><a class='button prefix js-button-file'><div class='icon-folder-open'></div></a></div></div>").find('label').addClass('js-label-file');
    $(this).parent().find('.js-button-file').click(function(){
      $(this).closest('.js-wrapper-file').find('label').click();
    });
    $(this).change(function(){
      var inputValue = $(this).prop('value');
      $(this).parent().find('.js-input-file').prop('value', inputValue);
    });
  })
}
