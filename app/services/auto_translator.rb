require 'bing_translator'

class AutoTranslator

  def initialize parameters = { original: nil, to: nil }
    @translator = nil
    @translation = nil
    @original = parameters[:original]
    @to = parameters[:to]
  end

  def perform
    set_translator
    raw_translate
    fix_special_characters
    @translation
  end

  private

  def set_translator
    @translator = BingTranslator.new( Autotolk.bing_client_id, Autotolk.bing_client_secret,
      false, Autotolk.azure_account_key)
  end

  def raw_translate
    @translation = @translator.translate @original, to: @to
  end

  def fix_special_characters
    @translation.gsub!('% {', '%{')
    @translation.gsub!(/{(?<word>\w+)} %[^{]*/, '%{\k<word>}')
    @translation.gsub!('---', '')
  end
end
