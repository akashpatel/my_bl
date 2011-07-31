class UserBucketListsController < ApplicationController

  def create
    ubl = UserBucketList.new(params["user_bucket_list"])
    ubl.user_id = current_user.id
    ubl.save
    show
  end

  def show
    @user_bucket_list = UserBucketList.find(:last, :conditions => "user_id = #{current_user.id}")
    respond_to do |format|
      format.js {render 'user_bucket_lists/show'}
    end
  end

  def find_matches
    @current_bl = params["bl_name"]
    #pull user_profile info of user_ids that match the same activity.
    query_where = build_where_clause
    @user_matches = User.joins(:user_bucket_lists).where(query_where, "%#{@current_bl}%", current_user.id)

    respond_to do |format|
      format.js {render 'user_bucket_lists/find_matches'}
    end
  end

  def build_where_clause
    "user_bucket_lists.name like ? AND user_id != ?"
  end

end
