class UserPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end

    # def show?
    #   vet? || ownner?
    # end

    private

    def owner?
    user&.respond_to?(:role) && user.role == "owner"
    end

    def vet?
    user&.respond_to?(:role) && user.role == "vet"
    end
  end
end
