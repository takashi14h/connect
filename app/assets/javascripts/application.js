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
//= require cocoon
//= require_tree .


$(function() {
    $(document).on("ajax:success", ".fav1", function(e) {
        if ($('.favorite-' + e.detail[0]).hasClass('favorite-color')) {
            $('.favorite-' + e.detail[0]).removeClass('favorite-color');
        } else {
            $('.favorite-' + e.detail[0]).addClass('favorite-color');
        }
        $('.favorite-of-'+ e.detail[0]).html(e.detail[0][1]);
    });

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
    });


     $(document).on("ajax:success", ".follow", function(e) {
        var id = e.target.attributes[1].value;
        $('.user-'+ id).html(e.detail[2]["response"]);
　　　});


    $(document).on('click', '.sex-label', function() {
        var c = '';
        $('.ALL').removeClass('sex-label-color');
        $('.MEN').removeClass('sex-label-color');
        $('.WOMEN').removeClass('sex-label-color');
        $('.KIDS').removeClass('sex-label-color');
        if ($(this).hasClass('ALL')) {
            c = "ALL";
            $('.ALL').addClass('sex-label-color');
        } else if ($(this).hasClass('MEN')){
            c = "MEN";
            $('.MEN').addClass('sex-label-color');
        } else if ($(this).hasClass('WOMEN')){
            c = "WOMEN";
            $('.WOMEN').addClass('sex-label-color');
        } else {
            c = "KIDS";
            $('.KIDS').addClass('sex-label-color');
        }
        $.ajax({
            url: '/lab',
            type: 'get',
            async: true,
            data: {"sexlab": c},
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
        })
        .done(function(f) {
            // console.log(f)
            $('.label-wrapper').html(f);
        })
        .fail(function() {
        })
    });

    $(document).on('click', '.user-sex-label', function() {
        var c = '';
        $('.ALL').removeClass('sex-label-color');
        $('.MEN').removeClass('sex-label-color');
        $('.WOMEN').removeClass('sex-label-color');
        $('.KIDS').removeClass('sex-label-color');
        if ($(this).hasClass('ALL')) {
            c = "ALL";
            $('.ALL').addClass('sex-label-color');
        } else if ($(this).hasClass('MEN')){
            c = "MEN";
            $('.MEN').addClass('sex-label-color');
        } else if ($(this).hasClass('WOMEN')){
            c = "WOMEN";
            $('.WOMEN').addClass('sex-label-color');
        } else {
            c = "KIDS";
            $('.KIDS').addClass('sex-label-color');
        }
        $.ajax({
            url: '/ulab',
            type: 'get',
            async: true,
            data: {"ulab": c},
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
        })
        .done(function(f) {
            // console.log(f)
            $('.ranking-wrapper').html(f);
        })
        .fail(function() {
        })
    });


    // $('.mo_icon').hover(function(){
      // if ($(this).hasClass('mo_style')) {
        // $('.style_modal').addClass('active');
    //   } else if ($(this).hasClass('mo_color')) {
    //     $('.color_modal').addClass('active');
    //   } else if ($(this).hasClass('mo_menu')) {
    //     $('.menu_modal').addClass('active');
    //   } else if ($(this).hasClass('mo_clothes')) {
    //     $('.clothes_modal').addClass('active');
    //   } else if ($(this).hasClass('mo_age')) {
    //     $('.age_modal').addClass('active');
    //   } else if ($(this).hasClass('mo_area')) {
    //     $('.area_modal').addClass('active');
    //   } else {
    //     $('.price_modal').addClass('active');
    //   }
    // });

    // $('.list-group').hover(function(){
    //   if ($(this).hasClass('style_modal')) {
    //     $('.style_modal').addClass('active');
    //   } else if ($(this).hasClass('color_modal')) {
    //     $('.color_modal').addClass('active');
    //   } else if ($(this).hasClass('menu_modal')) {
    //     $('.menu_modal').addClass('active');
    //   } else if ($(this).hasClass('clothes_modal')) {
    //     $('.clothes_modal').addClass('active');
    //   } else if ($(this).hasClass('age_modal')) {
    //     $('.age_modal').addClass('active');
    //   } else if ($(this).hasClass('area_modal')) {
    //     $('.area_modal').addClass('active');
    //   } else {
    //     $('.price_modal').addClass('active');
    //   }
    // });

    $('.mo_iconn').hover(function(){
        $('.'+$(this).data('mo')).addClass('active');
        if ($(this).hasClass('style_span')) {
            $('.mo_style').addClass('active');
        } else if ($(this).hasClass('color_span')) {
            $('.mo_color').addClass('active');
        } else if ($(this).hasClass('menu_span')) {
            $('.mo_menu').addClass('active');
        } else if ($(this).hasClass('clothes_span')) {
            $('.mo_clothes').addClass('active');
        } else if ($(this).hasClass('age_span')) {
            $('.mo_age').addClass('active');
        } else if ($(this).hasClass('area_span')) {
            $('.mo_area').addClass('active');
        } else {
            $('.mo_price').addClass('active');
        }
        $('.active').hover(function() {

        }, function() {
            $('.active').removeClass('active');
        })
    }, function() {
    });
});









