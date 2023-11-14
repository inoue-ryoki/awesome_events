class EventsController < ApplicationController
  skip_before_action :authenticate, only: :show

  def show
    @event = Event.find(params[:id])

    @current_event = Event.where(owner_id: current_user.id)
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "作成しました"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to root_path}
      else
        format.html { render :edit}
        format.js
      end
    end

  end

  def destroy
    @event = Event.find(params[:id])
    if @event.present?
      @event.destroy
      redirect_to root_path
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name, :place, :content, :start_at, :end_at
    )
  end
end
