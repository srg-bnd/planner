# frozen_string_literal: true

class ChecktasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_checktask, only: %i[update destroy]

  def index
    @checktasks = current_user.checktasks.order(done: :asc, updated_at: :desc)
    @new_checktask = Checktask.new(user: current_user)
  end

  def create
    @checktask = current_user.checktasks.new(create_params)

    if @checktask.save
      redirect_to checktasks_path, success: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :new
    end
  end

  def update
    done
  end

  def destroy
    if @checktask.destroy
      redirect_to checktasks_path
    else
      flash[:danger] = t('.flash.danger')
    end
  end

  def done
    @checktask.done = !@checktask.done

    if @checktask.save
      redirect_to checktasks_path, primary: t('.flash.success')
    else
      flash[:danger] = t('.flash.danger')
      render :edit
    end
  end

  private

  def checktask_params
    params.require(:checktask).permit(
      :title,
      :date
    )
  end

  def create_params
    checktask_params
  end

  def update_params
    checktask_params
  end
end
