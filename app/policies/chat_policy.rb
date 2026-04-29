class ChatPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    def index?
      owner? || vet?
    end

  private

    def owner?
      user&.respond_to?(:role) && user.role == "owner"
    end

    def vet?
      user&.respond_to?(:role) && user.role == "vet"
    end
  end
end
