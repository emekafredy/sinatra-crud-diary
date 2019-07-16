class DiaryController < ApplicationController
  get '/diary-list' do
		@notes = Diary.where(user_id: current_user.id).order("created_at DESC")
		erb :"diaries/index"
	end
end
