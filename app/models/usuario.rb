# encoding: utf-8
class Usuario < ActiveRecord::Base
  audited :except => [:encrypted_password, :reset_password_token, :reset_password_sent_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token, :locked_at]

  devise :database_authenticatable, :registerable, :lockable, :recoverable, :trackable, :timeoutable, :validatable

  attr_accessible :nome, :email, :password, :password_confirmation, :roles,  :imagem, :remove_imagem

  validates :nome, :email, :presence => true

  mount_uploader :imagem, ImagemUsuarioUploader

  belongs_to :cidade

  has_many :comentarios


  delegate :nome, :estado, :to => :cidade, :prefix => true

  ROLES = [ADMIN = 'Administrador']

  def to_param
    # "#{id}-#{PermalinkFu.escape(nome)}"
    "#{id}"
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end

  protected
    def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end
end