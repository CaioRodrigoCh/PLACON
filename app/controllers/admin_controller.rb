class AdminController < ApplicationController
  def users_index
    @user = User.all
  end

  def make_admin 
    user = User.find(params[:id])
    if user.admin == false
    user.update(admin: true)
    # else
    # user.update(admin: 0)
    end

    redirect_to admin_users_index_path
  end

  def deny_access
    user = User.find(params[:id])
    if user.ativo?
    user.update(status: :inativo)
    else
    user.update(status: :ativo)
    end

    redirect_to admin_users_index_path
  end

  def allow_access
    user = User.find(params[:id])
    if user.em_analise?
    user.update(status: :ativo)
    end

    redirect_to admin_users_index_path
  end

end
