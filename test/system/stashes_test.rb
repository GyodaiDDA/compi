require 'application_system_test_case'

class StashesTest < ApplicationSystemTestCase
  setup do
    @stash = stashes(:one)
  end

  test 'visiting the index' do
    visit stashes_url
    assert_selector 'h1', text: 'Stashes'
  end

  test 'should create stash' do
    visit stashes_url
    click_on 'New stash'

    click_on 'Create Stash'

    assert_text 'Stash was successfully created'
    click_on 'Back'
  end

  test 'should update Stash' do
    visit stash_url(@stash)
    click_on 'Edit this stash', match: :first

    click_on 'Update Stash'

    assert_text 'Stash was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Stash' do
    visit stash_url(@stash)
    click_on 'Destroy this stash', match: :first

    assert_text 'Stash was successfully destroyed'
  end
end
