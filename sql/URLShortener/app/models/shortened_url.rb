# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint           not null, primary key
#  long_url     :string           not null
#  short_url    :string           not null
#  submitter_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :submitter, presence: true
  validates :short_url, uniqueness: true
  # validate :no_spamming, :nonpremium_max

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit,
    dependent: :destroy

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :visitor

  def self.random_code
    loop do
      random_code = SecureRandom.urlsafe_base64(16)
      return random_code unless ShortenedUrl.exists?(short_url: random_code)
    end
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      submitter_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
    )
  end

  def self.prune(n)
    ShortenedUrl
      .joins(:submitter)
      .joins('LEFT JOIN visits ON visits.shortened_url_id = shortened_urls.id')
      .where("(shortened_urls.id IN (
        SELECT shortened_urls.id
        FROM shortened_urls
        JOIN visits
        ON visits.shortened_url_id = shortened_urls.id
        GROUP BY shortened_urls.id
        HAVING MAX(visits.created_at) < \'#{n.minute.ago}\'
      ) OR (
        visits.id IS NULL and shortened_urls.created_at < \'#{n.minutes.ago}\'
      )) AND users.premium = \'f\'")
      .destroy_all
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select('user_id').distinct.count
  end

  def num_recent_uniques
    visits
      .select('user_id')
      .where('created_at > ?', 10.minutes.ago)
      .distinct
      .count
  end

  private

  def no_spamming
    last_minute = ShortenedUrl
      .where('createed_at >= ?', 1.minute.ago)
      .where(submitter_id: submitter_id)
      .length

    errors[:maximum] << 'of five short urls per minute' if last_minute >= 5
  end

  def nonpremium_max
    return if User.find(self.submitter_id).premium

    number_of_urls =
      ShortenedUrl.where(submitter_id: submitter_id).length

    errors[:Only] << 'premium members can create more than 5 short urls' if number_of_urls >= 5
  end
end
