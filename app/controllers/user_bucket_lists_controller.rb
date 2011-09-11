class UserBucketListsController < ApplicationController

  def create
    ubl = UserBucketList.new
    ubl.user_id = current_user.id
    ubl.associate_bucket_list_tag(params["user_bucket_list"]["name"])
    ubl.when_to_complete = params["user_bucket_list"]["when_to_complete"]
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

    #retrieve all users that match current bucketlist
    @user_matches = BucketListTag.find_matching_users(@current_bl)
    #remove current user from the list because we only want to display all matching users w/o current user
#    @user_matches.delete(current_user)

    respond_to do |format|
      format.js {render 'user_bucket_lists/find_matches'}
    end
  end

end
