toml:="src/example.toml"
tmpl:="template/pdf.tmpl"
outpdf:="dist/example.pdf"
outhtm:="dist/example.html"
outtxt:="dist/example.txt"


# show all recipes
default:
  just --list --unsorted


# format toml
fmt:
  taplo fmt {{toml}}


# validate toml
validate:
  taplo lint {{toml}}


# create view
_view:
  #!/usr/bin/env sh
  for f in "lib/lambdas.js" "{{toml}}"
  do
  if [ "$f" -nt lib/view.js ]
  then
  ed<<EOF
  i
  module.exports =
  .
  r !taplo get -f {{toml}} -o json
  -1s/$/,
  .r lib/lambdas.js
  w lib/view.js
  q
  EOF
  fi
  done


# create pdf
@pdf: _view
  -[ lib/view.js -nt {{outpdf}} ] \
  && echo "Creating PDF" \
  && mustache lib/view.js {{tmpl}} \
  | groff -ms -t -Tpdf > {{outpdf}} \
  || echo "No update"

# start a watcher
watch:
  ls {{toml}} {{tmpl}} | entr -c just pdf


# create text
@text: _view
  -[ lib/view.js -nt {{outtxt}} ] \
  && echo "Creating txt" \
  && mustache lib/view.js {{tmpl}} \
  | nroff -ms -t \
  | iconv -c -f utf-8 -t ascii \
  > {{outtxt}} \
  || echo "No update"


# create html
@html: _view
  -[ lib/view.js -nt {{outhtm}} ] \
  && echo "Creating html" \
  && mustache lib/view.js template/html.tmpl \
  > {{outhtm}} \
  || echo "No update"
