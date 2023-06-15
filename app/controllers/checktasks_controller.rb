# frozen_string_literal: true

# CheckTasks
class ChecktasksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_checktask, only: %i[update destroy]

  def index
    @checktasks = current_user.checktasks.order(done: :asc, updated_at: :desc, )
    @new_checktask = Checktask.new(user: current_user)
  end

  def create
    @checktask = current_user.checktasks.new(create_params)
    unless @checktask.save
      flash[:danger] = t('.flash.danger')
      return render :new
    end

    redirect_to checktasks_path, success: t('.flash.success')
  end

  def update
    done
    # @checktask.assign_attributes(update_params)
    # unless @checktask.save
    #  flash[:danger] = t('.flash.danger')
    #  return render :edit
    # end

    # redirect_to checktasks_path, primary: t('.flash.success')
  end

  def destroy
    flash[:danger] = t('.flash.danger') unless @checktask.destroy

    redirect_to checktasks_path
  end

  def done
    @checktask.done = !@checktask.done # (params[:done] == 'true')
    unless @checktask.save
      flash[:danger] = t('.flash.danger')
      return render :edit
    end

    redirect_to checktasks_path, primary: t('.flash.success')
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
