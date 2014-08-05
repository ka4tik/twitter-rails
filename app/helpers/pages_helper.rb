module PagesHelper
  def gravator_for(user,options={:size =>50})
    gravatar_image_tag(user.email.downcase,:alt=>user.name,:class=>'gravator',:gravator=>options)
  end
end
