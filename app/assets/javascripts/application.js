// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

jQuery(function($) {

  // Add some tips
  $('.with-tip').tooltip();

  $(".js-collapse-sidebar").click(function(){
    $(".main-right-sidebar").toggleClass("collapsed");
    $("section.content").toggleClass("sidebar-collapsed");
    $("span.icon", $(this)).toggleClass("icon-chevron-right");
    $("span.icon", $(this)).toggleClass("icon-chevron-left");
  });

  $('#main-sidebar').find('[data-toggle="collapse"]').on('click', function()
    {
      if($(this).find('.icon-chevron-left').length == 1){
        $(this).find('.icon-chevron-left').removeClass('icon-chevron-left').addClass('icon-chevron-down');
      }
      else {
        $(this).find('.icon-chevron-down').removeClass('icon-chevron-down').addClass('icon-chevron-left');
      }
    }
  )

  // Sidebar nav toggle functionality
  var sidebar_toggle = $('#sidebar-toggle');

  sidebar_toggle.on('click', function(){
    var wrapper = $('#wrapper');
    var main    = $('#main-part');

    if(wrapper.hasClass('sidebar-minimized')){
      wrapper.removeClass('sidebar-minimized');
      main
        .removeClass('col-sm-12 col-md-12 sidebar-collapsed')
        .addClass('col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2');
      $.cookie('sidebar-minimized', 'false', { path: '/admin' });
    }
    else {
      wrapper.addClass('sidebar-minimized');
      main
        .removeClass('col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2')
        .addClass('col-sm-12 col-md-12 sidebar-collapsed');
      $.cookie('sidebar-minimized', 'true', { path: '/admin' });
    }
  });

  $('.sidebar-menu-item').mouseover(function(){
    if($('#wrapper').hasClass('sidebar-minimized')){
      $(this).addClass('menu-active');
      $(this).find('ul.nav').addClass('submenu-active');
    }
  });
  $('.sidebar-menu-item').mouseout(function(){
    if($('#wrapper').hasClass('sidebar-minimized')){
      $(this).removeClass('menu-active');
      $(this).find('ul.nav').removeClass('submenu-active');
    }
  });
});
