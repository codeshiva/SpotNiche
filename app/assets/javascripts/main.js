$(window).load(function() { // makes sure the whole site is loaded
      $('#status').fadeOut(); // will first fade out the loading animation
      $('#preloader').delay(500).fadeOut('fast');
      $('.mask').delay(500).fadeOut('slow'); // will fade out the white DIV that covers the website.
      $('body').delay(350).css({'overflow':'visible'});
    })

$(document).ready(function() {
 
    $('.more-jobs a').click(function(e){
      e.preventDefault();
      var $this = $(this);
      $this.toggleClass('more-jobs a');
      if($this.hasClass('more-jobs a')){
        $this.text('View less jobs');     
      } else {
        $this.text('View more jobs');
      }
    });

    $('.more-jobs a').click(function(){
      $('.table tr.hide-jobs').toggle();
    });


 
})