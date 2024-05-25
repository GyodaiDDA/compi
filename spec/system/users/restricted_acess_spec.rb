require 'rails_helper'

describe 'Usuário' do
  context 'acessa área restrita' do
    it 'e não tem permissão' do
      # arrange
      patient = create(:user, email: 'new_user@example.com', password: 'password', account_type: 'patient')
      login_as(patient)
      # act
      visit prescriptions_path
      # assert
      expect(page).to have_content('Você não tem acesso à página que tentou acessar.')
    end

    it 'e tem permissão' do
      # arrange
      # professional = create(:user, email: 'professional@example.com', password: 'drowssap', account_type: 'professional')
      professional = create(:user, email: 'new_user@example.com', password: 'password', account_type: :professional)
      login_as(professional)
      # act
      visit prescriptions_path
      # assert
      expect(page).not_to have_content('Você não tem acesso à página que tentou acessar.')
    end
  end
end
