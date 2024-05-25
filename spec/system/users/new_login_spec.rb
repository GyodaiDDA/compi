require 'rails_helper'

describe 'Usuário loga' do
  it 'a partir da home' do
    # arrange
    create(:user, email: 'new_user@example.com', password: 'password')
    visit root_path
    # act
    click_button 'fazer login'
    fill_in 'user_email', with: 'new_user@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    # assert
    expect(page).to have_content('Signed in successfully.')
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logado como new_user@example.com')
  end
end
