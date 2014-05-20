class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :authenticate_scope!
  skip_load_and_authorize_resource

end