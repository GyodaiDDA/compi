class ApplicationController < ActionController::Base
  private

  def restrict_access(permited_account_types)
    return if current_user&.authorized?(permited_account_types)

    redirect_to root_path, alert: 'Você não tem acesso à página que tentou acessar.'
  end
end
