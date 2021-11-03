class SpicesController < ApplicationController

    # GET /spices
    def index
        render json: Spice.all

    end

    # POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created

    end

    #PATCH /spices/:id
    def update
        spice = find_spice
        if spice
            spice.update(spice_params)
            render json: spice
        else render json: { error: "Spice not found" }, status: :not_found
        end

    end

    #DELETE /spices/:id
    def destroy
        spice = find_spice
        if spice
            spice.destroy
            head :no_content
        else render json: { error: "Spice not found" }, status: :not_found
        end

    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end
end
