class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :plants
end
