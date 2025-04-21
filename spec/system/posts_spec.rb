require 'rails_helper'

describe "Posts", type: :system do
  let(:user) { create(:user) }
  
  before do
    # rails 8 だと scope: :user が必要ぽい
    sign_in user, scope: :user
  end

  it '新規投稿できること' do
    visit new_post_path
    fill_in 'Content', with: '最初の状態'
    click_on 'Create Post'
    expect(page).to have_content('ポストを新規作成しました')
    expect(page).to have_content('最初の状態')
  end

  it '投稿を編集できること' do
    post = create(:post, content: '最初の状態', user: user)
    
    visit edit_post_path(post)

    fill_in 'Content', with: '更新した内容です'
    click_on 'Update Post'
    expect(page).to have_content('ポストを更新しました')
    expect(page).to have_content('更新した内容です')
  end

  it '他のユーザーの投稿は編集できないこと' do
    taro = create(:user)

    post = create(:post, content: '最初の状態', user: taro)
    
    visit edit_post_path(post)

    expect(page).to have_current_path(posts_path)
    expect(page).to have_content('ポストの作成者のみ編集可能です')
  end
end
