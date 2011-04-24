class Article < ActiveRecord::Base
  default_scope :order => 'published_at DESC'
  paginates_per 10

  validates :title, :presence => true
  validates :content, :presence => true

  scope :published, lambda{
    where('published_at <= ?', Time.zone.now).where(:draft_flag => false)
  }

  before_save :slugging, :publishing

  def draft?
    self.draft_flag
  end

  # def render(template = :erb)
  #   if template == :erb
  #     self.content
  #   else
  #     self.__send__(template)
  #   end
  # end
  # 
  # def markdown
  #   Redcarpet.new(self.content).to_html
  # end

  private
  def slugging
    self.slug = self.title.gsub(/\s/, '-') if self.slug.blank?
  end
  def publishing
    if draft?
      self.published_at = nil if self.published_at.present?
    else
      self.published_at = Time.zone.now if self.published_at.blank?
      # self.published_at = Time.now if self.published_at.blank?
    end
  end
end
