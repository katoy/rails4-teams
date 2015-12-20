# coding: utf-8
module Api
  module V1
    # People
    class PeopleController < ApplicationController
      # 動作確認用にCSRFを無効化しています
      skip_before_action :verify_authenticity_token

      def index
        @people = Person.all
      end
    end
  end
end
