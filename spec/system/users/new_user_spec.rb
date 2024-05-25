require 'rails_helper'

describe 'Usuário cria conta' do
  it 'a partir da home' do
    # arrange
    visit root_path
    # act
    click_button 'criar usuário'
    fill_in 'user_email', with: 'new_user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    # assert
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(current_path).to eq(root_path)
    expect(page).to have_content('Logado como new_user@example.com')
  end
end
