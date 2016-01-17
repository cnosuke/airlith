class FaqsController <  ApplicationController

 # TODO: Check authorization

  def create
    @room = find_room
    @faq = Faq.new(faq_params.merge(room: @room))

    if @faq.save
      redirect_to @room, notice: 'Successfully created.'
    else
      redirect_to @room, notice: 'Error'
    end
  end

  # def update
  #   @faq = find_faq
  #   @faq.update_attributes(faq_params)
  #   if @faq.save
  #     redirect_to @faq, notice: 'Successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @faq = find_faq

    if @faq.destroy
      redirect_to @faq.room, notice: 'Successfully destroyed'
    else
      redirect_to :show, notice: 'Destroy failed.'
    end
  end


  private

  def find_room
    Room.find(params[:room_id])
  end

  def find_faq
    Faq.find(params[:id])
  end

  def faq_params
    params.require(:faq).permit(:question_ja, :answer_ja, :question_en, :answer_en)
  end
end
