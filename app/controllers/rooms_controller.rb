class RoomsController <  ApplicationController

  def index
    @rooms = Room.all
  end

  def show
    @room = find_room
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params.merge(owner: current_user))

    if @room.save
      redirect_to @room, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def edit
    @room = find_room
  end

  def update
    @room = find_room
    @room.update_attributes(room_params)
    if @room.save
      redirect_to @room, notice: 'Successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @room = find_room

    if @room.destroy
      redirect_to owner_path, notice: 'Successfully destroyed'
    else
      redirect_to :show, notice: 'Destroy failed.'
    end
  end


  private

  def find_room
    Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:country, :zipcode, :address, :name, :description)
  end
end
