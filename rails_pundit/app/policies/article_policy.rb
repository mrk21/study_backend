class ArticlePolicy < ApplicationPolicy
  def show?
    true
  end
  
  def new?
    self.user.admin?
  end
  
  def edit?
    self.user.admin?
  end
  
  def create?
    self.user.admin?
  end
  
  def update?
    self.user.admin?
  end
  
  def destroy?
    self.user.admin?
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
