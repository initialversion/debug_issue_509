class QueuesController < ApplicationController
  def index
    @queues = Queue.all

    render("queues/index.html.erb")
  end

  def show
    @queue = Queue.find(params[:id])

    render("queues/show.html.erb")
  end

  def new
    @queue = Queue.new

    render("queues/new.html.erb")
  end

  def create
    @queue = Queue.new

    @queue.genres = params[:genres]
    @queue.event_type = params[:event_type]
    @queue.status = params[:status]
    @queue.activity_type = params[:activity_type]
    @queue.name = params[:name]
    @queue.public_queue = params[:public_queue]
    @queue.allow_participants_to_invite = params[:allow_participants_to_invite]
    @queue.group_or_event = params[:group_or_event]

    save_status = @queue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/queues/new", "/create_queue"
        redirect_to("/queues")
      else
        redirect_back(:fallback_location => "/", :notice => "Queue created successfully.")
      end
    else
      render("queues/new.html.erb")
    end
  end

  def edit
    @queue = Queue.find(params[:id])

    render("queues/edit.html.erb")
  end

  def update
    @queue = Queue.find(params[:id])

    @queue.genres = params[:genres]
    @queue.event_type = params[:event_type]
    @queue.status = params[:status]
    @queue.activity_type = params[:activity_type]
    @queue.name = params[:name]
    @queue.public_queue = params[:public_queue]
    @queue.allow_participants_to_invite = params[:allow_participants_to_invite]
    @queue.group_or_event = params[:group_or_event]

    save_status = @queue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/queues/#{@queue.id}/edit", "/update_queue"
        redirect_to("/queues/#{@queue.id}", :notice => "Queue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Queue updated successfully.")
      end
    else
      render("queues/edit.html.erb")
    end
  end

  def destroy
    @queue = Queue.find(params[:id])

    @queue.destroy

    if URI(request.referer).path == "/queues/#{@queue.id}"
      redirect_to("/", :notice => "Queue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Queue deleted.")
    end
  end
end
