switch window.location.hash
  when '' then

  when '#show'
    !((d, s, id) ->
      js = undefined
      fjs = d.getElementsByTagName(s)[0]
      p = if /^http:/.test(d.location) then 'http' else 'https'
      if !d.getElementById(id)
        js = d.createElement(s)
        js.id = id
        js.src = p + '://platform.twitter.com/widgets.js'
        fjs.parentNode.insertBefore js, fjs
      return
    )(document, 'script', 'twitter-wjs')
  
    links = 
      'www.sci-hub.club': 'Sci-Hub'
      'gen.lib.rus.ec': 'lg'
      'free-books.us.to': 'lg'
      'ebookfi.org': 'lg'
      'libgen.info': 'lg'
      'bookos.org': 'lg'
      'libgen.in': 'lg'
      '95.31.43.252': 'lg'
  
    lg = 0
    ul = document.getElementById('links')
    for host, name of links
      if name == 'lg'
        lg++
        name = "LibGen mirror ##{lg}"
  
      li = document.createElement('li')
      ul.appendChild li
      a = document.createElement('a')
      li.appendChild a
      a.setAttribute 'href', 'http://' + host
      a.appendChild document.createTextNode(name)

  else
    alert("#{window.location.hash} => #show")
