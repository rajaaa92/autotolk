$(document).on 'ready page:load', ->
  if document.URL.includes("tolk/locales")
    alert "Double click anywhere to start autotranslating."
    autotranslatingClicked = 0
    $('#container').dblclick ->
      autotranslatingClicked += 1
      to_lang = document.URL.split('/').slice(-1).pop()
      $translation_rows = $('table.translations tbody tr:not(:first-child)')
      for $translation_row in $translation_rows
        original = $translation_row.querySelector('td.original textarea#translations__original_text').innerText
        $translationArea = $translation_row.querySelector('td.translation textarea')
        if $translationArea.innerText == '' && autotranslatingClicked == 1
          translate(original, to_lang, $translationArea)

translate = (original, to, textarea) ->
  $.get '/translate', {original: original, to: to}, ((response) ->
    if response.status == 200
      textarea.innerText = response.translated
  ), 'json'
