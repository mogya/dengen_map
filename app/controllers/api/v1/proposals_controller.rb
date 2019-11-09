# frozen_string_literal: true

# new spot proposal from user. It will contains as contribution.
class ProposalsController < ApplicationController
  before_action :set_proposal, only: %i[update destroy]

  # POST /api/v1/proposals.json
  def create
    @proposal = Contribution.new(contribution_params)
    @proposal.user_id = session[:user_id]
    @proposal.ip_address = request.remote_ip

    if @proposal.save
      render :show, status: :created, location: @proposal
    else
      render json: @proposal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/proposals/1.json
  def update
    # TODO: Need to implement session check. Anyone can update all data now!
    logger.warn(
      'TODO: Need to implement session check. Anyone can update all data now!'
    )

    if @proposal.update(contribution_params)
      render :show, status: :ok, location: @proposal
    else
      render json: @proposal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/proposals/1.json
  def destroy
    # TODO: Need to implement session check. Anyone can update all data now!
    logger.warn(
      'TODO: Need to implement session check. Anyone can update all data now!'
    )

    @proposal.destroy
    format.json { head :no_content }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_proposal
    @proposal = Contribution.find_by(
      id: params[:id],
      categroy: Contribution.categories[:proposal]
    )
  end

  def proposal_params
    # Don't beleive user_id and ip_address of params
    params.fetch(:proposal, {})
          .permit(
            :category, :status, :context, :spot_id, :name, :email
          )
  end

  def contribution_params
    params.merge(
      categroy: Contribution.categories[:proposal]
    )
  end
end
