// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
  //= require jquery
  //= require bootstrap-sprockets
//= require_tree .

$(function() {
    $(document).on("ajax:success", ".fav1", function(e) {
        if ($('.favorite-' + e.detail[0]).hasClass('favorite-color')) {
            $('.favorite-' + e.detail[0]).removeClass('favorite-color');
        } else {
            $('.favorite-' + e.detail[0]).addClass('favorite-color');
        }
        $('.favorite-of-'+ e.detail[0]).html(e.detail[0][1]);
    })
})

$(function() {
    $(document).on("ajax:success", ".fav2", function(e) {
        $('.like-of-'+ e.detail[0]).html(e.detail[0][1]);
        if ($('.like-' + e.detail[0]).hasClass('favorite-color')) {
            $('.like-' + e.detail[0]).removeClass('favorite-color');
        } else {
            $('.like-' + e.detail[0]).addClass('favorite-color');
        }
        if ($('.like-icon-' + e.detail[0]).hasClass('glyphicon glyphicon-heart')) {
            $('.like-icon-' + e.detail[0]).removeClass('glyphicon glyphicon-heart').addClass('glyphicon glyphicon-heart-empty');
        } else {
            $('.like-icon-' + e.detail[0]).removeClass('glyphicon glyphicon-heart-empty').addClass('glyphicon glyphicon-heart');
        }
    })


        $(document).on("ajax:success", ".follow", function(e) {
        var id = e.target.attributes[1].value;
        $('.user-'+ id).html(e.detail[2]["response"]);
})
})


