Dir['*.md'].each{|md|
  html = File.basename(md, File.extname(md)) + '.html'
  puts html
  open(html, 'w'){|redir|
    redir.puts("
      <script type='text/javascript'>
        window.location.href = 'http://zotplus.github.io/zotero-better-bibtex/#{html}'
      </script>
    ")
  }
}
