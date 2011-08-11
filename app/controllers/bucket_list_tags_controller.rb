class BucketListTagsController < ActionController::Base

def search
    bl_tags = BucketListTag.search(params[:term])
    data = []
    bl_tags.each do |t|
      data << {:label => "#{t.name}",
               :value => "#{t.name}"}
    end
    render :status => 200, :json => data.to_json
  end
end