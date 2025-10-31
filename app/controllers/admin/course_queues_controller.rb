class Admin::CourseQueuesController < Admin::AdminController
  before_action :set_and_authorize_course, only: [:new]
  before_action :set_and_authorize_course_queue, except: [:new, :create]

  def new
    @course_queue = CourseQueue.new
    @course_queue.course = @course
  end

  def create
    @course_queue = CourseQueue.new(course_queue_params)

    unless current_user.instructor_for_course_queue?(@course_queue)
      return redirect_to root_url
    end

    if @course_queue.save
      redirect_to admin_course_url(@course_queue.course)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course_queue.update(course_queue_params)
      redirect_to admin_course_url(@course_queue.course)
    else
      render :edit
    end
  end

  def destroy
    @course_queue.destroy!

    redirect_to admin_course_url(@course_queue.course)
  end

  def beacon_id
    @course_queue = CourseQueue.find(params[:id])
    render json: { beacon_id: @course_queue.beacon_id }
  end

  private
  def set_and_authorize_course_queue
    @course_queue = CourseQueue.find(params[:id])

    unless current_user.instructor_for_course_queue?(@course_queue)
      redirect_to root_url
    end
  end

  def set_and_authorize_course
    @course = Course.find_by!(slug: params[:id])

    unless current_user.instructor_for_course?(@course)
      redirect_to root_url
    end
  end

  def course_queue_params
    params.require(:course_queue).permit(:name, :location, :description, :beacon_id, :course_id, :group_mode, :exclusive, :hide_details_from_students, :add_requested_at_jitter)
  end
end
