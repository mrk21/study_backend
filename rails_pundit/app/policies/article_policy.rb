class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end
  
  def show?
    true
  end
  
  def new?
    true
  end
  
  def edit?
    self.user.admin? or self.record.user == self.user
  end
  
  def create?
    self.user.admin? or self.record.user == self.user
  end
  
  def update?
    self.user.admin? or self.record.user == self.user
  end
  
  def destroy?
    self.user.admin? or self.record.user == self.user
  end
  
  class Scope < Scope
    def resolve
      scope
    end
  end
end
