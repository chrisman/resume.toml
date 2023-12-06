# show all recipes
default:
  just --list --unsorted

# convert to json
json:
  taplo get -f resume.toml -o json

# format toml
fmt:
  taplo fmt resume.toml

# validate toml
validate:
  taplo lint resume.toml

# make groff
groff:
  just json | mustache - resume.template

# make pdf
pdf:
  just groff | groff -ms -t -Tpdf > resume.pdf

# example
example:
  taplo get -f example.toml -o json \
  | mustache - resume.template \
  | groff -ms -t -Tpdf \
  > example.pdf
