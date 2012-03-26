class User < ActiveRecord::Base

  def self.create_from_auth_hash(hash)
    attributes = %w(uid nickname last_name first_name)
    info = hash[:info].select {|k,v| attributes.include?(k)}
    user = User.where(:uid => hash[:uid]).first
    if user
      user.update_attributes(info)
    else
      user = User.new(info)
      user.uid = hash[:uid]
    end
    user.save
    user
  end

end
