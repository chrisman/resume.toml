bold: function() {
  return function(text, render) {
    return "<b>" + render(text) + "</b>";
  }
},
join: function() {
  return function(text, render) {
    return render(text).split(',').join(', ');
  }
},
formatdate: function() {
  return function(text, render) {
    return new Date(render(text)).toLocaleDateString(
      'en-us',
      {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      }
    ); 
  }
},
chicken: function() {
  return function(text, render) {
    return render(text).replace(/(.)(.)/g, (match) => match[0].toLowerCase() + match[1].toUpperCase())
  }
}
