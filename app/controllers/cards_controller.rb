class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
  def show
    @card = Card.find(params[:id])
  end
  def new
  end
  def edit
    @card = Card.find(params[:id])
  end
  def create
    @card = Card.new(card_params)

    @card.save
    redirect_to cards_path
  end
  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to cards_path
  end
  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to cards_path
    else
      render 'edit'
  end
end
  private
    def card_params
      params.require(:card).permit(:title, :text)
    end
end
