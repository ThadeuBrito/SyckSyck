/*
*= require jquery
*= require jquery_ujs
*= require 'foundation/foundation'
*= require 'foundation/foundation.alerts'
*= require 'foundation/foundation.cookie'
*= require 'foundation/foundation.dropdown'
*= require 'foundation/foundation.forms'
*= require 'foundation/foundation.placeholder'
*= require 'foundation/foundation.reveal'
*= require 'foundation/foundation.section'
*= require 'foundation/foundation.tooltips'
*= require 'foundation/foundation.topbar'
*= require jquery.lw-datepicker.min
*= require jquery.fileinput-ertai.js
*= require cocoon
*= require rails.validations
*= require rails.validations.simple_form
*= require jquery.noty
*= require topCenter
*= require default.js
*= require_self
*/

$(document).foundation();

$(document).ready(function(){
  inputFile();
});



/*=========================================================================================
  Tokeninput busca
=========================================================================================*/
function tokenInputLocal() {
  $("#busca").tokenInput("/cursos.json", {
    propertyToSearch: 'nome',
    minChars: 2,
    minCharsText: 'Digite, pelo menos, 2 caracteres',
    tokenLimit: 1,
    resultsLimit: 20,
    hintText: 'Digite o nome',
    noResultsText: 'Nenhum encontrado.',
    searchingText: 'Pesquisando...',
    addTokenAllow: true,
    afterAddTokenJS: "alert('teste bosta')"
  });
};

function tokenInputBusca() {
  $("#curso_curso_tokens").tokenInput("/cursos.json", {
    propertyToSearch: 'nome',
    minChars: 2,
    minCharsText: 'Digite, pelo menos, 2 caracteres',
    tokenLimit: 1,
    resultsLimit: 20,
    hintText: 'Digite o nome',
    noResultsText: 'Nenhum encontrado.',
    searchingText: 'Pesquisando...',
    // afterAddTokenJS: "alert('teste bosta')",
    addTokenAllow: true,  });
};


/*=========================================================================================
  Carrega Cidades
=========================================================================================*/
function carregaCidades(select_cidade_id) {
  $.get("/cidades/cidades_estado", { estado: $('#estado_select').val(), field_id: select_cidade_id }).complete(function (data) { $('#'+select_cidade_id).trigger('change'); });
}

/*=========================================================================================
  Datepicker
=========================================================================================*/
function lwDatepicker(more_options) {
  function customDate (date) {
    return ('0' + date.getDate()).slice(-2) + '/' + ('0' + (date.getMonth()+1)).slice(-2) + '/' + date.getFullYear();
  }

  var init_options = {
    dowNames: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'],
    monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
    alwaysVisible: true,
    autoFillToday: true,
    formatDate: customDate
  }

  options = $.extend(true, {}, init_options, more_options);

  $('.datepicker').lwDatepicker(options).prop('autocomplete','off');
}

/*=========================================================================================
  Validação CPF/CNPJ Client Side Validators
=========================================================================================*/
function addPriceFormat(element) {
  element.priceFormat({
  prefix: 'R$ ',
  clearPrefix: true,
  centsSeparator: ',',
  thousandsSeparator: '.'
  });
}

/*=========================================================================================
  Nova mascara com nono digito opcional
=========================================================================================*/
function newMaskNumber(obj){
  String.prototype.splice = function( idx, rem, s ) {
    return (this.slice(0,idx) + s + this.slice(idx + Math.abs(rem)));
  };
  $(obj).mask('(99) 9999-9999?9').bind('blur.mask', function() { $(this).change().focusout(); });
  $(obj).focusout(function(){
    var cel = $(obj).val().replace('-','').replace('(','').replace(')','').replace(' ','').replace(/_/g,'');
    if(cel.length == 10){
      $(obj).unmask();
      $(obj).mask('(99) 9999-9999?9');
    }
    else if(cel.length == 11){
      $(obj).unmask();
      $(obj).mask('(99) 99999-999?9');
    }
    $(this).val(cel);
  });
};