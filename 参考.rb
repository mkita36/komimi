require 'rails_helper'

describe 'Admin::News', type: :request do
  describe 'GET /admin/news' do
    before do
      login_user
      create(:news, title: 'お知らせ1 ')
      create(:news, title: 'お知らせ2 ')
    end

    it 'リクエストが成功すること' do
      get admin_news_index_path
      expect(response).to have_http_status(200)
    end

    it 'お知らせが表示されていること' do
      get admin_news_index_path
      expect(response.body).to include 'お知らせ1'
      expect(response.body).to include 'お知らせ2'
    end
  end

  describe 'GET /admin/news#new' do
    before do
      login_user
    end

    it 'リクエストが成功すること' do
      get new_admin_news_path
      expect(response).to have_http_status(200)
    end

    it 'News登録画面が表示されていること' do
      get new_admin_news_path
      expect(response.body).to include 'NEWS登録'
    end
  end

  describe 'GET /admin/news#edit' do
    before do
      login_user
      @news = create(:news)
    end

    it 'リクエストが成功すること' do
      get edit_admin_news_path(@news)
      expect(response).to have_http_status(200)
    end

    it 'News編集画面が表示されること' do
      get edit_admin_news_path(@news)
      expect(response.body).to include('NEWS編集')
    end
  end

  describe 'POST admin/news#create' do
    before do
      login_user
      @brand = create(:brand)
    end

    context '正常系' do
      it 'リクエストが成功すること' do
        post admin_news_index_path, params: { news: attributes_for(:news) }
        expect(response.status).to eq 302
      end

      it 'お知らせが登録されること' do
        expect do
          post admin_news_index_path, params: { news: attributes_for(:news) }
        end.to change(News, :count).by(1)
      end

      it 'リダイレクトされること' do
        post admin_news_index_path, params: { news: attributes_for(:news) }
        expect(response).to redirect_to admin_news_index_path
      end
    end

    context '異常系' do
      it 'リクエストが成功すること' do
        post admin_news_index_path, params: { news: attributes_for(:news, :invalid) }
        expect(response.status).to eq 200
      end

      it 'お知らせが登録されないこと' do
        expect do
          post admin_news_index_path, params: { news: attributes_for(:news, :invalid) }
        end.not_to change(News, :count)
      end

      it 'バリデーションエラーが表示されること' do
        post admin_news_index_path, params: { news: attributes_for(:news, :invalid) }
        expect(response.body).to include 'タイトルを入力してください'
      end
    end
  end

  describe 'PATCH admin/news#update' do
    before do
      login_user
      @brand = create(:brand)
      @news = create(:news, title: 'おしらせ更新前')
    end

    context '正常系' do
      it 'リクエストが成功すること' do
        patch admin_news_path(@news), params: { news: attributes_for(:news, title: 'おしらせ変更後') }
        expect(response.status).to eq 302
      end

      it 'お知らせが更新されること' do
        expect do
          patch admin_news_path(@news), params: { news: attributes_for(:news, title: 'おしらせ変更後') }
        end.to change { News.find(@news.id).title }.from('おしらせ更新前').to('おしらせ変更後')
      end

      it 'リダイレクトされること' do
        patch admin_news_path(@news), params: { news: attributes_for(:news, title: 'おしらせ変更後') }
        expect(response).to redirect_to admin_news_index_path
      end
    end

    context '異常系' do
      it 'リクエストが成功すること' do
        patch admin_news_path(@news), params: { news: attributes_for(:news, :invalid) }
        expect(response.status).to eq 200
      end

      it 'お知らせが登録されるないこと' do
        expect do
          patch admin_news_path(@news), params: { news: attributes_for(:news, :invalid) }
        end.not_to change(News, :count)
      end

      it 'バリデーションエラーが表示されること' do
        patch admin_news_path(@news), params: { news: attributes_for(:news, :invalid) }
        expect(response.body).to include 'タイトルを入力してください'
      end
    end
  end

  describe 'DELETE admin/news#destroy' do
    before do
      login_user
    end
    let!(:news) { create(:news) }

    it 'リクエストが成功すること' do
      delete admin_news_path(news)
      expect(response.status).to eq 202
    end

    it 'おしらせが削除されていること' do
      expect do
        delete admin_news_path(news)
      end.to change(News, :count).by(-1)
    end
  end
end