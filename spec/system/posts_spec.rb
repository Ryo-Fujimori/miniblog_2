require 'rails_helper'

describe "Posts", type: :system do
  it '新規投稿できること' do
    user = create(:user)
    sign_in user, scope: :user
    visit new_post_path
    fill_in 'Content', with: 'This is the content of my first post.'
    click_on 'Create Post'
    expect(page).to have_content('ポストを新規作成しました')
    expect(page).to have_content('This is the content of my first post.')
  end

  it '投稿を編集できること' do
    user = create(:user)
    post = create(:post, content: '最初の状態', user: user)
    sign_in user, scope: :user
    
    visit edit_post_path(post)

    fill_in 'Content', with: '更新した内容です'
    click_on 'Update Post'
    expect(page).to have_content('ポストを更新しました')
    expect(page).to have_content('更新した内容です')
  end
end
