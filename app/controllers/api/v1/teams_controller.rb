# coding: utf-8
module Api
  module V1
    # Teams
    class TeamsController < ApplicationController
      # 動作確認用にCSRFを無効化しています
      skip_before_action :verify_authenticity_token

      def index
        @teams = Team.all
      end
    end
  end
end
