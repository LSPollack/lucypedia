// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  // Show/hide Lucy answer
  $('.lucys-answer').hide(); 

  $('.columns-container').click('.lucy-answer-button', function(el) {

      $(el.target).parent().next('.lucys-answer').toggle();

      if ($(el.target).parent().next('.lucys-answer:visible').length) {

        $(el.target).children("i").removeClass("o-ft-icons-icon--arrow-right");

        $(el.target).children("i").addClass("o-ft-icons-icon--arrow-down");
      }

      else {
        $(el.target).children("i").addClass("o-ft-icons-icon--arrow-right");
        $(el.target).children("i").removeClass("o-ft-icons-icon--arrow-down");
      }

    });
      
  // $('.columns-container').click('.lucy-answer-button', function(el) {
  //   $(el.target).parent().next().toggle();
  //     // toggle between two function
  //   });



  // Ajax for filtering by category
  $('.category-filter-form').
    on('ajax:success', function(evt, data, status, xhr){
      $('.columns-container').html(data);
      $('.lucys-answer').hide(); 

    }).
    on('ajax:error', function(xhr, status, error){
      console.log('error: ', error);
    });

});
