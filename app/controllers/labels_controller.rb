class LabelsController
  def index
    @labels = Label.order(id: :asc).all
  end
end