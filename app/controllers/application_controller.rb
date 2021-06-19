class ApplicationController < ActionController::API
  def index
    render json: Actor.all.as_json
  end

  def show
    actor_id = params[:id]
    actor = Actor.find_by(id: actor_id)
    render json: actor.as_json
  end

  def create
    actor = Actor.new(
      first_name: params[:input_first_name],
      last_name: params[:input_last_name],
      known_for: params[:input_known_for]
    )
    actor.save
    render json: actor.as_json
  end
  
  def update
    actor_id = params[:id]
    actor = Actor.find_by(id: actor_id)
    actor.first_name = params[:input_first_name]
    actor.last_name = params[:input_last_name]
    actor.known_for = params[:input_known_for]
    actor.save
    render json: actor.as_json
  end

  def destroy
    actor_id = params[:id]
    actor = Actor.find_by(id: actor_id)
    render json: actor.as_json
    actor && actor.destroy
  end
end
