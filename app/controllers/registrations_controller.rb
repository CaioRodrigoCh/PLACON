class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    puts '========'
    puts params
    
    resource.update_without_password(params)
  end
end
