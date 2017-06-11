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
//= require jquery
//= require bootstrap-sprockets
//= require moment
//= require_tree .

$(document).ready(function(){

    $(function() {              
        $('#datetimepicker6').datetimepicker({
            format: 'DD/MM/YYYY'
        });
    });
    $(function() {              
        $('#datetimepicker7').datetimepicker({
            format: 'DD/MM/YYYY'
        });
    }); 
        // start date picke on chagne event [select minimun date for end date datepicker]
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });


    $('.pmd-dropdown-hover').dropdownHover().dropdown();

    $('.pmd-tabs').pmdTab();

    // Propeller Select2
    // Simple Selectbox
    $(".select-simple").select2({
        theme: "bootstrap",
        minimumResultsForSearch: Infinity,
    });
    
    // multiple range slider with default tooltip open
    var pmdSliderRangeTooltip = document.getElementById('pmd-slider-range-tooltip');
    noUiSlider.create(pmdSliderRangeTooltip, {
        start: [0, 1000],
        connect: true,
        tooltips: [ wNumb({ decimals: 0 }), wNumb({ decimals: 0 }) ],
        range: {
            'min': 0,
            'max': 1000
        }
    });
                            
    var lower = document.getElementById('pmd-slider-range-tooltip-lower'),
        upper = document.getElementById('pmd-slider-range-tooltip-upper');

    pmdSliderRangeTooltip.noUiSlider.on('update', function ( values, handle ) {
    if ( handle ) {
        upper.value = values[handle];
    } else {
        lower.value = values[handle];
    }
});

$(window).scroll(function() {
    if($(this).scrollTop() > 100)  /*height in pixels when the navbar becomes non opaque*/ 
    {
        $('.menu').addClass('colored');
    } else {
        $('.menu').removeClass('colored');
    }
    });
});

// Show/hide specified div
function clickShow(w) {
    var x = document.getElementById(w);
    if (x.style.display === '') {
        x.style.display = 'block';
    } else {
        x.style.display = '';
    }
}

// Sidebar JS
var overlay = $('.pmd-sidebar-overlay');
var sidebar = $('.pmd-sidebar');
var lsidebar = $('.pmd-sidebar-left');
var rsidebar = $('.pmd-sidebar-right-fixed');
var sidebar = $('.pmd-sidebar');
var toggleButtons = $('.pmd-sidebar-toggle');

$(document).ready(function() {
    
    var overlay = $('.pmd-sidebar-overlay');
    var sidebar = $('.pmd-sidebar');
    var lsidebar = $('.pmd-sidebar-left');
    var rsidebar = $('.pmd-sidebar-right-fixed');
    var pmdnavbarsidebar = $('.pmd-navbar-sidebar');
    var toggleButtons = $('.pmd-sidebar-toggle');
    var pmdtopbartoggle = $('.topbar-fixed');

    // Left Sidebar
    $('.pmd-sidebar-toggle').on( 'click', function() {
        lsidebar.toggleClass('pmd-sidebar-open');
            if ((lsidebar.hasClass('pmd-sidebar-left-fixed') || lsidebar.hasClass('pmd-sidebar-right-fixed')) && lsidebar.hasClass('pmd-sidebar-open')) {
        overlay.addClass('pmd-sidebar-overlay-active');
            $('body').addClass("pmd-body-open")
        } else {
            overlay.removeClass('pmd-sidebar-overlay-active');
            $('body').removeClass("pmd-body-open")
        }
    });

    $( ".pmd-sidebar .dropdown-menu, .pmd-sidebar-dropdown .dropdown-menu" ).click(function(event) {
        event.stopPropagation();
    });

    // Right Sidebar
    $('.pmd-sidebar-toggle-right').on( 'click', function() {
        rsidebar.toggleClass('pmd-sidebar-open');
        if ((rsidebar.hasClass('pmd-sidebar-right')) && rsidebar.hasClass('pmd-sidebar-open')) {
            overlay.addClass('pmd-sidebar-overlay-active');
            $('body').addClass("pmd-body-open")
        } else {
            overlay.removeClass('pmd-sidebar-overlay-active');
            $('body').removeClass("pmd-body-open")
        }
    });

    // Right Sidebar
    $('.pmd-topbar-toggle').on( 'click', function() {
        pmdtopbartoggle.toggleClass('pmd-sidebar-open');
    });

    $('.topbar-close').on('click', function() {
        pmdtopbartoggle.removeClass('pmd-sidebar-open');
    });

    // Nave bar in Sidebar
    $('.pmd-navbar-toggle').on('click', function() {
        pmdnavbarsidebar.toggleClass('pmd-sidebar-open');
        if ((pmdnavbarsidebar.hasClass('pmd-navbar-sidebar')) && pmdnavbarsidebar.hasClass('pmd-sidebar-open')) {
            overlay.addClass('pmd-sidebar-overlay-active');
            $('body').addClass("pmd-body-open")
        } else {
            overlay.removeClass('pmd-sidebar-overlay-active');
            $('body').removeClass("pmd-body-open")
        }
    });

    // Overlay
    overlay.on( 'click', function() {
        $(this).removeClass('pmd-sidebar-overlay-active');
        $('.pmd-sidebar').removeClass('pmd-sidebar-open');
        $('.pmd-navbar-sidebar').removeClass('pmd-sidebar-open');
        $('body').removeClass("pmd-body-open")
         event.stopPropagation();
    });

    // Window load browser resize position
    if($(window).width() < 1200){
        sidebar.removeClass('pmd-sidebar-open pmd-sidebar-slide-push');
        lsidebar.addClass('pmd-sidebar-left-fixed');
        rsidebar.addClass('pmd-sidebar-right');
        toggleButtons.css('display', 'inherit');
        $('body').removeClass("pmd-body-open")
    }

});

// window resize position
$(window).resize(function(){
    if($(window).width() < 1200){
        sidebar.removeClass('pmd-sidebar-open pmd-sidebar-slide-push');
        lsidebar.addClass('pmd-sidebar-left-fixed');
        rsidebar.addClass('pmd-sidebar-right');
        toggleButtons.css('display', 'inherit');
        overlay.removeClass('pmd-sidebar-overlay-active');
        $('body').removeClass("pmd-body-open")
    } else{
        lsidebar.removeClass('pmd-sidebar-left-fixed').addClass('pmd-sidebar-open pmd-sidebar-slide-push');
        rsidebar.removeClass('pmd-sidebar-right');
        overlay.removeClass('pmd-sidebar-overlay-active');
        $('body').removeClass("pmd-body-open")
    }
});

(function(removeClass){
    jQuery.fn.removeClass = function( value ) {
        if ( value && typeof value.test === "function" ) {
            for ( var i = 0, l = this.length; i < l; i++ ) {
                var elem = this[i];
                if ( elem.nodeType === 1 && elem.className ) {
                    var classNames = elem.className.split( /\s+/ );

                    for ( var n = classNames.length; n--; ) {
                        if ( value.test(classNames[n]) ) {
                            classNames.splice(n, 1);
                        }
                    }
                    elem.className = jQuery.trim( classNames.join(" ") );
                }
            }
        } else {
            removeClass.call(this, value);
        }
        return this;
    }
})(jQuery.fn.removeClass);

// dropdown JS
$( document ).ready(function() {
    $('.pmd-dropdown .dropdown-menu').wrap( "<div class='pmd-dropdown-menu-container'></div>" );
    $('.pmd-dropdown .dropdown-menu').before('<div class="pmd-dropdown-menu-bg"></div>');
    
    var dropdown = $('.pmd-dropdown');
    var pmdsidebardropdown = function() {
        if ( $(window).width() < 767) {
            var w = dropdown.find('.dropdown-menu').outerWidth();
            var h = dropdown.find('.dropdown-menu').outerHeight();
            dropdown.find('.dropdown-menu-right').css("clip","rect(0 "+w+"px 0 "+w+"px)");
            dropdown.find('.pmd-dropdown-menu-top-left').css("clip","rect("+h+"px 0 "+h+"px 0)");
            dropdown.find('.pmd-dropdown-menu-top-right').css("clip","rect("+h+"px "+w+"px "+h+"px "+w+"px)");
            // Add slidedown animation to dropdown
            dropdown.off('show.bs.dropdown');
            dropdown.on('show.bs.dropdown', function(){
                var that = $(this).find('.dropdown-menu');
                var w = that.outerWidth();
                var h = that.outerHeight();
                var dcdmc = that.closest('.pmd-dropdown-menu-container');
                var dcdmbg = dcdmc.find('.pmd-dropdown-menu-bg');
                var $dataSidebar = $(this).find('.dropdown-toggle').attr("data-sidebar");
                var dropdowncenter = that.hasClass('pmd-dropdown-menu-center');
                if ( $dataSidebar == 'true') {
                    that.first().stop(true, true).slideDown(300);
                    $(this).addClass('pmd-sidebar-dropdown');
                } else if ( dropdowncenter ) {
                    $('.dropdown-menu').removeAttr('style');
                    that.first().stop(true, true).slideDown(300);
                } else {
                    dcdmc.css({'width':w + 'px', 'height':h + 'px'});
                    dcdmbg.css({'width':w + 'px', 'height':h + 'px'});
                    if( that.hasClass('dropdown-menu-right')){
                       setTimeout( function(){
                        that.css("clip","rect(0 "+w+"px "+h+"px 0)");
                       }, 10);
                       dcdmbg.addClass('pmd-dropdown-menu-bg-right');
                       dcdmc.css({"right":"0", "left":"auto"})
                    } else if (that.hasClass('pmd-dropdown-menu-top-left')){
                        setTimeout( function(){
                        that.css("clip","rect(0 "+w+"px "+h+"px 0)");
                        },10);
                        dcdmbg.addClass('pmd-dropdown-menu-bg-bottom-left');
                    } else if (that.hasClass('pmd-dropdown-menu-top-right')){
                        setTimeout( function(){
                        that.css("clip","rect(0 "+w+"px "+h+"px 0)");
                        },10);
                        dcdmbg.addClass('pmd-dropdown-menu-bg-bottom-right');
                        dcdmc.css({"right":"0", "left":"auto"})
                    } else {
                        setTimeout( function(){
                        that.css("clip","rect(0 "+w+"px "+h+"px 0)");
                        },10);
                    }
                }
            });
            // Add slideup animation to dropdown
            dropdown.off('hide.bs.dropdown');
            dropdown.on('hide.bs.dropdown', function(){
                var $dataSidebar = $(this).find('.dropdown-toggle').attr("data-sidebar");
                var dropdowncenter = $(this).find('.dropdown-menu').hasClass('pmd-dropdown-menu-center');
                var that = $(this).find('.dropdown-menu');
                var w = that.outerWidth();
                var h = that.outerHeight();
                var dcdmc = that.closest('.pmd-dropdown-menu-container');
                var dcdmbg = dcdmc.find('.pmd-dropdown-menu-bg');
                if ($dataSidebar == 'true') {
                    that.first().stop(true, true).slideUp(300);
                } else if (dropdowncenter) {
                    $('.dropdown-menu').removeAttr('style');
                    that.first().stop(true, true).slideUp(300);
                } else {
                    that.css("clip","rect(0 0 0 0)");
                    dcdmc.removeAttr('style');
                    dcdmbg.removeAttr('style');
                    if( that.hasClass('dropdown-menu-right')){
                        that.css("clip","rect(0 "+w+"px 0 "+w+"px)");
                    } else if (that.hasClass('pmd-dropdown-menu-top-left')){
                        that.css("clip","rect("+h+"px 0 "+h+"px 0)");
                    } else if (that.hasClass('pmd-dropdown-menu-top-right')){
                        that.css("clip","rect("+h+"px "+w+"px "+h+"px "+w+"px)");
                    } 
                }
            });
        } else {
            // Add slidedown animation to dropdown
            $('.dropdown-menu').removeAttr('style');
            var we = dropdown.find('.dropdown-menu').outerWidth();
            var he = dropdown.find('.dropdown-menu').outerHeight();
            dropdown.find('.dropdown-menu-right').css("clip","rect(0 "+we+"px 0 "+we+"px)");
            dropdown.find('.pmd-dropdown-menu-top-left').css("clip","rect("+he+"px 0 "+he+"px 0)");
            dropdown.find('.pmd-dropdown-menu-top-right').css("clip","rect("+he+"px "+we+"px "+he+"px "+we+"px)");
            
            dropdown.off('show.bs.dropdown');
            dropdown.on('show.bs.dropdown', function(){
                var hassidebar = $(this).closest('.pmd-sidebar').hasClass('pmd-sidebar');
                var dropdowncenter = $(this).find('.dropdown-menu').hasClass('pmd-dropdown-menu-center');
                var that = $(this).find('.dropdown-menu');
                var w = that.outerWidth();
                var h = that.outerHeight();
                var dcdmc = that.closest('.pmd-dropdown-menu-container');
                var dcdmbg = dcdmc.find('.pmd-dropdown-menu-bg');
                if (hassidebar) {
                    that.first().stop(true, true).slideDown();
                } else if ( dropdowncenter ) {
                    if(!$(this).parents().hasClass("pmd-sidebar")){
                        $('.dropdown-menu').removeAttr('style');
                    }
                    that.first().stop(true, true).slideDown();
                } else {
                    dcdmc.css({'width':w + 'px', 'height':h + 'px'});
                    dcdmbg.css({'width':w + 'px', 'height':h + 'px'});
                    if( that.hasClass('dropdown-menu-right')){
                       setTimeout( function(){
                        that.css("clip","rect(0 "+w+"px "+h+"px 0)");
                       }, 10);
                       dcdmbg.addClass('pmd-dropdown-menu-bg-right');
                       dcdmc.css({"right":"0", "left":"auto"})
                    } else if (that.hasClass('pmd-dropdown-menu-top-left')){
                        setTimeout( function(){
                        that.css("clip","rect(0 "+w+"px "+h+"px 0)");
                        },10);
                        dcdmbg.addClass('pmd-dropdown-menu-bg-bottom-left');
                    } else if (that.hasClass('pmd-dropdown-menu-top-right')){
                        setTimeout( function(){
                        that.css("clip","rect(0 "+w+"px "+h+"px 0)");
                        },10);
                        dcdmbg.addClass('pmd-dropdown-menu-bg-bottom-right');
                        dcdmc.css({"right":"0", "left":"auto"})
                    } else {
                        setTimeout( function(){
                        that.css("clip","rect(0 "+w+"px "+h+"px 0)");
                        },10);
                    }
                }
                this.closable = false;
            });
            dropdown.on('click', function(){
                var hassidebar = $(this).closest('.pmd-sidebar').hasClass('pmd-sidebar');
                if (hassidebar && !$(this).hasClass("open")) {
                    dropdown.removeClass("open");
                    $('.dropdown-menu').slideUp(300);
                }else if($(this).parents("aside").hasClass("pmd-sidebar")){
                    $('.dropdown-menu').slideUp(300);
                }
                
                this.closable = true; 
            });
            // Add slideup animation to dropdown
            dropdown.off('hide.bs.dropdown');
            dropdown.on('hide.bs.dropdown', function(){
                if($(this).parents("aside").hasClass("pmd-sidebar")) {
                    return this.closable;   
                }
                else{
                    var hassidebar = $(this).closest('.pmd-sidebar').hasClass('pmd-sidebar');
                    var dropdowncenter = $(this).find('.dropdown-menu').hasClass('pmd-dropdown-menu-center');
                    var that = $(this).find('.dropdown-menu');
                    var w = that.outerWidth();
                    var h = that.outerHeight();
                    var dcdmc = that.closest('.pmd-dropdown-menu-container');
                    var dcdmbg = dcdmc.find('.pmd-dropdown-menu-bg');
                    if (hassidebar) {
                        that.first().stop(true, true).slideUp(300);
                    }
                    else  if (dropdowncenter) {
                        if(!$(this).parents().hasClass("pmd-sidebar")){
                            $('.dropdown-menu').removeAttr('style');
                        }
                        that.first().stop(true, true).slideUp(300);
                    } else {
                        that.css("clip","rect(0 0 0 0)");
                        dcdmc.removeAttr('style');
                        dcdmbg.removeAttr('style');
                        if( that.hasClass('dropdown-menu-right')){
                            that.css("clip","rect(0 "+w+"px 0 "+w+"px)");
                        } else if (that.hasClass('pmd-dropdown-menu-top-left')){
                            that.css("clip","rect("+h+"px 0 "+h+"px 0)");
                        } else if (that.hasClass('pmd-dropdown-menu-top-right')){
                            that.css("clip","rect("+h+"px "+w+"px "+h+"px "+w+"px)");
                        } 
                    }
                }
            }); 
        }
    }
    pmdsidebardropdown();
    $(window).resize(function(){
        pmdsidebardropdown();
    });
}); 

// ripple effect JS
$( document ).ready(function() {
    $(".pmd-ripple-effect").on('mousedown touchstart', function(e) {
        var rippler = $(this);
        $('.ink').remove();
        // create .ink element if it doesn't exist
        if(rippler.find(".ink").length === 0) {
            rippler.append("<span class='ink'></span>");
        }
        var ink = rippler.find(".ink");
        // prevent quick double clicks
        ink.removeClass("animate");
        // set .ink diametr
        if(!ink.height() && !ink.width())
        {
            var d = Math.max(rippler.outerWidth(), rippler.outerHeight());
            ink.css({height: d, width: d});
        }
        // get click coordinates
        var x = e.pageX - rippler.offset().left - ink.width()/2;
        var y = e.pageY - rippler.offset().top - ink.height()/2;
        // set .ink position and add class .animate
        ink.css({
          top: y+'px',
          left:x+'px'
        }).addClass("animate");
        
        setTimeout(function(){ 
            ink.remove();
        }, 1500);
    })
})