# resume.toml

## Movitation

1. Keep your resume in plain, organized, highly-editable text.

2. Separation of concerns: write content first. worry about formatting later.

3. Version control: keep your resume text in a git repository. track your changes. create new branches for large edits or for tailoring your resume while applying to a specific role. 

## About

This is a resume builder.

Data is stored in `resume.toml`.

It is validated against jsonresume's [json-schema][4].

And it is extracted as json with [taplo][1].

[1]: https://taplo.tamasfe.dev/

[4]: https://github.com/jsonresume/resume-schema/blob/master/schema.json

It is converted to [groff][2] markup
via [mustache][3] templates,
and then exported to pdf.

[2]: https://www.gnu.org/software/groff/manual/groff.html

[3]: https://mustache.github.io/

It also writes to html and text.

## You Will Need

1. groff 1.23.0: for typesetting and pdf output (with the ms macro package; it *should* be installed anywhere groff is installed)
2. mustache.js 4.2.0: for templates
3. taplo 0.8.1: toml toolkit. Provides conversion to JSON, formatting, and validation.
4. jq 1.6: json queries
5. (optional) just 1.14.0: just a command runner

## Getting Started

1. Edit `src/example.toml`
2. Run `just pdf`
3. View pdf

## Frequently Questioned Answers

Why TOML?
:  Because YAML is a drag.
:  Because JSON, while highly serializable, is highly annoying to write with its strict, verbose syntax.
:  Because while I love GNU Recfiles, they are just a little too annoying to query
