var disqus_loaded = false;
function loadDisqus(){
  if(disqus_loaded) {
    return true;
  }
  if (window.location.hostname == "localhost") {
    return;
  }
  var pxleft = $(document).height() - $(window).scrollTop() - $(window).height();
  if(pxleft < 1000) {
    disqus_loaded = true;
    var dsq = $('<script />');
    dsq.attr({
      'type' : 'text/javascript',
      'async' : true,
      'src' : '//knutsblog.disqus.com/embed.js'
    });
    $('head').append(dsq);
  }
}
$(function() {
  $(document).scroll(loadDisqus);
  loadDisqus();
});
