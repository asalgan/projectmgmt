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
//= require jquery_ujs
//= require jquery-ui
//= require sweetalert2
//= require dragula
//= require dropzone
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){

  // Prevent double-click action on buttons
  $('button, a').dblclick(function(e){
    e.preventDefault();
    return false;
  });


  // IE fix for window.location.origin
  $(function(){
    if (!window.location.origin) {
      window.location.origin = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port: '');
    }
  });


  // Ajax pagination, doesn't fire on networks
  $(function(){
    if (window.location.href.indexOf("networks") === -1) {
      $('.pagination a').attr('data-remote', 'true')
    }
  });

});
