require 'bing_translator'

class TranslationsController < ApplicationController
  skip_before_action :authenticate_user!, :validate_subdomain

  def translate
    translator = BingTranslator.new( Autotolk.bing_client_id, Autotolk.bing_client_secret,
      false, Autotolk.azure_account_key)
    translated = translator.translate params[:original], :to => params[:to]
    render json: {status: 200, translated: translated}
  rescue Exception => e
    render json: {status: 500, error: e}
  end

end
