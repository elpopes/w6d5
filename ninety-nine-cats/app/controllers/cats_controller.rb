class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat)
        else
            flash.now[:erros] = @cat.errors.full_messages
            render :new
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def edit
        @cat = cat.find(params[:id])
        render :edit
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def update
        @cat = Cat.find(params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            flash.new[:errors] = @cat.errors.full_messages
            render :edit
        end
    end

    private

    def cat_params
        params.require(:book).permit(:birth_date, :color, :description, :name, :sex)
    end

end