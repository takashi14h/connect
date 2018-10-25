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
        var a = '';
        var b = '';
        var c = '';
        var d = '';
        var e = '';
        var f = '';
        var g = '';
        var h = '';
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
        a = $(".style-item" + '.sex-label-color').text();
        b = $(".color-item" + '.sex-label-color').text();
        d = $(".menu-item" + '.sex-label-color').text();
        e = $(".clothes-item" + '.sex-label-color').text();
        f = $(".age-item" + '.sex-label-color').text();
        g = $(".area-item" + '.sex-label-color').text();
        h = $(".price-item" + '.sex-label-color').text();
        $.ajax({
            url: '/lab',
            type: 'get',
            async: true,
            data: {
                "sexlab": c,
                "stylelab": a,
                "colorlab": b,
                "menulab": d,
                "clotheslab": e,
                "agelab": f,
                "arealab": g,
                "pricelab": h
            },
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))}
        })
        .done(function(f) {
            // console.log(f)
            $('.label-wrapper').html(f);
        })
        .fail(function() {
        })
    });

    $(document).on('click', '.list-group-item', function() {
        var a = '';
        var b = '';
        var c = '';
        var d = '';
        var e = '';
        var f = '';
        var g = '';
        var h = '';
        if ($('.ALL').hasClass('sex-label-color')) {
            c = "ALL";
        } else if ($('.MEN').hasClass('sex-label-color')){
            c = "MEN";
        } else if ($('.WOMEN').hasClass('sex-label-color')){
            c = "WOMEN";
        } else if ($('.KIDS').hasClass('sex-label-color')){
            c = "KIDS";
        }
        if ($(this).hasClass('style-item')) {
            $('.style-item').removeClass('sex-label-color');
            $(this).addClass('sex-label-color');
        } else if ($(this).hasClass('color-item')) {
            $('.color-item').removeClass('sex-label-color');
            $(this).addClass('sex-label-color');
        } else if ($(this).hasClass('menu-item')) {
            $('.menu-item').removeClass('sex-label-color');
            $(this).addClass('sex-label-color');
        } else if ($(this).hasClass('clothes-item')) {
            $('.clothes-item').removeClass('sex-label-color');
            $(this).addClass('sex-label-color');
        } else if ($(this).hasClass('age-item')) {
            $('.age-item').removeClass('sex-label-color');
            $(this).addClass('sex-label-color');
        } else if ($(this).hasClass('area-item')) {
            $('.area-item').removeClass('sex-label-color');
            $(this).addClass('sex-label-color');
        } else {
            $('.price-item').removeClass('sex-label-color');
            $(this).addClass('sex-label-color');
        }
        a = $(".style-item" + '.sex-label-color').text();
        b = $(".color-item" + '.sex-label-color').text();
        d = $(".menu-item" + '.sex-label-color').text();
        e = $(".clothes-item" + '.sex-label-color').text();
        f = $(".age-item" + '.sex-label-color').text();
        g = $(".area-item" + '.sex-label-color').text();
        h = $(".price-item" + '.sex-label-color').text();
            alert(a);
        $.ajax({
            url: '/lab',
            type: 'get',
            async: true,
            data: {
                "sexlab": c,
                "stylelab": a,
                "colorlab": b,
                "menulab": d,
                "clotheslab": e,
                "agelab": f,
                "arealab": g,
                "pricelab": h
            },
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
        $('.sex-label-color').removeClass('sex-label-color');
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
});









