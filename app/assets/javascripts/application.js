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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require dropzone
//= require_tree .
//= require toastr
//= require activestorage
//= require turbolinks


document.addEventListener("turbolinks:load", function () {
    $("#q_subtopico_page_conteudo_i_cont").focus();

    $('#selecao').change(function () {
        window.location = $(this).val();
    });


    $("#pesquisa").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $(".titu").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
        $(".item").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

    $("#search").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $(".tex").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });

});
