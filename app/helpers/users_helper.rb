module UsersHelper
  def gravator_for(user,options={:size =>50})
    raw("<img height='50px'>")
    #todo: install gravatar gem and uncomment line below
    # gravatar_image_tag(user.email.downcase,:alt=>user.name,:class=>'gravator',:gravator=>options)
  end
end
