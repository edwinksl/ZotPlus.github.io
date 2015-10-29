---
title: I Can Haz PDF?
---
<ul id="links">
</ul>

<a class="twitter-timeline" href="https://twitter.com/hashtag/icanhazpdf" data-widget-id="656961581427896324">#icanhazpdf Tweets</a>
<script>
  if (true || windows.location.hash == 'show') {
    alert(windows.location.hash);

    !function(d,s,id){
      var js,
          fjs=d.getElementsByTagName(s)[0],
          p=/^http:/.test(d.location)?'http':'https';
      if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}
    }(document,"script","twitter-wjs");

    var links = {
      'www.sci-hub.club': 'Sci-Hub',
      'gen.lib.rus.ec': 'lg',
      'free-books.us.to': 'lg',
      'ebookfi.org': 'lg',
      'libgen.info': 'lg',
      'bookos.org': 'lg',
      'libgen.in': 'lg',
      '95.31.43.252': 'lg'
    };

    var lg = 0;
    var ul = document.getElementById('links');
    Object.keys(links).forEach(function(host) {
      var name = links[host];
      if (name == 'lg') {
        lg++;
        name = 'LibGen mirror #' + lg;
      }
      var li = document.createElement('li');
      ul.appendChild(li);
      var a = document.createElement('a');
      li.appendChild(a);
      a.setAttribute('href', 'http://' + host);
      a.appendChild(document.createTextNode(name));
    });
  }
</script>
