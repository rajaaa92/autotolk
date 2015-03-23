autotranslatingClicked = 0

$(document).on 'ready page:load', ->
  $( "#container div.translations" ).prepend( "<div id='autotranslate' style='text-align: right;'><button> Start autotranslating!</button></div>" )
  $('div#autotranslate').on 'click', 'button', ->
    startTranslating()

startTranslating = () ->
  autotranslatingClicked += 1
  to_lang = document.URL.split('?')[0].split('/').slice(-1).pop()
  $translation_rows = $('table.translations tbody tr:not(:first-child)')
  for $translation_row in $translation_rows
    original = $translation_row.querySelector('td.original textarea#translations__original_text').innerText
    $translationArea = $translation_row.querySelector('td.translation textarea')
    if $translationArea.innerText == '' && autotranslatingClicked == 1
      translate(original, to_lang, $translationArea)

translate = (original, to, textarea) ->
  $.get '/translate', {original: original, to: to}, ((response) ->
    if response.status >= 200 && response.status < 400
      textarea.innerText = response.translated
  ), 'json'
