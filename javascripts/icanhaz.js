var a,host,lg,li,links,name,ul;switch(window.location.hash){case"":break;case"#show":!function(d,s,id){var fjs,js,p;js=void 0;fjs=d.getElementsByTagName(s)[0];p=/^http:/.test(d.location)?"http":"https";if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs)}}(document,"script","twitter-wjs");links={"www.sci-hub.club":"Sci-Hub","gen.lib.rus.ec":"lg","free-books.us.to":"lg","ebookfi.org":"lg","libgen.info":"lg","bookos.org":"lg","libgen.in":"lg","95.31.43.252":"lg"};lg=0;ul=document.getElementById("links");for(host in links){name=links[host];if(name==="lg"){lg++;name="LibGen mirror #"+lg}li=document.createElement("li");ul.appendChild(li);a=document.createElement("a");li.appendChild(a);a.setAttribute("href","http://"+host);a.appendChild(document.createTextNode(name))}break;default:alert(window.location.hash+" => #show")}