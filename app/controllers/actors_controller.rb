class ActorsController < ApplicationController
  def index
    render json: Actor.order(:last_name).as_json
  end

  def show
    actor_id = params[:id]
    actor = Actor.find_by(id: actor_id)
    render json: actor.as_json
  end

  def create
    actor = Actor.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for],
      gender: params[:gender],
      age: params[:age]
    )
    if actor.save
      render json: actor.as_json
    else
      render json: actor.errors.full_messages
    end
  end
  
  def update
    actor_id = params[:id]
    actor = Actor.find_by(id: actor_id)
    actor.first_name = params[:first_name] || actor.first_name
    actor.last_name = params[:last_name] || actor.last_name
    actor.known_for = params[:known_for] || actor.known_for
    actor.gender = params[:gender] || actor.gender
    actor.age = params[:age] || actor.age
    if actor.save
      render json: actor.as_json
    else
      render json: actor.errors.full_messages
    end
  end

  def destroy
    actor_id = params[:id]
    actor = Actor.find_by(id: actor_id)
    render json: actor.as_json
    actor && actor.destroy
  end
end
