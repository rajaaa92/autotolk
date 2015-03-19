class TranslationsController < ApplicationController
  skip_before_action :authenticate_user!, :validate_subdomain

  def translate
    translated = AutoTranslator.new(original: params[:original], to: params[:to]).perform
    render json: {status: 200, translated: translated}
  rescue Exception => e
    render json: {status: 500, error: e}
  end

end
