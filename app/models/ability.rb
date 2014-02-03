class Ability
  include CanCan::Ability

  def initialize(usuario_logado)
    usuario_logado ||= Usuario.new # guest user (not logged in)

    if usuario_logado.persisted?
      if usuario_logado.is?(Usuario::ADMIN)
        can :manage, :all
    	else
        can :read, :all
   	  end

    end
    can :manage, :all
  end
end