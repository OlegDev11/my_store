class ApplicationController < ActionController::Base
  private

    def render_403                              #выводит ошибку 404(запрет доступа пользователю к методам)
      render file: "public/403", status: 403
    end

    def render_404                              #выводит ошибку 403(на ввод несуществующего id) 
      render file: "public/404", status: 404
    end

    #метод для запрета доступа пользователю к назначенным методам в(фильтры)
    def check_if_admin
      render_403 unless params[:admin]
    # render html: "Access denied", status: 403 unless params[:admin]
    end
end
