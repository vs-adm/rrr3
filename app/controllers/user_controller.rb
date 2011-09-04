class UserController < ApplicationController
  def get
    u = User.find_by_session(request.session_options[:id])
    json = u.nil? ? {} : { :t1 => u.t1, :t2 => u.t2, :t3 => u.t3 }
    logger.debug json.inspect
    render :json => json
  end

=begin rdoc
  Persist user data
=end
  def edit
    session_id = request.session_options[:id]
    
    u = User.find_by_session(session_id)
    if u == nil
      u = User.new
      u.session = session_id
    end
    u.t1, u.t2, u.t3 = params[:t1], params[:t2], params[:t3]
    u.save
    
    render :nothing => true
  end

end
